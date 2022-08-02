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
	
}
