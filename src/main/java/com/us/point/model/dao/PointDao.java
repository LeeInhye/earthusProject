package com.us.point.model.dao;

import static com.us.common.JDBCTemplate.close;
import static com.us.common.JDBCTemplate.commit;
import static com.us.common.JDBCTemplate.getConnection;
import static com.us.common.JDBCTemplate.rollback;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.us.challenge.model.vo.Challenge;
import com.us.common.model.vo.PageInfo;
import com.us.member.model.vo.Member;
import com.us.point.model.vo.Point;

public class PointDao {
	
	private Properties prop = new Properties();
	
	public PointDao() {
		try {
			prop.loadFromXML(new FileInputStream( PointDao.class.getResource("/db/sql/point-mapper.xml").getPath() ));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 페이징바_현재 총 포인트 내역 개수
	public int selectListCount(Connection conn) {
		// select => ResultSet(숫자 한 개) => listCount
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	// 관리자_포인트 내역 조회
	public ArrayList<Point> selectHistory(Connection conn, PageInfo pi) {
		// select => ResultSet(여러 행) => ArrayList<Point>
		ArrayList<Point> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectHistory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Point(rset.getInt("point_no"),
								   rset.getString("point_type"),
								   rset.getString("point_reason"),
								   rset.getInt("point_amount"),
								   rset.getInt("point_balance"),
								   rset.getDate("point_date"),
								   rset.getString("user_id"),
								   rset.getString("user_name")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	// 관리자_검색 결과 총 포인트 내역 개수
	public int searchListCount(Connection conn, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("searchListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + keyword + "%");
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	// 관리자_검색 결과 포인트 내역 조회
	public ArrayList<Point> searchHistory(Connection conn, PageInfo pi, String keyword){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Point> list = new ArrayList<>();
		
		String sql = prop.getProperty("searchHistory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + keyword + "%");
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Point(rset.getInt("point_no"),
								   rset.getString("point_type"),
								   rset.getString("point_reason"),
								   rset.getInt("point_amount"),
								   rset.getInt("point_balance"),
								   rset.getDate("point_date"),
								   rset.getString("user_id"),
								   rset.getString("user_name")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	// 페이징바_회원별 포인트 내역 총 개수
	public int selectMMListCount(Connection conn, int userNo) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMMListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	// 페이징바_회원별 포인트 내역에서 검색 필터별 내역 총 개수
	public int selectMMFilterListCount(Connection conn, int userNo, String filter) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMMListCount") + filter;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	// 사용자_포인트 내역 조회
	public ArrayList<Point> selectUserHistory(Connection conn, int userNo, PageInfo pi) {
		ArrayList<Point> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectUserHistory1") + prop.getProperty("selectUserHistory2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Point(rset.getInt("point_no"),
								   rset.getString("point_type"),
								   rset.getString("point_reason"),
								   rset.getInt("point_amount"),
								   rset.getInt("point_balance"),
								   rset.getDate("point_date"),
								   rset.getString("user_id"),
								   rset.getString("user_name")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	// 사용자_포인트 내역 검색 필터별 조회
	public ArrayList<Point> selectUserHistory(Connection conn, int userNo, String filter, PageInfo pi) {
		ArrayList<Point> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql1 = prop.getProperty("selectUserHistory1");
		String sql2 = prop.getProperty("selectUserHistory2");
		
		String sql = sql1 + filter + sql2;
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Point(rset.getInt("point_no"),
								   rset.getString("point_type"),
								   rset.getString("point_reason"),
								   rset.getInt("point_amount"),
								   rset.getInt("point_balance"),
								   rset.getDate("point_date"),
								   rset.getString("user_id"),
								   rset.getString("user_name")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
}
