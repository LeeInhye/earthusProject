package com.us.product.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import static com.us.common.JDBCTemplate.*;
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
	
	
	// 첨부파일이 없을 때의 insertReview 메소드
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
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	

}
