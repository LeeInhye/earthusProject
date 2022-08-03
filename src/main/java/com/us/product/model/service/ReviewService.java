package com.us.product.model.service;

import static com.us.common.JDBCTemplate.*;

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
	
	
	public int checkPurchase(int userNo, String proCode) {
		Connection conn = getConnection();
		int result = new ReviewDao().checkPurchase(conn, userNo, proCode);
		
		close(conn);
		return result;
	}
	
	
	public int insertReview(Review r, Attachment at) {
		Connection conn = getConnection();
		int result1 = 0;
		int result2 = 1;
		
		result1 = new ReviewDao().insertReview(conn, r);
		
		if(at != null) {
			// 새로 올릴 첨부파일 있을 때
			result2 = new ReviewDao().insertAttachment(conn, at);
		}
		if(result1 * result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result1 * result2;
	}
	
	
	public Review selectReview(int userNo, String proCode) {
		Connection conn = getConnection();
		
		Review r = null;
		Attachment at = null;
		r = new ReviewDao().selectReview(conn, userNo, proCode);
		
		if(r.getRevType() == "P") {
			at = new ReviewDao().selectAttachment(conn, r.getRevNo());
			if(at != null) {
				r.setRevImgPath( at.getFilePath() + at.getChangeName() );
			}
		}

		close(conn);
		return r;
	}
	
	
	public int updateReview(Review r, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = 0;
		int result2 = 1;
		
		result1 = new ReviewDao().updateReview(conn, r);	
		
		if(at != null) {
			result2 = new ReviewDao().insertAttachment(conn, r, at) * new ReviewDao().updateAttachment(conn, r, at);
		}
		
		if(result1 * result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result1 * result2;
		
	}
	
	
}
