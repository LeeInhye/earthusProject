package com.us.challenge.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.us.challenge.model.service.ChallengeService;
import com.us.challenge.model.vo.Comment;
import com.us.common.model.vo.PageInfo;

/**
 * Servlet implementation class adAjaxCmntFilterController
 */
@WebServlet("/filter.ch")
public class adAjaxCmntFilterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adAjaxCmntFilterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// "", "Y", "N"
		String selectSt = request.getParameter("selectSt");
		if(selectSt != "") {
			selectSt = "AND CMNT_STATUS = '" + request.getParameter("selectSt") + "'";
		}
		
		int challNo = Integer.parseInt(request.getParameter("no"));
	
		// * 페이징 처리
		int listCount = new ChallengeService().selectCmntCount(challNo, selectSt);
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int pageLimit = 3;	
		int boardLimit = 5;
		int maxPage = (int)Math.ceil( (double)listCount / boardLimit );
		int startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1; 

		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

		// * 필터별 댓글리스트 받아서 넘기기
		ArrayList<Comment> list = new ChallengeService().selectCmntList(challNo, selectSt, pi);
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
