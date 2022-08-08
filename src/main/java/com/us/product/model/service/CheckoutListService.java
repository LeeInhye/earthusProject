package com.us.product.model.service;

import static com.us.common.JDBCTemplate.close;
import static com.us.common.JDBCTemplate.commit;
import static com.us.common.JDBCTemplate.getConnection;
import static com.us.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.us.order.model.vo.Order;
import com.us.product.model.dao.CheckoutDao;
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
	
	
	// 결제 페이지에서 조회한 값을 DB에 넘기기 위한 메소드
	public int processCardPayment(Order o, String proQty, String orderProCode, String cardUid) {
		// 1) ORDER : INSERT
		// 2) ORDER-PRODUT : INSERT
		// 3) PAY_CARD : INSERT
		// 4) CART : DELETE
		
		Connection conn = getConnection();
		
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;
		
		// 1) ORDER 테이블에 INSERT문 실행
		result1 = new CheckoutDao().insertOrder(conn, o);
		
		// 2) ORDER_PRODUCT 테이블에 INSERT문 실행
		result2 = new CheckoutListDao().insertOrderProductList(conn, orderProCode, proQty);
		
		// 3) PAY_CARD 테이블에 INSERT문 실행
		result3 = new CheckoutDao().insertPayCard(conn, cardUid);
		
		// 4) CART 테이블에 DELETE문 실행
		result4 = new CheckoutListDao().deleteCart(conn, o, orderProCode);
		
		if(result1*result2*result3*result4 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result1*result2*result3*result4;
	}
	
	
	
	public int processCashPayment(Order o, String proQty, String orderProCode) {
		// 1) ORDER : INSERT
		// 2) ORDER-PRODUT : INSERT
		// 3) PAY_CARD : INSERT
		
		Connection conn = getConnection();
		CheckoutDao dao = new CheckoutDao();
		
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;
		
		// 1) ORDER 테이블에 INSERT문 실행
		result1 = dao.insertOrder(conn, o);
		
		// 2) ORDER_PRODUCT 테이블에 INSERT문 실행
		result2 = new CheckoutListDao().insertOrderProductList(conn, orderProCode, proQty);
		
		// 3) PAY_CASH 테이블에 
		result3 = dao.insertPayCash(conn);
		
		// 4) CART 테이블에 DELETE문 실행
		result4 = new CheckoutListDao().deleteCart(conn, o, orderProCode);
		
		if(result1*result2*result3*result4 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result1*result2*result3*result4;
	}

}
