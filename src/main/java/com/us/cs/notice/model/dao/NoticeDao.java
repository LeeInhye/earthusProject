package com.us.cs.notice.model.dao;

import static com.us.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.us.cs.model.vo.CsCategory;
import com.us.cs.notice.model.vo.Notice;

public class NoticeDao {
	
	private Properties prop = new Properties();
	
	public NoticeDao() {
		
		// 읽어들일 파일 : customerService-mapper.xml
		String filePath = NoticeDao.class.getResource("/db/sql/customerService-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 공지사항 목록 조회
	public ArrayList<Notice> selectNoticeList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectNoticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Notice(rset.getInt(1),
									rset.getString(2),
									rset.getString(3),
									rset.getString(4),
									rset.getString(5),
									rset.getDate(6)
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
	
	// 카테고리 조회
	public ArrayList<CsCategory> selectCategoryList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<CsCategory> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectCategoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new CsCategory(rset.getInt(1)
									  , rset.getString(2)
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
	public ArrayList<Notice> selectCateNoticeList(Connection conn, int a){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectCateNoticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, a);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Notice(rset.getInt(1),
									rset.getString(2),
									rset.getString(3),
									rset.getString(4),
									rset.getString(5),
									rset.getDate(6)
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
