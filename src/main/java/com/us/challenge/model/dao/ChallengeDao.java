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

public class ChallengeDao {
	
	private Properties prop = new Properties();
		
	public ChallengeDao() {
		try {
			prop.loadFromXML(new FileInputStream( ChallengeDao.class.getResource("/db/sql/challenge-mapper.xml").getPath() ));
		} catch (IOException e) {
			e.printStackTrace();
		}
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
	
	// 관리자_챌린지 리스트 조회
	public ArrayList<Challenge> selectAdList(Connection conn) {
		// select => ResultSet(여러 행) => ArrayList<Challenge>
		ArrayList<Challenge> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdList");
		
		try {
			pstmt = conn.prepareStatement(sql);
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

	
	
		
		
}
