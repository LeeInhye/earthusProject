package com.us.cs.qna.model.service;

import static com.us.common.JDBCTemplate.close;
import static com.us.common.JDBCTemplate.commit;
import static com.us.common.JDBCTemplate.getConnection;
import static com.us.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.us.common.model.vo.Attachment;
import com.us.common.model.vo.PageInfo;
import com.us.cs.qna.model.dao.QnaDao;
import com.us.cs.qna.model.vo.Qna;

public class QnaService {
	
	// 전체 목록 조회
	public ArrayList<Qna> selectQnaList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Qna> list = new QnaDao().selectQnaList(conn, pi);
		close(conn);
		return list;
	}
	
	// 페이징
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new QnaDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	
	// 작성
	public int insertQna(Qna q, Attachment at) {
		Connection conn = getConnection();
		int result1 = new QnaDao().insertQna(conn, q);
		int result2 = 1;
		
		if(at != null) {	// 첨부파일이 있을 경우
			result2 = new QnaDao().insertAttach(conn, at);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}
	
	// 글 조회
	public Qna selectQna(int a) {
		Connection conn = getConnection();
		Qna q = new QnaDao().selectQna(conn, a);
		close(conn);
		return q;
	}
	
	public Attachment selectAttachment(int a) {
		Connection conn = getConnection();
		Attachment at = new QnaDao().selectAttachment(conn, a);
		close(conn);
		return at;
	}
	
	// 글 수정
	public int updateQna(Qna q, Attachment at) {
		Connection conn = getConnection();
		int result1 = new QnaDao().updateQna(conn, q);
		int result2 = 1;
		
		if(at != null) {	// 새로운 첨부파일이 있으면
			if(at.getFileNo() != 0) {	// 기존 첨부파일이 있다면
				result2 = new QnaDao().updateAttachment(conn, at);
			} else {
				result2 = new QnaDao().insertNewAttachment(conn, at);
			}
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}
	
	// 삭제
	public int deleteQna(int qNo, Attachment at) {
		Connection conn = getConnection();
		int result1 = new QnaDao().deleteQna(conn, qNo);
		int result2 = 1;
		
		if(at != null) {	// 첨부파일이 있을 경우
			result2 = new QnaDao().deleteAttachment(conn, qNo);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result1 * result2;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
