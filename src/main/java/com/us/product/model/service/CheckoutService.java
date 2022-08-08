package com.us.product.model.service;

import static com.us.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.us.order.model.vo.Order;
import com.us.product.model.dao.CheckoutDao;
import com.us.product.model.vo.Cart;

public class CheckoutService {
	
	// 장바구니에서 선택된 상품만 결제페이지로 보내기 위한 메소드

	
	// 결제 페이지에서 조회한 값을 DB에 넘기기 위한 메소드
	public int processCardPayment(Order o, String proQty, String proCode, String cardUid) {
		// 1) ORDER : INSERT
		// 2) ORDER-PRODUT : INSERT
		// 3) PAY_CARD : INSERT
		
		Connection conn = getConnection();
		CheckoutDao dao = new CheckoutDao();
		
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		
		// 1) ORDER 테이블에 INSERT문 실행
		result1 = dao.insertOrder(conn, o);
		
		// 2) ORDER_PRODUCT 테이블에 INSERT문 실행
		result2 = dao.insertOrderProduct(conn, proCode, proQty);
		
		// 3) PAY_CASH 테이블에 
		result3 = dao.insertPayCard(conn, cardUid);
		
		if(result1*result2*result3 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result1*result2*result3;
	}
	
	
	
	public int processCashPayment(Order o, String proQty, String proCode) {
		// 1) ORDER : INSERT
		// 2) ORDER-PRODUT : INSERT
		// 3) PAY_CARD : INSERT
		
		Connection conn = getConnection();
		CheckoutDao dao = new CheckoutDao();
		
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		
		// 1) ORDER 테이블에 INSERT문 실행
		result1 = dao.insertOrder(conn, o);
		
		// 2) ORDER_PRODUCT 테이블에 INSERT문 실행
		result2 = dao.insertOrderProduct(conn, proCode, proQty);
		
		// 3) PAY_CARD 테이블에 
		result3 = dao.insertPayCash(conn);
		
		if(result1*result2*result3 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result1*result2*result3;
	}
	
	

}
