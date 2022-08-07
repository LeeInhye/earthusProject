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

public class CheckoutListDao {
	
	private Properties prop = new Properties();

	public CheckoutListDao() {
		try {
			prop.loadFromXML(
					new FileInputStream(CheckoutListDao.class.getResource("/db/sql/checkoutList-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Cart> selectProList(Connection conn, int userNo, String orderProCode) {
		ArrayList<Cart> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectProList");
		
		String[] orderProCodes = orderProCode.split(",");

		try {
			for(int i=0; i<orderProCodes.length; i++) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, userNo);
				pstmt.setString(2, orderProCodes[i]);
				rset = pstmt.executeQuery();
				
				while (rset.next()) {
					Cart c = new Cart();
					c.setUserNo(rset.getInt("USER_NO"));
					c.setProCode(rset.getString("PRO_CODE"));
					c.setProName(rset.getString("PRO_NAME"));
					c.setPrice(rset.getInt("price"));
					c.setProQty(rset.getInt("PRO_QTY"));
					list.add(c);
				}
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
	
	
	// 장바구니 결제 건을 OrderProduct 테이블에 INSERT (상품 수량 개수만큼 실행)
	public int insertOrderProductList(Connection conn, String proCode, String proQty) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertOrderProductList");
		
		String[] proCodes = proCode.split(",");
		String[] proQtys = proQty.split(",");

		try {
			for(int i=0; i<proCodes.length; i++) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, proCodes[i]);
				pstmt.setString(2, proQtys[i]);    // 자동형변환 되니까
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		close(pstmt);
		}
		
		return result;
	}
	
	
	public int deleteCart(Connection conn, Order o, String proCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteCart");
		
		String[] proCodes = proCode.split(",");

		try {
			for(int i=0; i<proCodes.length; i++) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, o.getUserNo());
				pstmt.setString(2, proCodes[i]);		
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}

}
