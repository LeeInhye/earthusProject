package com.us.point.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.us.common.model.vo.PageInfo;
import com.us.point.model.service.PointService;
import com.us.point.model.vo.Point;

/**
 * Servlet implementation class PointFilterController
 */
@WebServlet("/filter.po")
public class AjaxPointFilterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxPointFilterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userNo = Integer.parseInt(request.getParameter("no"));
		
		String filter = request.getParameter("filter");
		
		switch(filter) {
		case"all": filter = "";
		case"plus": filter = "AND POINT_TYPE = '적립'";
		case"minus": filter = "AND POINT_TYPE = '사용'";
		}
		
		// * 페이징 처리
		int listCount = new PointService().selectMMFilterListCount(userNo, filter); // 검색필터별 포인트내역 총 갯수
		int currentPage = Integer.parseInt(request.getParameter("cpage")); // 사용자가 보게 될 페이지 (즉, 사용자가 요청한 페이지)
		int pageLimit = 3; // 페이징바의 페이지 최대 갯수 (몇 개 단위씩)		
		int boardLimit = 5; // 한 페이지당 보여질 게시글의 최대 갯수 (몇 개 단위씩)
		
		int maxPage = (int)Math.ceil( (double)listCount / boardLimit ); // 제일 마지막 페이지 수 (총 페이지 수)
		int startPage = (currentPage-1) / pageLimit * pageLimit + 1; // 페이징바의 시작 수
		int endPage = startPage + pageLimit - 1; // 페이징바의 끝 수

		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// * 필터별 내역 리스트 받아서 넘기기
		ArrayList<Point> list = new PointService().selectUserHistory(userNo, filter, pi);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pi", pi);
		
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
