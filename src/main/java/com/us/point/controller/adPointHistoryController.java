package com.us.point.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.us.common.model.vo.PageInfo;
import com.us.member.model.vo.Member;
import com.us.point.model.service.PointService;
import com.us.point.model.vo.Point;

/**
 * Servlet implementation class adPointHistoryController
 */
@WebServlet("/history.po")
public class adPointHistoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adPointHistoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// * 페이징 처리
		int listCount = new PointService().selectListCount(); 
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int pageLimit = 5; 	
		int boardLimit = 5;
		
		int maxPage = (int)Math.ceil( (double)listCount / boardLimit );
		int startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;

		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// 포인트 내역 조회
		ArrayList<Point> list = new PointService().selectHistory(pi);
		
		// 페이지 요청
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		System.out.println(pi);
		System.out.println(list);
		
		if(loginUser == null) {
	         response.sendRedirect(request.getContextPath() + "/goLogin.me");
	    }else {
	    	request.setAttribute("pi", pi);
	    	request.setAttribute("list", list);
	    	request.getRequestDispatcher("views/point/adPointHistoryView.jsp").forward(request, response);	    	
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
