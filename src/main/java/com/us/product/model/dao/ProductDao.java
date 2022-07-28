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

import com.us.common.model.vo.PageInfo;
import com.us.product.model.vo.Category;
import com.us.product.model.vo.Product;

public class ProductDao {
	
	private Properties prop = new Properties();
	
	public ProductDao() {
		try {
			prop.loadFromXML(new FileInputStream( ProductDao.class.getResource("/db/sql/product-mapper.xml").getPath() ));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn, int categoryNo) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, categoryNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("listCount");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
		
	}
	
	public Category selectCategory(Connection conn, int categoryNo) {
		Category c = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, categoryNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Category(rset.getInt("PRO_CATEGORY_NO"),
								 rset.getString("PRO_CATEGORY_NAME"),
								 rset.getString("PRO_CATEGORY_IMG_PATH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return c;
	}
	
	public ArrayList<Product> selectProductList(Connection conn, PageInfo pi, int categoryNo){
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1; //시작값
			int endRow = startRow + pi.getBoardLimit() - 1; // 끝값
			
			pstmt.setInt(1, categoryNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Product(rset.getString("PRO_CODE"),
									 rset.getString("PRO_CATEGORY_NAME"),
									 rset.getString("PRO_NAME"),
									 rset.getString("PRICE"),
									 rset.getDate("PRO_ENROLL_DATE"),
									 rset.getString("PRO_IMG_PATH"),
									 rset.getInt("PRO_COUNT")
									));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public ArrayList<Product> selectBestProductList(Connection conn, int categoryNo){
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBestProductList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, categoryNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product(rset.getString("pro_code"),
									 rset.getString("pro_category_name"),
									 rset.getString("pro_name"),
									 rset.getString("price"),
									 rset.getDate("pro_enroll_date"),
									 rset.getString("pro_img_path"),
									 rset.getInt("pro_count")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
