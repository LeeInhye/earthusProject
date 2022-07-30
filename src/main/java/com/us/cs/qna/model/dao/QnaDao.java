package com.us.cs.qna.model.dao;

import static com.us.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.us.common.model.vo.Attachment;
import com.us.common.model.vo.PageInfo;
import com.us.cs.qna.model.vo.Qna;

public class QnaDao {
	
	Properties prop = new Properties();
	
	public QnaDao() {
		
		// 읽어들일 파일 : customerService-mapper.xml
		String filePath = QnaDao.class.getResource("/db/sql/customerService-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	// 전체 목록 조회
	public ArrayList<Qna> selectQnaList(Connection conn, PageInfo pi){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Qna> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectQnaList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Qna(rset.getInt("QNA_NO")
							   , rset.getString("USER_ID")
							   , rset.getString("QNA_TITLE")
							   , rset.getString("QNA_TITLE")
							   , rset.getString("QNA_FILE")
							   , rset.getString("QNA_EMAIL")
							   , rset.getString("QNA_PHONE")
							   , rset.getString("QNA_PWD")
							   , rset.getString("USER_NAME")
							   , rset.getString("QNA_ANSWER")
							   , rset.getDate("QNA_ENROLL_DATE")
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
	
	
	// 작성
	public int insertQna(Connection conn, Qna q) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, q.getQnaWriter());
			pstmt.setString(2, q.getQnaTitle());
			pstmt.setString(3, q.getQnaContent());
			pstmt.setString(4, q.getQnaEmail());
			pstmt.setString(5, q.getQnaPhone());
			pstmt.setString(6, q.getQnaPwd());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 첨부파일 insert
	public int insertAttach(Connection conn, Attachment at) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertAttach");
		
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
	
	
	// 글 조회
	public Qna selectQna(Connection conn, int a) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Qna q = null;
		
		String sql = prop.getProperty("selectQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, a);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				q = new Qna(rset.getInt("QNA_NO")
						  , rset.getString("USER_ID")
						  , rset.getString("QNA_TITLE")
						  , rset.getString("QNA_CONTENT")
						  , rset.getString("QNA_FILE")
						  , rset.getString("QNA_ANSWER")
						  , rset.getDate("QNA_ENROLL_DATE")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return q;
	}
	
	public Attachment selectAttachment(Connection conn, int a) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Attachment at = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, a);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				at = new Attachment(rset.getInt("FILE_NO")
								  , rset.getString("ORIGIN_NAME")
								  , rset.getString("CHANGE_NAME")
								  , rset.getString("FILE_PATH")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return at;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
