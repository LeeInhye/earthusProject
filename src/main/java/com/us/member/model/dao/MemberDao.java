package com.us.member.model.dao;

import static com.us.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.us.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		// 읽어들일 파일 : member-mapper.xml
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// 아이디 중복 체크
	public int checkId(Connection conn, String inputId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String sql = prop.getProperty("checkId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputId);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	// 이메일 중복 체크
	public int checkEmail(Connection conn, String inputEmail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String sql = prop.getProperty("checkEmail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputEmail);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	// 전화번호 중복 체크
	public int checkPhone(Connection conn, String inputPhone) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String sql = prop.getProperty("checkPhone");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputPhone);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	// 회원가입시 insert
	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getZonecode());
			pstmt.setString(7, m.getAddress());
			pstmt.setString(8, m.getAddrExtra());
			pstmt.setString(9, m.getAddrDetail());
			pstmt.setString(10, m.getUserBirth());
			pstmt.setString(11, m.getGender());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 로그인
	public Member loginMember(Connection conn, String userId, String userPwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member(rset.getInt(1)
							 , rset.getString(2)
							 , rset.getString(3)
							 , rset.getString(4)
							 , rset.getString(5)
							 , rset.getString(6)
							 , rset.getString(7)
							 , rset.getString(8)
							 , rset.getString(9)
							 , rset.getString(10)
							 , rset.getString(11)
							 , rset.getString(12)
							 , rset.getDate(13)
							 , rset.getDate(14)
							 , rset.getString(15)
							  );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	
	// 아이디 찾기
	public String findId(Connection conn, String inputName, String inputEmail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String findId = "";
		
		String sql = prop.getProperty("findId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputName);
			pstmt.setString(2, inputEmail);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				findId = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return findId;
	}
	
	
	// 비밀번호 찾기
	public int findPwd(Connection conn, String inputId, String inputName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String sql = prop.getProperty("findPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputId);
			pstmt.setString(2, inputName);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	// 인증 메일을 보낼 이메일 조회
	public String enterEmail(Connection conn, String inputId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String enterEmail = "";
		
		String sql = prop.getProperty("enterEmail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputId);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				enterEmail = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return enterEmail;
	}
	
	// 비밀번호 변경
	public int updatePwd(Connection conn, String inputId, String newPwd) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updatePwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, inputId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
