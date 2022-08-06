package com.us.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.us.member.model.vo.Member;
import com.us.product.model.service.adProductService;

/**
 * Servlet implementation class adProQnaUpdate
 */
@WebServlet("/update.pq")
public class adProQnaUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adProQnaUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String proAContent = request.getParameter("proAContent");
		int proQnaNo = Integer.parseInt(request.getParameter("proQnaNo"));
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo(); // 관리자 고유번호
		int result = new adProductService().updateProQna(userNo, proAContent, proQnaNo);
		
		if(result > 0) { //성공
			
			request.setAttribute("modalId", "pqModal");
			request.setAttribute("modalMsg", "답변이 등록되었습니다.");
			request.setAttribute("url", request.getContextPath() + "/adlist.pq?cpage=1");
			request.getRequestDispatcher("/views/common/adSuccessPage.jsp").forward(request, response);
			
		}else { //실패
			request.setAttribute("arrorMsg","상품 문의 답변 등록 실패");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
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
