package com.us.product.model.service;

import java.sql.Connection;

import static com.us.common.JDBCTemplate.*;
import com.us.product.model.dao.ReviewDao;
import com.us.product.model.vo.Review;

public class ReviewService {
	
	// 첨부파일 없는 경우 insertReview 메소드
	public int insertReview(Review r) {
		Connection conn = getConnection();
		int result = new ReviewDao().insertReview(conn, r);
	}
	
	
	
	
}
