package com.us.member.model.dao;

import static com.us.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.us.common.model.vo.PageInfo;
import com.us.cs.qna.model.vo.Qna;
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
			
			pstmt.setString(12, m.getUserStatus());
			
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
	
	// 회원정보 수정
	public int updateMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserPwd());
			pstmt.setString(2, m.getUserName());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getZonecode());
			pstmt.setString(6, m.getAddress());
			pstmt.setString(7, m.getAddrExtra());
			pstmt.setString(8, m.getAddrDetail());
			pstmt.setString(9, m.getUserBirth());
			pstmt.setString(10, m.getGender());
			pstmt.setString(11, m.getUserId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	// 회원 포인트 조회
	
	
	
	// 회원 탈퇴
	public int deleteMember(Connection conn, String userId, String userPwd) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// listCount 조회
	public int selectListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
		
	// 전체 목록 조회
	public ArrayList<Member> selectMemberList(Connection conn, PageInfo pi){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectMemberList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Member(rset.getInt("USER_NO")
							   , rset.getString("USER_ID")
							   , rset.getString("USER_PWD")
							   , rset.getString("USER_NAME")
							   , rset.getString("EMAIL")
							   , rset.getString("PHONE")
							   , rset.getString("ZONECODE")
							   , rset.getString("ADDRESS")
							   , rset.getString("ADDR_EXTRA")
							   , rset.getString("ADDR_DETAIL")
							   , rset.getDate("USER_ENROLL_DATE")
							   , rset.getString("USER_STATUS")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 회원 검색
	public ArrayList<Member> searchMemberList(Connection conn, PageInfo pi, String keyword){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<>();
		
		String sql = prop.getProperty("searchMemberList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + keyword + "%");
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Member(rset.getInt("USER_NO")
							   , rset.getString("USER_ID")
							   , rset.getString("USER_PWD")
							   , rset.getString("USER_NAME")
							   , rset.getString("EMAIL")
							   , rset.getString("PHONE")
							   , rset.getString("ZONECODE")
							   , rset.getString("ADDRESS")
							   , rset.getString("ADDR_EXTRA")
							   , rset.getString("ADDR_DETAIL")
							   , rset.getDate("USER_ENROLL_DATE")
							   , rset.getString("USER_STATUS")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 관리자 회원 삭제
	public int adDeleteMember(Connection conn, String a) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("adDeleteMember");
		
		// 동적 sql문
		sql += "WHERE USER_NO IN ("; 
		
		String[] aArr = a.split(",");  // ["3", "4"]
		for(int i = 0; i < aArr.length; i++) {
			sql += aArr[i];
			if(i != aArr.length-1) {
				sql += ",";
			}
		}
		
		sql += ")";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;	
	}
	
	// 회원 번호로 정보 조회
	public Member selectMember(Connection conn, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member(rset.getString("USER_ID")
							 , rset.getString("USER_PWD")
							 , rset.getString("USER_NAME")
							 , rset.getString("EMAIL")
							 , rset.getString("PHONE")
							 , rset.getString("ZONECODE")
							 , rset.getString("ADDRESS")
							 , rset.getString("ADDR_EXTRA")
							 , rset.getString("ADDR_DETAIL")
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
	
	public int adUpdateMember(Connection conn, String a, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("adUpdateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserPwd());
			pstmt.setString(2, m.getUserName());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getZonecode());
			pstmt.setString(6, m.getAddress());
			pstmt.setString(7, m.getAddrExtra());
			pstmt.setString(8, m.getAddrDetail());
			pstmt.setString(9, a);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
