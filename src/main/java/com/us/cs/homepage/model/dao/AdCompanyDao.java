package com.us.cs.homepage.model.dao;

import static com.us.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.us.cs.homepage.model.vo.Company;

public class AdCompanyDao {
	
	private Properties prop = new Properties();
	
	public AdCompanyDao() {
		try {
			prop.loadFromXML( new FileInputStream( AdCompanyDao.class.getResource("/db/sql/company-mapper.xml").getPath() ) );
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	public int insertPost(Connection conn, String html, int category) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPost");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, category);
			pstmt.setString(2, html);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public Company selectPost(Connection conn, int category) {
		Company post = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPost");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, category);
			pstmt.setInt(2, category);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				post = new Company(rset.getInt("COM_NO"),
								   rset.getInt("COM_CATEGORY"),
								   rset.getString("COM_CONTENT"),
								   rset.getDate("COM_UPDATE_DATE")
								  );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return post;
		
	}
	
	public String selectInfo(Connection conn) {
		String result = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectInfo");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getString("COM_CONTENT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
		
		
	}
	
}
