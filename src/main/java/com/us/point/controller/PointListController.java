package com.us.point.controller;

import java.io.IOException;
import java.sql.Date;
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
 * Servlet implementation class PointListController
 */
@WebServlet("/list.po")
public class PointListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PointListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			response.sendRedirect(request.getContextPath() + "/goLogin.me");
		} else {
			int userNo = loginUser.getUserNo();
		
			// * 페이징 처리
			int listCount = new PointService().selectMMListCount(userNo); // 현재 포인트 내역 총 갯수
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
			
			// * 회원별 포인트 내역 조회 (boardLimit수만큼 조회)
			ArrayList<Point> list = new PointService().selectUserHistory(userNo, pi);

			// 첫번째 포인트 내역의 날짜 뽑기 (제일 예전)
				// 마지막 페이지로 pi 생성
				PageInfo piLast = new PageInfo(listCount, maxPage, pageLimit, boardLimit, maxPage, startPage, endPage);
				ArrayList<Point> lastList = new PointService().selectUserHistory(userNo, piLast);
				// 마지막 페이지의 맨 마지막 Point 객체에서 날짜 뽑기
				int lastIdx = 0;
				Date firstDate = null;
				
				if(!lastList.isEmpty()) {
					lastIdx = lastList.size() - 1;
					firstDate = lastList.get(lastIdx).getPointDate();

					request.setAttribute("firstDate", firstDate);
				}
				
			// 마지막 포인트 내역의 날짜 뽑기 (제일 최신)
				// 1페이지로 pi 생성
				PageInfo piFist = new PageInfo(listCount, 1, pageLimit, boardLimit, maxPage, startPage, endPage);
				ArrayList<Point> firstList = new PointService().selectUserHistory(userNo, piFist);
				// 1페이지의 첫 Point 객체에서 날짜 뽑기
				if(!firstList.isEmpty()) {
				Date lastDate = firstList.get(0).getPointDate();
				request.setAttribute("lastDate", lastDate);
				}
				
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("views/point/myPagePointListView.jsp").forward(request, response);
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
