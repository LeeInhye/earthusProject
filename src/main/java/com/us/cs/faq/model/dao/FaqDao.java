package com.us.cs.faq.model.dao;

import static com.us.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.us.cs.faq.model.vo.Faq;

public class FaqDao {
	
	private Properties prop = new Properties();
	
	public FaqDao() {
		// 읽어들일 파일 : customerService-mapper.xml
		String filePath = FaqDao.class.getResource("/db/sql/customerService-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 전체 목록 조회
	public ArrayList<Faq> selectFaqList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Faq> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectFaqList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Faq(rset.getInt(1)
							   , rset.getString(2)
							   , rset.getString(3)
							   , rset.getString(4)
							   , rset.getString(5)
							   , rset.getDate(6)
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
	
	// 카테고리별 목록 조회
	public ArrayList<Faq> selectCateFaqList(Connection conn, int a){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Faq> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectCateFaqList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, a);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Faq(rset.getInt(1)
							   , rset.getString(2)
							   , rset.getString(3)
							   , rset.getString(4)
							   , rset.getString(5)
							   , rset.getDate(6)
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
