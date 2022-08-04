package com.us.product.controller;

import static com.us.common.JDBCTemplate.getConnection;

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
import com.us.common.model.vo.PageInfo;
import com.us.product.model.dao.adProductDao;
import com.us.product.model.service.adProductService;
import com.us.product.model.vo.ProQna;

/**
 * Servlet implementation class AjaxAdProQnaListSortController
 */
@WebServlet("/adSort.pq")
public class AjaxAdProQnaListSortController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdProQnaListSortController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		// select 태그에서 선택된 값 "전체" "답변대기중" "답변완료"
		String option = request.getParameter("option");
		
		// 페이징
		int listCount = new adProductService().selectpqlistCount2(option);
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int pageLimit = 5;
		int boardLimit = 6;
		
		int maxPage = (int)Math.ceil( (double)listCount / boardLimit );
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		if(maxPage > endPage) {
			maxPage = endPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// Service 단계 없이 바로 Dao 호출
		Connection conn = getConnection();
		ArrayList<ProQna> list = new adProductDao().selectSortProQnaList(conn, pi, option);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("pi", pi);
		map.put("list", list);
		
		response.setContentType("application/json; charset=utf-8");
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
