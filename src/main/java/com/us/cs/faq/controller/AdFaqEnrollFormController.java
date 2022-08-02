package com.us.cs.faq.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.us.cs.faq.model.service.FaqService;
import com.us.cs.model.vo.CsCategory;
import com.us.member.model.vo.Member;

/**
 * Servlet implementation class AdFaqEnrollFormController
 */
@WebServlet("/adEnrollForm.fq")
public class AdFaqEnrollFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdFaqEnrollFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 카테고리 목록
		ArrayList<CsCategory> cateList = new FaqService().selectCategoryList();
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			response.sendRedirect(request.getContextPath() + "/goLogin.me");
		} else {
			request.setAttribute("cateList", cateList);
			request.getRequestDispatcher("/views/cs/faq/adFaqEnrollForm.jsp").forward(request, response);
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
