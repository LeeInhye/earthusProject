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
 * Servlet implementation class AjaxCmntListController
 */
@WebServlet("/cmntList.ch")
public class AjaxCmntListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCmntListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int challNo = Integer.parseInt(request.getParameter("no"));

		// * 페이징 처리
		int listCount = new ChallengeService().selectCmntCount(challNo); // 현재 게시글 총 갯수
		int currentPage = Integer.parseInt(request.getParameter("cpage")); // 사용자가 보게 될 페이지 (즉, 사용자가 요청한 페이지)
		int pageLimit = 3; // 페이징바의 페이지 최대 갯수 (몇 개 단위씩)		
		int boardLimit = 5; // 한 페이지당 보여질 댓글 최대 갯수 (몇 개 단위씩)
		
		int maxPage = (int)Math.ceil( (double)listCount / boardLimit ); // 제일 마지막 페이지 수 (총 페이지 수)
		int startPage = (currentPage-1) / pageLimit * pageLimit + 1; // 페이징바의 시작 수
		int endPage = startPage + pageLimit - 1; // 페이징바의 끝 수

		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Comment> list = new ChallengeService().selectCmntList(challNo, pi);
		
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
