package com.us.product.model.service;

import static com.us.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.us.product.model.dao.CartDao;
import com.us.product.model.vo.Cart;

public class CartService {
	
	public ArrayList<Cart> selectList(int userNo){
		Connection conn = getConnection();
		ArrayList<Cart> list = new CartDao().selectList(conn, userNo);
		
		close(conn);
		return list;
	}
	
	
	public int deleteSelected(int userNo, String proCode) {
		Connection conn = getConnection();
		int result = new CartDao().deleteSelected(conn, userNo, proCode);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	public int updateQuantity(int userNo, String proCode, int proQty) {
		Connection conn = getConnection();
		int result = new CartDao().updateQuantity(conn, userNo, proCode, proQty);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
}
