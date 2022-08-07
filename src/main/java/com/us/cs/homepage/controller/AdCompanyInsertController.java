package com.us.cs.homepage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.us.cs.homepage.model.service.AdCompanyService;

/**
 * Servlet implementation class AdCompanyInfoViewController
 */
@WebServlet("/insertInfo.hm")
public class AdCompanyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdCompanyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		/* System.out.println(request); */
		
		String html = request.getParameter("comInfo");
		
		int result = new AdCompanyService().insertPost(html, 1);
		
		if(result > 0) {
			request.setAttribute("html", html);
			request.getRequestDispatcher("views/cs/homepage/companyInfo.jsp").forward(request, response);
			session.setAttribute("successMsg", "성공적으로 등록하였습니다.");
		}else {
			session.setAttribute("errorMsg", "등록에 실패하였습니다.");
			response.sendRedirect(request.getContextPath());
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
