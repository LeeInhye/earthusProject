package com.us.cs.notice.model.service;

import static com.us.common.JDBCTemplate.*;
import static com.us.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.us.common.model.vo.PageInfo;
import com.us.cs.model.vo.CsCategory;
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
	
	// 카테고리 조회
	public ArrayList<CsCategory> selectCategoryList(){
		Connection conn = getConnection();
		ArrayList<CsCategory> list = new NoticeDao().selectCategoryList(conn);
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
	
	// 페이징
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new NoticeDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	// 관리자 목록 조회
	public ArrayList<Notice> selectAdNoticeList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectAdNoticeList(conn, pi);
		close(conn);
		return list;
	}
	
	// 공지사항 삭제
	public int adDeleteNotice(String cntNo) {
		Connection conn = getConnection();
		int result = new NoticeDao().adDeleteNotice(conn, cntNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	

}
