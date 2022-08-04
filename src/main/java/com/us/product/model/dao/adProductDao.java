package com.us.product.model.dao;

import static com.us.common.JDBCTemplate.close;
import static com.us.common.JDBCTemplate.getConnection;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import org.apache.tomcat.websocket.PojoClassHolder;

import com.us.common.model.vo.PageInfo;
import com.us.product.model.service.adProductService;
import com.us.product.model.vo.ProQna;
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
	
	public String selectMaxProCode(Connection conn) {
		String maxProCode = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMaxProCode");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				maxProCode = rset.getString("maxProCode");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(conn);
		}
		return maxProCode;
	}
	
	public int insertProduct(Connection conn, Product p) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getCategory());
			pstmt.setString(2, p.getProName());
			pstmt.setString(3, p.getProInfo());
			pstmt.setString(4, p.getPrice());
			pstmt.setInt(5, p.getStock());
			pstmt.setString(6, p.getProImgPath());
			pstmt.setString(7, p.getDetailImgPath());
			pstmt.setString(8, p.getReqInfoImgPath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteProduct(Connection conn, String proCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteProduct");
		
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
	
	// 모든 상품문의글 개수 조회 
	public int selectpqlistCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectpqlistCount");
		
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
	
	// 답변 상태별 상품문의글 개수 조회
	public int selectpqlistCount2(Connection conn, String option) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectpqlistCount2");
		
		// option에 따른 where절 담는 변수
		String where = "";
		
		switch(option) {
		case "add" : break;
		case "waiting" : where = "WHERE PRO_A_ENROLL_DATE IS NULL "; break;
		case "complete" : where = "WHERE PRO_A_ENROLL_DATE IS NOT NULL "; break;
		}
		
		sql += where;
		
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
	
	public ArrayList<ProQna> selectProQnaList(Connection conn, PageInfo pi){
		ArrayList<ProQna> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProQnaList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				list.add(new ProQna(rset.getInt("pro_qna_no"),
									rset.getString("pro_qna_title"),
									rset.getString("pro_qna_writer_name"),
									rset.getDate("pro_q_enroll_date"),
									rset.getDate("pro_a_enroll_date"),
									rset.getString("pro_name")
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
	
	public ProQna selectProQna(Connection conn, int proQnaNo) {
		ProQna pq = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, proQnaNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				pq = new ProQna(rset.getInt("pro_qna_no"),
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
								rset.getString("pro_a_content"),
								rset.getString("pro_name")
								);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return pq;
	}
	
	public int updateProQna(Connection conn, int userNo, String proAContent, int proQnaNo) {
		int result = 0;
		PreparedStatement pstmt =null;
		String sql = prop.getProperty("updateProQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, proAContent);
			pstmt.setInt(3, proQnaNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<ProQna> selectSortProQnaList(Connection conn , PageInfo pi , String option){
		ArrayList<ProQna> list = new ArrayList<ProQna>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSortProQnaList");
		
		// 페이징에 필요한 변수
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		// 전체, 답변대기중, 답변완료 각각의 경우에 sql문에 들어갈 where문
		String where = "";
		
		switch(option) {
		case "all": break;
		case "waiting": where = "WHERE PRO_A_ENROLL_DATE IS NULL ";
			break;
		case "complete": where = "WHERE PRO_A_ENROLL_DATE IS NOT NULL ";
			break;
		}
		
		sql += where + "ORDER BY PRO_Q_ENROLL_DATE DESC ) A ) WHERE RNUM BETWEEN ? AND ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new ProQna(rset.getInt("pro_qna_no"),
									rset.getString("pro_qna_title"),
									rset.getString("pro_qna_writer_name"),
									rset.getDate("pro_q_enroll_date"),
									rset.getDate("pro_a_enroll_date"),
									rset.getString("pro_name")
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
}
