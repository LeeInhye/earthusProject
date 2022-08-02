package com.us.cs.faq.model.dao;

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
import com.us.cs.faq.model.vo.Faq;
import com.us.cs.model.vo.CsCategory;

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
	
	// 페이징
	public int selectListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String sql = prop.getProperty("selectFaqListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	// 관리자 전체 조회
	public ArrayList<Faq> selectAdFaqList(Connection conn, PageInfo pi){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Faq> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectAdFaqList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Faq(rset.getInt("FAQ_NO"),
									rset.getString("USER_NAME"),
									rset.getString("CS_CATEGORY_NAME"),
									rset.getString("FAQ_TITLE"),
									rset.getString("FAQ_CONTENT"),
									rset.getDate("FAQ_ENROLL_DATE"),
									rset.getString("FAQ_STATUS")
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
	
	// 게시글 삭제
	public int adDeleteFaq(Connection conn, String a) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		// 동적 sql문
		String sql = prop.getProperty("deleteFaq");
		
		sql += "WHERE FAQ_NO IN (";
		
		String[] aArr = a.split(",");
		for(int i = 0; i < aArr.length; i++) {
			sql += aArr[i];
			if(i != aArr.length - 1) {
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
	
	// 등록
	public int insertFaq(Connection conn, Faq f) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getFaqWriter());
			pstmt.setString(2, f.getCsCategory());
			pstmt.setString(3, f.getFaqTitle());
			pstmt.setString(4, f.getFaqContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 조회
	public Faq selectFaq(Connection conn, String a) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Faq f = null;
		
		String sql = prop.getProperty("selectFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				f = new Faq(rset.getString("USER_NAME")
						  , rset.getString("CS_CATEGORY_NO")
						  , rset.getString("FAQ_TITLE")
						  , rset.getString("FAQ_CONTENT")
						);
						
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return f;
	}
	
	// 게시글 수정
	public int updateFaq(Connection conn, Faq f) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getFaqWriter());
			pstmt.setString(2, f.getCsCategory());
			pstmt.setString(3, f.getFaqTitle());
			pstmt.setString(4, f.getFaqContent());
			pstmt.setInt(5, f.getFaqNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
