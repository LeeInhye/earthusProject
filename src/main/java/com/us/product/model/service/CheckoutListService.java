package com.us.product.model.service;

import static com.us.common.JDBCTemplate.close;
import static com.us.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.us.product.model.dao.CheckoutListDao;
import com.us.product.model.vo.Cart;

public class CheckoutListService {
	
	// 장바구니에서 선택된 상품만 결제페이지로 보내기 위한 메소드
		public ArrayList<Cart> selectProList(int userNo, String orderProCode){
			Connection conn = getConnection();
			
			ArrayList<Cart> list = new CheckoutListDao().selectProList(conn, userNo, orderProCode);
			close(conn);
			return list;
		}

}
