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
	
	
	// 마이페이지의 리뷰 관리에서 조회하는 리뷰 리스트 중 첨부파일들에 대한 정보를 조회
	public ArrayList<Attachment> selectAttachmentList(int userNo){
		Connection conn = getConnection();
		ArrayList<Attachment> list = new ReviewDao().selectAttachmentList(conn, userNo);
	
		close(conn);
		return list;
	}
	
	
	// 리뷰 등록 전 해당 상품의 구매자인지 확인하는 메소드
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
	
	
	public Review selectReview(int userNo, int revNo) {
		Connection conn = getConnection();
		
		Review r = null;
		Attachment at = null;
		r = new ReviewDao().selectReview(conn, revNo);
		
		if(r.getRevType().equals("P")) {
			at = new ReviewDao().selectAttachment(conn, revNo);
			
			if(at != null) {
				r.setRevImgPath( at.getFilePath() + at.getChangeName() );
			}
		}

		close(conn);
		return r;
	}
	
	
	// REVIEW 테이블에 UPDATE문
	// 만약 넘어온 이미지 첨부파일이 있다면,
	// 1) 신규 파일 : ATTACHMENT 테이블에 INSERT문
	// 2) 변경 파일 : ATTACHMENT 테이블에 INSERT문, ATTACHMENT 테이블에 DELETE문
	public int updateReview(Review r, Attachment at, String oldFile) {
		Connection conn = getConnection();
		
		int result1 = 0;
		int result2 = 1;
		
		// REVIEW 테이블에 UPDATE문
		result1 = new ReviewDao().updateReview(conn, r);	
		
		if(at != null) {
			if(oldFile == null) {
				// 최초로 이미지 업로드
				result2 = new ReviewDao().insertAttachment(conn, r, at);
			}else {
				// 기존에 이미지 있고, 수정하면서 이미지 파일이 변경된 경우
				// 삭제를 먼저 하고 INSERT를 다음에 해야 함
				result2 = new ReviewDao().deleteAttachment(conn, r)	* new ReviewDao().insertAttachment(conn, r, at);
			}
		}
		
		if(result1 * result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result1 * result2;
		
	}
	
	
	public int deleteReview(int revNo) {
		Connection conn = getConnection();
		
		int result = 0;
		result = new ReviewDao().deleteReview(conn, revNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}
	
	
}
