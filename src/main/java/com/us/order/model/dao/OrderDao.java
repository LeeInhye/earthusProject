package com.us.order.model.dao;

import static com.us.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

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
	
	// 주문내역 조회
	public ArrayList<Order> selectOrderList(Connection conn, int userNo) {
		ArrayList<Order> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOrderList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		
	}
}
