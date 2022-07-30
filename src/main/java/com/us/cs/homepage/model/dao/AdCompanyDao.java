package com.us.cs.homepage.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import static com.us.common.JDBCTemplate.*;

public class AdCompanyDao {
	
	private Properties prop = new Properties();
	
	public AdCompanyDao() {
		try {
			prop.loadFromXML( new FileInputStream( AdCompanyDao.class.getResource("/db/sql/company-mapper.xml").getPath() ) );
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	public int insertCompanyInfo(Connection conn, String html) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCompanyInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, html);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
}
