package com.us.cs.homepage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.cs.homepage.model.service.AdCompanyService;

/**
 * Servlet implementation class AdTermsInsertController
 * 이용약관 에디터로 입력 후 변경사항 반영하면 DB에 INSERT, 사용자 페이지의 변경된 페이지를 띄우기
 */
@WebServlet("/insertTerms.hm")
public class AdTermsInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdTermsInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 이용약관은 한글 포함, 첨부파일 없음
		request.setCharacterEncoding("UTF-8");
		String html = request.getParameter("terms");
		int result = new AdCompanyService().insertPost(html, 2);
		
		if(result > 0) {
			request.setAttribute("successMsg", "성공적으로 이용약관을 등록하였습니다.");
			request.setAttribute("html", html);
			request.getRequestDispatcher("views/cs/homepage/termsView.jsp").forward(request, response);;
		}else {
			request.setAttribute("errorMsg", "등록에 실패하였습니다");
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
