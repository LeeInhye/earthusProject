package com.us.point.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.us.common.JDBCTemplate;
import com.us.common.model.vo.PageInfo;
import com.us.point.model.dao.PointDao;
import com.us.point.model.service.PointService;
import com.us.point.model.vo.Point;

/**
 * Servlet implementation class adPointSearchControlloer
 */
@WebServlet("/adSearch.po")
public class adPointSearchControlloer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adPointSearchControlloer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 검색한 키워드
		String keyword = request.getParameter("keyword");
		
		// 페이징 처리
		int listCount;	//  현재 게시글 총 갯수
		int currentPage;	// 사용자가 요청한 페이지
		int pageLimit;	// 페이징 바 최대 갯수
		int boardLimit;	// 페이지당 게시글 최대 갯수
		
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new PointService().searchListCount(keyword);
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		pageLimit = 5;
		boardLimit = 5;
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		int n = (currentPage - 1)/pageLimit;
		startPage = n * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// 검색 결과로 포인트 내역 조회
		// Service 단계 없이 바로 Dao쪽 호출
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Point> list = new PointDao().searchHistory(conn, pi, keyword);
		JDBCTemplate.close(conn);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("pi", pi);
		map.put("list", list);
		
		// 자바 배열 또는 ArrayList 객체 => JSONArray 형태
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(map, response.getWriter());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
