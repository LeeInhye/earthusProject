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

import com.us.order.model.vo.Order;
import com.us.product.model.vo.Cart;

public class CheckoutDao {

	private Properties prop = new Properties();

	public CheckoutDao() {
		try {
			prop.loadFromXML(
					new FileInputStream(CheckoutDao.class.getResource("/db/sql/checkout-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Cart> selectProList(Connection conn, int userNo, String orderProCode) {
		ArrayList<Cart> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectProList");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, "(" + orderProCode + ")");
			rset = pstmt.executeQuery();

			System.out.println(rset);

			while (rset.next()) {
				list.add(new Cart(rset.getInt("USER_NO"), rset.getString("PRO_CODE"), rset.getString("PRO_NAME"),
						rset.getInt("PRICE"), rset.getInt("PRO_QTY")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(list);
		return list;
	}

	public int insertOrder(Connection conn, Order o) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertOrder");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, o.getUserNo());
			pstmt.setString(2, o.getPayment());
			pstmt.setInt(3, o.getPointsUsed());
			pstmt.setString(4, o.getShpMemo());
			pstmt.setInt(5, o.getPaymentAmount());
			pstmt.setString(6, o.getOrdrrName());
			pstmt.setString(7, o.getOrdrrPhone());
			pstmt.setString(8, o.getDelName());
			pstmt.setString(9, o.getDelPhone());
			pstmt.setString(10, o.getDelZoneCode());
			pstmt.setString(11, o.getDelAddress());
			pstmt.setString(12, o.getDelAddrDetail());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertOrderProduct(Connection conn, String proCode, String proQty) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertOrderProduct");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, proCode);
			pstmt.setString(2, proQty); 		// 자동형변환 되니까
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		close(pstmt);
		}
		
		return result;
	}
	
	
	public int insertPayCash(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPayCash");
		
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
	

	

	
	/*
	 * public int insertPoint(Connection conn, Order o) { int result = 0;
	 * PreparedStatement pstmt = null; String sql =
	 * prop.getProperty("selectCurrPoint"); pstmt = conn.prepareStatement(sql); }
	 */
	
	
	
}
