package com.us.product.model.dao;

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
import com.us.product.model.vo.Review;

public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
		try {
			prop.loadFromXML( new FileInputStream( ReviewDao.class.getResource("/db/sql/review-mapper.xml").getPath() ) );
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	// 마이페이지의 리뷰 리스트를 조회해오는 selectList 메소드
	public ArrayList<Review> selectList(Connection conn, int userNo){
		ArrayList<Review> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(
							rset.getInt("REV_NO"),
							rset.getInt("USER_NO"),
							rset.getString("PRO_CODE"),
							rset.getString("PRO_NAME"),
							rset.getString("PRO_IMG_PATH"),
							rset.getDate("REV_DATE"),
							rset.getInt("REV_RATE"),
							rset.getString("REV_CONTENT"),
							rset.getString("REV_TYPE")
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
	
	
	// 상품 디테일 뷰에서 해당 상품에 대한 리스트 조회하는 메소드
	public ArrayList<Review> selectList(Connection conn, String proCode){
		ArrayList<Review> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectProList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, proCode);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(
							rset.getInt("REV_NO"),
							rset.getInt("USER_NO"),
							rset.getString("PRO_CODE"),
							rset.getString("USER_NAME"),
							rset.getDate("REV_DATE"),
							rset.getInt("REV_RATE"),
							rset.getString("REV_CONTENT"),
							rset.getString("REV_TYPE")
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
	
	
	public ArrayList<Attachment> selectAttachmentList(Connection conn, String proCode){
		ArrayList<Attachment> list = new ArrayList<>();
		Attachment at = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectProAttachmentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, proCode);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Attachment(
							rset.getInt("REF_BNO"),
							rset.getString("FILE_PATH"),
							rset.getString("CHANGE_NAME")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(conn);
		}
		return list;
		
	}
	
	
	// 사용자의 모든 사진리뷰들의 모든 사진에 대한 정보를 조회
	public ArrayList<Attachment> selectAttachmentList(Connection conn, int userNo){
		ArrayList<Attachment> list = new ArrayList<>();
		Attachment at = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAttachmentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				at = new Attachment();
				at.setRefBNo( rset.getInt("REF_BNO") );
				at.setFilePath( rset.getString("FILE_PATH") );
				at.setChangeName( rset.getString("CHANGE_NAME") );
				list.add(at);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	public int checkPurchase(Connection conn, int userNo, String proCode) {
		int result = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("checkPurchase");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, proCode);
			pstmt.setInt(2, userNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = 1;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
		
	}
	
	
	public int insertReview(Connection conn, Review r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getUserNo());
			pstmt.setString(2, r.getProCode());
			pstmt.setInt(3, r.getRevRate());
			pstmt.setString(4, r.getRevContent());
			pstmt.setString(5, r.getRevType());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 새로운 리뷰 작성하면서 새로운 파일 첨부했을 때
	public int insertAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		
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
	
	// 기존 리뷰 수정하면서 새로운 파일 첨부했을 때
	public int insertAttachment(Connection conn, Review r, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getRevNo());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("insertAttachment의 결과 : " + result);
		return result;
	}
	
	
	public Review selectReview(Connection conn, int revNo) {
		Review r = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, revNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new Review();
				r.setRevNo(rset.getInt("REV_NO"));
				r.setUserNo(rset.getInt("USER_NO"));
				r.setProCode(rset.getString("PRO_CODE"));
				r.setProName(rset.getString("PRO_NAME"));
				r.setProImgPath(rset.getString("PRO_IMG_PATH"));
				r.setRevRate(rset.getInt("REV_RATE"));
				r.setRevContent(rset.getString("REV_CONTENT"));
				r.setRevType(rset.getString("REV_TYPE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return r;
	}
	
	public Attachment selectAttachment(Connection conn, int revNo) {
		Attachment at = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, revNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment();
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setRefBNo(revNo);
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return at;
	}
	
	
	public int updateReview(Connection conn, Review r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getRevRate());
			pstmt.setString(2, r.getRevContent());
			pstmt.setString(3, r.getRevType());
			pstmt.setInt(4, r.getRevNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 리뷰 이미지 사진이 변경되었을 때, 기존 이미지의 STATUS를 'N'로 만드는 메소드
	// 를 작성해야 하는데 너무 귀찮아서 DELETE 해버릴거임
	public int deleteAttachment(Connection conn, Review r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteAttachment");
		System.out.println(r);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getRevNo());
				
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	

	public int deleteReview(Connection conn, int revNo) {
		int result1 = 0;
		int result2 = 1;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReview");
		String sql2 = prop.getProperty("deleteAttachment");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, revNo);
			result1 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		try {
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, revNo);
			result2 = pstmt.executeUpdate();
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result1 * result2;
		
	}
	
	
}
