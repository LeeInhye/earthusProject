package com.us.product.model.service;

import static com.us.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.us.order.model.vo.Order;
import com.us.product.model.dao.CheckoutDao;
import com.us.product.model.vo.Cart;

public class CheckoutService {
	
	// 장바구니에서 선택된 상품만 결제페이지로 보내기 위한 메소드
	public ArrayList<Cart> selectProList(int userNo, String orderProCode){
		Connection conn = getConnection();
		
		ArrayList<Cart> list = new CheckoutDao().selectProList(conn, userNo, orderProCode);
		close(conn);
		System.out.println(list);
		return list;
	}
	
	
	// 결제 페이지에서 조회한 값을 DB에 넘기기 위한 메소드
	public int processPayment(Order o) {
		// 이 메소드에서는
		// 1) ORDER : INSERT
		// 2) ORDER-PRODUT : INSERT
		// 3) CART : DELETE
		// 4) POINT : INSERT (o.getPointsUsed != 0 인 경우에만)
		
		Connection conn = getConnection();
		CheckoutDao dao = new CheckoutDao();
		
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		int result4 = 1;
		
		// 1) ORDER 테이블에 INSERT문 실행
		result1 = dao.insertOrder(conn, o);
		
		// 2) ORDER-PRODUCT 테이블에 INSERT문 실행
		result2 = dao.insertOrderProduct(conn, o);
		
		// 3) CART 테이블에 DELETE문 실행
		result3 = dao.deleteCart(conn, o);
		
		// 4) POINT 테이블에 INSERT문 실행
		/*
		 * if(o.getPointsUsed() != 0) { result4 = dao.insertPoint(conn, o); }
		 */
		
		if(result1 * result3 * result4 > 0 && result2 == orderList.size()) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result1*result2*result3*result4;
	}
	
	

}
