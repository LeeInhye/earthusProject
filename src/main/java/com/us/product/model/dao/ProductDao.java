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
import com.us.product.model.vo.Cart;
import com.us.product.model.vo.Category;
import com.us.product.model.vo.ProQna;
import com.us.product.model.vo.Product;
import com.us.product.model.vo.WishList;

public class ProductDao {
	
	private Properties prop = new Properties();
	
	public ProductDao() {
		try {
			prop.loadFromXML(new FileInputStream( ProductDao.class.getResource("/db/sql/product-mapper.xml").getPath() ));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 해당하는 카테고리의 상품 개수 조회
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
	
	// 상품 개수 조회 (카테고리별 + 전체) _ 수민
	public int selectListCountSM(Connection conn, int categoryNo) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCountSM");
		
		if(categoryNo != 0) {	// 카테고리가 있을 때
			sql += "WHERE CATEGORY_NO = ";
			sql += categoryNo;
		}
		
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
	
	
	// 카테고리 전체 조회
	public ArrayList<Category> selectCategoryList(Connection conn){
		ArrayList<Category> cList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCategoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				cList.add(new Category(rset.getInt("pro_category_no"),
									   rset.getString("pro_category_name"),
									   rset.getString("pro_category_img_path")
									   ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return cList;
	}
	
	// 카테고리 별 상품 개수 조회
	public ArrayList<Product> selectProductCountList(Connection conn) {
		ArrayList<Product> pcList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductCountList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				pcList.add(new Product(rset.getInt("productCount")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return pcList;
	}
	
	// 한 페이지에 나타날 상품들 조회
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
	
	// 한 페이지에 나타날 상품들 조회 + 전체 리스트
		public ArrayList<Product> selectProductListSM(Connection conn, PageInfo pi, int categoryNo){
			ArrayList<Product> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectProductListSM");
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1; //시작값
			int endRow = startRow + pi.getBoardLimit() - 1; // 끝값
			
			// 동적 sql문
			if(categoryNo != 0) {	// 카테고리가 있을 때
				sql += "WHERE CATEGORY_NO = ";
				sql += categoryNo;
			}
			
			sql += " ORDER BY PRO_CODE DESC) A";
			sql += ") WHERE RNUM BETWEEN " + startRow + " AND " + endRow;
			
			try {
				pstmt = conn.prepareStatement(sql);
				
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
	
	// 베스트 상품 5 조회 (조회수 기준)
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
	
	// 베스트 상품 5 조회 (조회수 기준) + 전체
		public ArrayList<Product> selectBestProductListSM(Connection conn, int categoryNo){
			ArrayList<Product> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectBestProductListSM");
			
			if(categoryNo != 0) {	// 카테고리가 있을 때
				sql += "WHERE CATEGORY_NO = ";
				sql += categoryNo;
			}
			
			sql += " ORDER BY PRO_COUNT DESC, PRO_NAME ASC) A";
			sql += ")  WHERE ROWNUM BETWEEN 1 AND 5";
			
			try {
				pstmt = conn.prepareStatement(sql);

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
	
	// 상품명 키워드로 상품들 조회 핑요!!!
	
	// 위시리스트
	public ArrayList<WishList> selectWishList(Connection conn, int userNo){
		ArrayList<WishList> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectWishList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				WishList wi = new WishList();
				wi.setProImgPath(rset.getString("pro_img_path"));
				wi.setProName(rset.getString("pro_name"));
				wi.setProCode(rset.getString("pro_code"));
				wi.setPrice(rset.getInt("price"));
				wi.setWishDate(rset.getDate("wish_date"));
				list.add(wi);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public int increaseProCount(Connection conn, String proCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseProCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, proCode);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	// 한 상품 조회
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
	
	// 위시 삭제
	public int deleteWish(Connection conn, int userNo, String pCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteWish");
		
		sql += "AND PRO_CODE IN ("; 
		
		String[] dpArr = pCode.split(",");  // ["3", "4"]
		for(int i=0; i<dpArr.length; i++) {
			sql += dpArr[i];
			if(i != dpArr.length-1) {
				sql += ",";
			}
		}
		
		sql += ")";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 상품 문의글 개수 조회
	public int selectQlistCount(Connection conn, String proCode) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQlistCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, proCode);
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
	
	public ArrayList<ProQna> selectProQnaList(Connection conn, String proCode){
		ArrayList<ProQna> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProQnaList");
		
		try {
			pstmt = conn.prepareStatement(sql);
					
			pstmt.setString(1, proCode);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add( new ProQna(rset.getInt("pro_qna_no"),
									 rset.getString("pro_code"),
									 rset.getString("pro_qna_title"),
									 rset.getString("pro_qna_content"),
									 rset.getString("pro_qna_pwd"),
									 rset.getInt("pro_qna_writer_no"),
									 rset.getString("pro_qna_writer_name"),
									 rset.getString("pro_qna_email"),
									 rset.getString("pro_qna_phone"),
									 rset.getDate("pro_q_enroll_date"),
									 rset.getDate("pro_a_enroll_date"),
									 rset.getString("pro_a_writer"),
									 rset.getString("pro_a_content")
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
	
	public ArrayList<Product> priceDesc(Connection conn, PageInfo pi, int categoryNo){
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("priceDesc");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1; // 시작값
		int endRow = startRow + pi.getBoardLimit() - 1; // 끝값
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, categoryNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product( rset.getString("pro_code"),
									  rset.getString("categoryNo"),
									  rset.getString("pro_name"),
									  rset.getString("pro_info"),
									  rset.getString("price"),
									  rset.getInt("stock"),
									  rset.getDate("pro_enroll_date"),
									  rset.getString("pro_img_path"),
									  rset.getString("detail_img_path"),
									  rset.getString("req_info_img_path"),
									  rset.getInt("pro_count")
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
	
	public int insertProQna(Connection conn, ProQna pq) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertProQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pq.getProCode());
			pstmt.setString(2, pq.getProQnaTitle());
			pstmt.setString(3, pq.getProQnaContent());
			pstmt.setString(4, pq.getProQnaPwd());
			pstmt.setString(5, pq.getProQnaWriterName());
			pstmt.setString(6, pq.getProQnaEmail());
			pstmt.setString(7, pq.getProQnaPhone());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertCart(Connection conn, Cart c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getUserNo());
			pstmt.setString(2, c.getProCode());
			pstmt.setInt(3, c.getProQty());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public WishList checkWish(Connection conn, int userNo, String proCode) {
		WishList w = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkWish");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, proCode);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				w = new WishList(rset.getInt("user_no"),
								 rset.getString("pro_code"),
								 rset.getDate("wish_date")
								);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return w;
	}
	
	public int insertWish(Connection conn, int userNo, String proCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertWish");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, proCode);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int proDetailDelWish(Connection conn, int userNo, String proCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("proDetailDelWish");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, proCode);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
}
