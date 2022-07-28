package com.us.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.us.member.model.service.MemberService;
import com.us.member.model.vo.Member;

/**
 * Servlet implementation class goVerificationController
 */
@WebServlet("/verification.me")
public class GoVerificationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoVerificationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 전달값 넘겨주기
		String inputId = request.getParameter("findId");
		String inputName = request.getParameter("findName");
		
		// 해당 회원의 이메일을 찾아 같이 넘겨준다
		String memEmail = new MemberService().enterEmail(inputId);
		
		Member pwdM = new Member(inputId, inputName, memEmail);
		
		// 비밀번호 찾기에서 입력한 이름, 아이디, 이메일 value를 저장해둔다.
		HttpSession session = request.getSession();
		session.setAttribute("pwdM", pwdM);
		
		// 단순 페이지 요청
		request.getRequestDispatcher("/views/member/verification.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
