package com.us.order.model.dao;

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
import com.us.order.model.vo.Order;
import com.us.product.model.dao.ProductDao;

public class OrderDao {

	private Properties prop = new Properties();
	
	public OrderDao() {
		try {
			prop.loadFromXML(new FileInputStream( ProductDao.class.getResource("/db/sql/order-mapper.xml").getPath() ));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 주문내역 갯수
	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	// 취교반 페이징용
	public int selectListCount(Connection conn, String status) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		sql += status;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	// 주문내역 조회
	public ArrayList<Order> selectOrderList(Connection conn, PageInfo pi, int userNo) {
		ArrayList<Order> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOrderList");
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Order(rset.getInt("order_no"),
								   rset.getInt("payment_amount"),
								   rset.getInt("del_status"),
								   rset.getInt("product_count"),
								   rset.getString("pro_code"),
								   rset.getString("pro_name"),
								   rset.getDate("order_date")
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
	
	// 주문 상세 조회
	public ArrayList<Order> selectOrder(Connection conn, int orderNo){
		ArrayList<Order> olist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOrder");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				olist.add(new Order(rset.getInt("order_no"),
						 		   rset.getString("payment"),
						 		   rset.getInt("points_used"),
						 		   rset.getString("shp_memo"),
						 		   rset.getInt("payment_amount"),
						 		   rset.getString("del_name"),
						 		   rset.getString("del_phone"),
						 		   rset.getString("del_zonecode"),
						 		   rset.getString("del_address"),
						 		   rset.getString("del_addr_detail"),
						 		   rset.getInt("del_status"),
						 		   rset.getString("pro_name"),
						 		   rset.getDate("order_date"),
						 		   rset.getString("pro_img_path"),
						 		   rset.getInt("price"),
						 		   rset.getInt("quantity"),
						 		   rset.getString("zonecode"),
						 		   rset.getString("ordrr_name"),
						 		   rset.getString("ordrr_phone"),
						 		   rset.getString("address"),
						 		   rset.getString("addr_detail")
						 		   
						));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return olist;
	}
	
	// 취소/교환/반품 페이지
	public ArrayList<Order> selectCeList(Connection conn, int userNo ,PageInfo pi){
		ArrayList<Order> celist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				celist.add(new Order(rset.getInt("order_no"),
									 rset.getInt("del_status"),
									 rset.getString("pro_name"),
									 rset.getDate("order_date"),
									 rset.getString("pro_img_path"),
									 rset.getInt("price"),
									 rset.getInt("quantity"),
									 rset.getString("pro_code")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return celist;
	}
	
	// 교환/반품 신청할 상품 조회
	public Order selectOrderProduct(Connection conn, int orderNo, String proCode) {
		Order o = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOrderProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNo);
			pstmt.setString(2, proCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				o = new Order(rset.getInt("order_no"),
							  rset.getInt("points_used"),
				 		      rset.getInt("payment_amount"),
				 		      rset.getString("ordrr_name"),
							  rset.getString("ordrr_phone"),
				 		      rset.getString("del_name"),
				 		      rset.getString("del_phone"),
				 		      rset.getString("del_zonecode"),
				 		      rset.getString("del_address"),
				 		      rset.getString("del_addr_detail"),
							  rset.getInt("del_status"),
							  rset.getString("pro_name"),
							  rset.getDate("order_date"),
							  rset.getString("pro_img_path"),
							  rset.getInt("price"),
							  rset.getInt("quantity"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return o;
	}
	
	// 교환 or 반품 신청
	public int updateExrtr(Connection conn, int orderNo, int selectEr) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateExrtr");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, selectEr);
			pstmt.setInt(2, orderNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	// 취소 신청
	public int updateCan(Connection conn, int orderNo, int status) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateExrtr");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, status);
			pstmt.setInt(2, orderNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 관_구매내역조회
	public ArrayList<Order> selectOrderListAd(Connection conn, PageInfo pi){
		ArrayList<Order> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOrderListAd");
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Order ol = new Order();
				ol.setOrderNo(rset.getInt("order_no"));
				ol.setOrderDate(rset.getDate("order_date"));
				ol.setUserId(rset.getString("user_id"));
				ol.setDelNo(rset.getInt("del_no"));
				ol.setDelStatus(rset.getInt("del_status"));
				list.add(ol);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	// 관_운송장추가
	public int updateDelNo(Connection conn, int orderNo, int delNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateDelNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, delNo);
			pstmt.setInt(2, orderNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	// 취소 상세내역 조회
	public ArrayList<Order> selectCanDetail(Connection conn, int orderNo){
		ArrayList<Order> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCanDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Order ol = new Order();
				ol.setOrderNo(rset.getInt("order_no"));
				ol.setOrderDate(rset.getDate("order_date"));
				ol.setProName(rset.getString("pro_name"));
				ol.setPrice(rset.getInt("price"));
				ol.setQuantity(rset.getInt("quantity"));
				ol.setDelStatus(rset.getInt("del_status"));
				ol.setDelName(rset.getString("del_name"));
				ol.setDelPhone(rset.getString("del_phone"));
				ol.setDelZoneCode(rset.getString("del_zonecode"));
				ol.setDelAddress(rset.getString("del_address"));
				ol.setDelAddrDetail(rset.getString("del_addr_detail"));
				ol.setShpMemo(rset.getString("shp_memo"));
				ol.setOrdrrName(rset.getString("ordrr_name"));
				ol.setOrdrrPhone(rset.getString("ordrr_phone"));
				ol.setZoneCode(rset.getString("zonecode"));
				ol.setAddress(rset.getString("address"));
				ol.setAddrDetail(rset.getString("addr_detail"));
				ol.setPaymentAmount(rset.getInt("payment_amount"));
				ol.setPointsUsed(rset.getInt("points_used"));
				ol.setPayment(rset.getString("payment"));
				list.add(ol);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	// 교환/반품 상세내역 조회
	public ArrayList<Order> selectErDetail(Connection conn, int orderNo, String proCode){
		ArrayList<Order> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOrderProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNo);
			pstmt.setString(2, proCode);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Order ol = new Order();
				ol.setOrderNo(rset.getInt("order_no"));
				ol.setOrderDate(rset.getDate("order_date"));
				ol.setProName(rset.getString("pro_name"));
				ol.setPrice(rset.getInt("price"));
				ol.setQuantity(rset.getInt("quantity"));
				ol.setDelStatus(rset.getInt("del_status"));
				ol.setDelName(rset.getString("del_name"));
				ol.setDelPhone(rset.getString("del_phone"));
				ol.setDelZoneCode(rset.getString("del_zonecode"));
				ol.setDelAddress(rset.getString("del_address"));
				ol.setDelAddrDetail(rset.getString("del_addr_detail"));
				ol.setPaymentAmount(rset.getInt("payment_amount"));
				ol.setPointsUsed(rset.getInt("points_used"));
				list.add(ol);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
		
	}
	
	// 관_취소/교환/반품 조회
	public ArrayList<Order> selectCerListAd(Connection conn, String status, PageInfo pi){
		ArrayList<Order> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCerListAd1");
		
		
		
		sql += status + "ORDER BY ORDER_NO DESC) A ) WHERE RNUM BETWEEN ? AND ?";
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Order ol = new Order();
				ol.setOrderNo(rset.getInt("order_no"));
				ol.setProCode(rset.getString("pro_code"));
				ol.setOrderDate(rset.getDate("order_date"));
				ol.setUserId(rset.getString("user_id"));
				ol.setDelStatus(rset.getInt("del_status"));
				list.add(ol);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public ArrayList<Order> selectCncltList(PageInfo pi, Connection conn){
		ArrayList<Order> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCListAd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Order ol = new Order();
				ol.setOrderNo(rset.getInt("order_no"));
				ol.setProCode(rset.getString("pro_code"));
				ol.setOrderDate(rset.getDate("order_date"));
				ol.setUserId(rset.getString("user_id"));
				ol.setDelStatus(rset.getInt("del_status"));
				list.add(ol);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int updateDelFi(Connection conn, int orderNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateDelFi");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
}
