package com.us.point.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.point.model.service.PointService;

/**
 * Servlet implementation class adPointPlusController
 */
@WebServlet("/plus.po")
public class adPointPlusController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adPointPlusController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String userNo = request.getParameter("userNo");
		int amount = Integer.parseInt(request.getParameter("amount"));
		String reason = request.getParameter("reason");
		
		int result = 0;
		
		if(amount > 0) { // 적립
			result = new PointService().insertPointPlus(userNo, amount, reason);
		}else { // 회수
			result = new PointService().insertPointMinus(userNo, amount, reason);
		}
		
		if(result > 0) { // 성공 => 적립/회수 리스트 페이지
			response.sendRedirect(request.getContextPath() + "/adList.po?cpage=1");
		}else { // 실패 => 에러 페이지
			request.setAttribute("errorMsg", "포인트 적립/회수 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
