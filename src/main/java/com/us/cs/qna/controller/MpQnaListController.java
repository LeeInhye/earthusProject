package com.us.cs.qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.us.common.model.vo.PageInfo;
import com.us.cs.qna.model.service.QnaService;
import com.us.cs.qna.model.vo.Qna;
import com.us.member.model.vo.Member;

/**
 * Servlet implementation class MpQnaListController
 */
@WebServlet("/mpList.qa")
public class MpQnaListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MpQnaListController() {
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
		
		//로그인 한 회원의 Q&A리스트만 보여준다
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		
		// 응답뷰
		if(m == null) {
			response.sendRedirect(request.getContextPath() + "/goLogin.me");
		} else {
			int userNo = m.getUserNo();
			
			
			listCount = new QnaService().selectMpQnaListCount(userNo);
			currentPage = Integer.parseInt(request.getParameter("mqpage"));
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
			ArrayList<Qna> list = new QnaService().selectMpQnaList(pi, userNo);
		
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/cs/qna/mpQnaListView.jsp").forward(request, response);
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
