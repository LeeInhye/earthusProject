package com.us.cs.faq.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.us.common.model.vo.PageInfo;
import com.us.cs.faq.model.service.FaqService;
import com.us.cs.faq.model.vo.Faq;
import com.us.member.model.vo.Member;

/**
 * Servlet implementation class AdFaqListController
 */
@WebServlet("/adList.fq")
public class AdFaqListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdFaqListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 페이징 처리
		int listCount;	//  현재 게시글 총 갯수
		int currentPage;	// 사용자가 요청한 페이지
		int pageLimit;	// 페이징 바 최대 갯수
		int boardLimit;	// 페이지당 게시글 최대 갯수
		
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new FaqService().selectListCount();
		currentPage = Integer.parseInt(request.getParameter("fpage"));
		pageLimit = 5;
		boardLimit = 5;
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		int n = (currentPage - 1)/pageLimit;
		startPage = n * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 페이징바에 필요한 객체
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

		
		// 현재 요청한 페이지에 보여질 게시글 리스트 조회
		ArrayList<Faq> list = new FaqService().selectAdFaqList(pi);
		
		// 응답뷰
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		if(loginUser == null) {
			response.sendRedirect(request.getContextPath() + "/goLogin.me");
		} else {
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/cs/faq/adFaqListView.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
