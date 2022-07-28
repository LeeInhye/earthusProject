package com.us.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.member.model.service.MemberService;

/**
 * Servlet implementation class FindPwdController
 */
@WebServlet("/findPwd.me")
public class FindPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 회원 일치 확인하기
		// 전달값 가져오기
		String inputId = request.getParameter("inputId");
		String inputName = request.getParameter("inputName");
		
		// 해당 회원이 있는 지 확인
		int count = new MemberService().findPwd(inputId, inputName);
		
		if(count == 0) {	// 해당 회원정보가 없을 경우
			response.getWriter().print("FPWDNN");
		} else { // 해당 회원정보가 있을 경우
			response.getWriter().print("FPWDNY");
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
