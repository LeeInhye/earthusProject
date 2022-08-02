package com.us.contents.model.service;

import static com.us.common.JDBCTemplate.close;
import static com.us.common.JDBCTemplate.commit;
import static com.us.common.JDBCTemplate.getConnection;
import static com.us.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.us.common.model.vo.Attachment;
import com.us.common.model.vo.PageInfo;
import com.us.contents.model.dao.ContentsDao;
import com.us.contents.model.vo.Contents;

public class ContentsService {
	
	// 페이징바_현재 총 게시글 갯수
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new ContentsDao().selectListCount(conn);
		close(conn);
		
		return listCount;		
	}
	
	// 관리자_콘텐츠 리스트 조회
	public ArrayList<Contents> selectAdList(PageInfo pi) {
		Connection conn = getConnection();		
		ArrayList<Contents> list = new ContentsDao().selectAdList(conn, pi);
		close(conn);
		
		return list;
	}

	// 관리자_콘텐츠 작성
	public int insertContents(Contents c, Attachment at) {
		Connection conn = getConnection();

		// CONTENTS INSERT
		int result1 = new ContentsDao().insertContents(conn, c); 
		
		// ATTACHMENT INSERT
		int result2 = new ContentsDao().insertAttachment(conn, at);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}
	
	// 관리자_콘텐츠 수정
	public int updateContents(Contents c, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new ContentsDao().updateContents(conn, c);
		
		int result2 = 1;
		if(at != null) { // 새로운 상세이미지 첨부파일 있는 경우 => Attachment update
			result2 = new ContentsDao().updateAttachment(conn, at);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
	
		return result1 * result2;
	}
	
	// 관리자_콘텐츠 선택 삭제
	public int deleteContents(String cntNo) {
		Connection conn = getConnection();
		int result = new ContentsDao().deleteContents(conn, cntNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}		
		close(conn);

		return result;
	}

	// 사용자_콘텐츠 리스트 조회
	public ArrayList<Contents> selectContentsList(){
		Connection conn = getConnection();
		ArrayList<Contents> list = new ContentsDao().selectContentsList(conn);
		close(conn);
		
		return list;
	}
	
	// 사용자_콘텐츠 상세 조회
	// 1) 조회수 증가
	public int increaseCount(int cntNo) {
		Connection conn = getConnection();
		int result = new ContentsDao().increaseCount(conn, cntNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
		
	// 2) 게시글 데이터 조회 (이전글번호, 다음글번호 포함)
	public Contents selectContents(int cntNo) {
		Connection conn = getConnection();
		Contents c = new ContentsDao().selectContents(conn, cntNo);
		close(conn);
		
		return c;
	}
	
	// 3) 상세 이미지 첨부파일 조회
	public Attachment selectAttachment(int cntNo) {
		Connection conn = getConnection();
		Attachment at = new ContentsDao().selectAttachment(conn, cntNo);
		close(conn);
		
		return at;
	}
	
	// 4) 이전 글, 다음 글 데이터 조회
	public Contents selectPrevNextContents(int cntNo) {
		Connection conn = getConnection();
		Contents c = new ContentsDao().selectPrevNextContents(conn, cntNo);
		close(conn);
		
		return c;
	}

	
}

