package com.us.point.model.service;

import static com.us.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.us.challenge.model.dao.ChallengeDao;
import com.us.common.model.vo.PageInfo;
import com.us.contents.model.dao.ContentsDao;
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
	
	// 페이징바_회원별 포인트 내역 총 개수
	public int selectMMListCount(int userNo) {
		Connection conn = getConnection();
		int listCount = new PointDao().selectMMListCount(conn, userNo);
		close(conn);
		
		return listCount;		
	}
	
	// 페이징바_검색 필터별 포인트 내역 총 개수
	public int selectMMFilterListCount(int userNo, String filter) {
		Connection conn = getConnection();
		int listCount = new PointDao().selectMMFilterListCount(conn, userNo, filter);
		close(conn);
		
		return listCount;		
	}
	
	// 사용자_포인트 내역 조회
	public ArrayList<Point> selectUserHistory(int userNo, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Point> list = new PointDao().selectUserHistory(conn, userNo, pi);
		close(conn);
		
		return list;
	}
	
	// 사용자_검색 필터별 포인트 내역 조회
	public ArrayList<Point> selectUserHistory(int userNo, String filter, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Point> list = new PointDao().selectUserHistory(conn, userNo, filter, pi);
		close(conn);
		
		return list;
	}
	
	// 관리자_포인트 적립
	public int insertPointPlus(String userNo, int amount, String reason) {
		Connection conn = getConnection();
		int result = new PointDao().insertPointPlus(conn, userNo, amount, reason);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}		
		close(conn);

		return result;
	}
	
}
