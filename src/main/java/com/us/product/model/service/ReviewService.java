package com.us.product.model.service;

import static com.us.common.JDBCTemplate.close;
import static com.us.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.us.common.model.vo.Attachment;
import com.us.product.model.dao.ReviewDao;
import com.us.product.model.vo.Review;

public class ReviewService {
	
	// 첨부파일 없는 경우 insertReview 메소드
	/*
	 * public int insertReview(Review r) { Connection conn = getConnection(); int
	 * result = new ReviewDao().insertReview(conn, r); }
	 */
	
	// 마이페이지의 리뷰 관리에서 리뷰 리스트 조회하는 메소드
	public ArrayList<Review> selectList(int userNo){
		Connection conn = getConnection();
		ArrayList<Review> list = new ReviewDao().selectList(conn, userNo);
		
		close(conn);
		return list;
	}
	
	
	public Review checkPurchase(int userNo, String proCode) {
		Connection conn = getConnection();
		Review r = new ReviewDao().checkPurchase(conn, userNo, proCode);
		
		close(conn);
		return r;
	}
	
	
	
	
}
