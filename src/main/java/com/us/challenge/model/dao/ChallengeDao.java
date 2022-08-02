package com.us.challenge.model.dao;

import static com.us.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.us.challenge.model.vo.Challenge;
import com.us.common.model.vo.Attachment;
import com.us.common.model.vo.PageInfo;
import com.us.contents.model.vo.Contents;

public class ChallengeDao {
	
	private Properties prop = new Properties();
		
	public ChallengeDao() {
		try {
			prop.loadFromXML(new FileInputStream( ChallengeDao.class.getResource("/db/sql/challenge-mapper.xml").getPath() ));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 페이징바_현재 총 게시글 갯수
	public int selectListCount(Connection conn) {
		// select문 => ResultSet(숫자 한 개) => listCount
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	// 관리자_챌린지 리스트 조회
	public ArrayList<Challenge> selectAdList(Connection conn, PageInfo pi) {
		// select => ResultSet(여러 행) => ArrayList<Challenge>
		ArrayList<Challenge> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Challenge(rset.getInt("chall_no"),
									   rset.getString("chall_title"),
									   rset.getInt("chall_point"),
									   rset.getDate("chall_enroll_date"),
									   rset.getInt("chall_cmnt")
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
	
	// 관리자_챌린지 작성
	public int insertChall(Connection conn, Challenge ch) {
		// challenge에 insert => 처리된 행 수
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertChall");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ch.getChallTitle());
			pstmt.setString(2, ch.getChallContent());
			pstmt.setInt(3, ch.getChallPoint());
			pstmt.setString(4, ch.getChallThumbnail());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertAttachment(Connection conn, Attachment at) {
		// attachment에 insert => 처리된 행 수
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	// 관리자_챌린지 선택 삭제
	public int deleteChall(Connection conn, String challNo) {
		// update => 처리된 행 수
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteChall");
		
		// 동적 sql문
		sql += "WHERE CHALL_NO IN ("; 
		
		String[] challArr = challNo.split(",");  // ["3", "4"]
		for(int i=0; i<challArr.length; i++) {
			sql += challArr[i];
			if(i != challArr.length-1) {
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


	
}
