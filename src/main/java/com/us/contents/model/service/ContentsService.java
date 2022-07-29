package com.us.contents.model.service;

import static com.us.common.JDBCTemplate.close;
import static com.us.common.JDBCTemplate.commit;
import static com.us.common.JDBCTemplate.getConnection;
import static com.us.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.us.common.model.vo.Attachment;
import com.us.contents.model.dao.ContentsDao;
import com.us.contents.model.vo.Contents;

public class ContentsService {
	
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
	
	public ArrayList<Contents> selectAdList() {
		Connection conn = getConnection();		
		ArrayList<Contents> list = new ContentsDao().selectAdList(conn);
		close(conn);

		return list;
	}
	
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
	
	public Contents selectContents(int cntNo) {
		Connection conn = getConnection();
		Contents c = new ContentsDao().selectContents(conn, cntNo);
		close(conn);
		
		return c;
	}
	
	public Attachment selectAttachment(int cntNo) {
		Connection conn = getConnection();
		Attachment at = new ContentsDao().selectAttachment(conn, cntNo);
		close(conn);
		
		return at;
	}
	
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
	

}
