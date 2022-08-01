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

import com.us.common.model.vo.PageInfo;
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
	
	// 페이징
	public int selectListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("selectNoticeListCount");
		
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
	public ArrayList<Notice> selectAdNoticeList(Connection conn, PageInfo pi){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectAdNoticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Notice(rset.getInt("NOTICE_NO"),
									rset.getString("USER_NAME"),
									rset.getString("CS_CATEGORY_NAME"),
									rset.getString("NOTICE_TITLE"),
									rset.getString("NOTICE_CONTENT"),
									rset.getDate("NOTICE_ENROLL_DATE"),
									rset.getString("NOTICE_STATUS")
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
	
	// 공지사항 삭제
	public int adDeleteNotice(Connection conn, String cntNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("adDeleteNotice");
		
		// 동적 sql문
		sql += "WHERE NOTICE_NO IN (";
		String[] aArr = cntNo.split(",");
		for(int i = 0; i < aArr.length; i++) {
			sql += aArr[i];
			if(i != aArr.length -1) {
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
