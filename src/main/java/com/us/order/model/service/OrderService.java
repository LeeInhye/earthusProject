package com.us.order.model.service;

import static com.us.common.JDBCTemplate.*;
import static com.us.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.us.common.model.vo.PageInfo;
import com.us.order.model.dao.OrderDao;
import com.us.order.model.vo.Order;

public class OrderService {
	
	// 주문내역 갯수
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new OrderDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	// 주문내역 조회
	public ArrayList<Order> selectOrderList(PageInfo pi, int userNo){
		Connection conn = getConnection();
		ArrayList<Order> list = new OrderDao().selectOrderList(conn, pi, userNo);
		close(conn);
		return list;
	}
	
	// 주문 상세 조회
	public ArrayList<Order> selectOrder(int orderNo){
		Connection conn = getConnection();
		ArrayList<Order> olist = new OrderDao().selectOrder(conn, orderNo);
		close(conn);
		return olist;
	}
	
	// 취소/교환/반품 페이지
	public ArrayList<Order> selectCeList(int userNo){
		Connection conn = getConnection();
		ArrayList<Order> celist = new OrderDao().selectCeList(conn, userNo);
		close(conn);
		return celist;
	}
	
	// 교환/반품 신청할 상품 조회
	public Order selectOrderProduct(int orderNo, String proCode) {
		Connection conn = getConnection();
		Order o = new OrderDao().selectOrderProduct(conn, orderNo, proCode);
		close(conn);
		return o;
	}
	
	// 교환 or 반품 신청
	public int updateExrtr(int orderNo, int selectEr) {
		Connection conn = getConnection();
		int result = new OrderDao().updateExrtr(conn, orderNo, selectEr);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	// 취소 신청
	public int updateCan(int orderNo, int status) {
		Connection conn = getConnection();
		int result = new OrderDao().updateCan(conn, orderNo, status);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
}
