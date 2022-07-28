package com.us.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.us.member.model.service.MemberService;

/**
 * Servlet implementation class UpdatePwdController
 */
@WebServlet("/updatePwd.me")
public class UpdatePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 전달값 가져오기
		String inputId = request.getParameter("inputId");
		String newPwd = request.getParameter("newInputPwd");
		
		// 해당 회원의 비밀번호 변경
		int result = new MemberService().updatePwd(inputId, newPwd);
		
		if(result > 0) {	// 비밀번호 변경 완료
			response.sendRedirect(request.getContextPath() + "/findPwdSuccess.me");
		} else {	// 비밀번호 변경 오류
			HttpSession session = request.getSession();
			session.setAttribute("modalId", "updatePwd_fail");
			session.setAttribute("modalMsg", "비밀번호 변경 오류");
			request.getRequestDispatcher("/views/common/errorModal.jsp").forward(request, response);
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
