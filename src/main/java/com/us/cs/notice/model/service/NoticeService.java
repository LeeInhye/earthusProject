package com.us.cs.notice.model.service;

import static com.us.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.us.cs.notice.model.dao.NoticeDao;
import com.us.cs.notice.model.vo.Notice;

public class NoticeService {
	
	// 공지사항 목록 조회
	public ArrayList<Notice> selectNoticeList(){
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn);
		close(conn);
		return list;
	}
	
	// 카테고리별 목록 조회
	public ArrayList<Notice> selectCateNoticeList(int a){
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectCateNoticeList(conn, a);
		close(conn);
		return list;
	}

}
