package com.us.challenge.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.challenge.model.service.ChallengeService;
import com.us.challenge.model.vo.Challenge;
import com.us.common.model.vo.PageInfo;
import com.us.contents.model.service.ContentsService;

/**
 * Servlet implementation class ChallListController
 */
@WebServlet("/list.ch")
public class ChallListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChallListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// * 페이징 처리
		int listCount = new ChallengeService().selectListCount(); // 현재 게시글 총 갯수
		int currentPage = Integer.parseInt(request.getParameter("cpage")); // 사용자가 보게 될 페이지 (즉, 사용자가 요청한 페이지)
		int pageLimit = 3; // 페이징바의 페이지 최대 갯수 (몇 개 단위씩)		
		int boardLimit = 4; // 한 페이지당 보여질 게시글의 최대 갯수 (몇 개 단위씩)
		
		int maxPage = (int)Math.ceil( (double)listCount / boardLimit ); // 제일 마지막 페이지 수 (총 페이지 수)
		int startPage = (currentPage-1) / pageLimit * pageLimit + 1; // 페이징바의 시작 수
		int endPage = startPage + pageLimit - 1; // 페이징바의 끝 수

		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		  
		// * 현재 요청한 페이지(currentPage)에 보여질 게시글 리스트 조회 (boardLimit수만큼 조회)
		ArrayList<Challenge> list = new ChallengeService().selectChallList(pi);
		
		// 메인에 띄울 챌린지
		request.getSession().setAttribute("chList", list);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/challenge/challListView.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
