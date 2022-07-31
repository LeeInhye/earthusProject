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
import com.us.product.model.vo.Product;

public class adProductDao {

	Properties prop = new Properties();
	
	public adProductDao() {
		try {
			prop.loadFromXML(new FileInputStream( adProductDao.class.getResource("/db/sql/adProduct-mapper.xml").getPath() ));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
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
	
	public ArrayList<Product> selectProductList(Connection conn, PageInfo pi){
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1; //시작값
			int endRow = startRow + pi.getBoardLimit() - 1; //끝값 
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product(rset.getString("pro_code"),
									 rset.getString("category_no"),
									 rset.getString("pro_name"),
									 rset.getInt("stock"),
									 rset.getDate("pro_enroll_date")
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
	
	public Product selectProduct(Connection conn, String proCode) {
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, proCode);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Product(rset.getString("pro_code"),
								rset.getString("category_no"),
								rset.getString("pro_name"),
								rset.getString("pro_info"),
								rset.getString("price"),
								rset.getInt("stock"),
								rset.getDate("pro_enroll_date"),
								rset.getString("pro_img_path"),
								rset.getString("detail_img_path"),
								rset.getString("req_info_img_path"),
								rset.getInt("pro_count")
							   );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}
	
	public int updateProduct(Connection conn, Product p) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateProduct");
		String price = p.getPrice();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getCategory());
			pstmt.setString(2, p.getProName());
			pstmt.setString(3, price);
			pstmt.setString(4, p.getProImgPath());
			pstmt.setString(5, p.getDetailImgPath());
			pstmt.setString(6, p.getReqInfoImgPath());
			pstmt.setString(7, p.getProCode());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
}
