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

}
