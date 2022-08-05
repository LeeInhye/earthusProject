package com.us.point.model.service;

import static com.us.common.JDBCTemplate.close;
import static com.us.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.us.common.model.vo.PageInfo;
import com.us.member.model.dao.MemberDao;
import com.us.point.model.dao.PointDao;
import com.us.point.model.vo.Point;

public class PointService {
	
	// 페이징바_현재 총 포인트 내역 개수
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new PointDao().selectListCount(conn);
		close(conn);
		
		return listCount;		
	}

	// 관리자_포인트 내역 조회
	public ArrayList<Point> selectHistory(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Point> list = new PointDao().selectHistory(conn, pi);
		close(conn);
		
		return list;
	}
	
	// 페이징바_포인트 내역 검색 결과 총 개수
	public int searchListCount(String keyword) {
		Connection conn = getConnection();
		int listCount = new PointDao().searchListCount(conn, keyword);
		close(conn);
		return listCount;
	}
	
	
}
