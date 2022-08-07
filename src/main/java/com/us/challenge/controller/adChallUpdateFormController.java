package com.us.challenge.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.us.challenge.model.service.ChallengeService;
import com.us.challenge.model.vo.Challenge;
import com.us.common.model.vo.Attachment;
import com.us.member.model.vo.Member;

/**
 * Servlet implementation class adChallUpdateFormController
 */
@WebServlet("/updateForm.ch")
public class adChallUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adChallUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int challNo = Integer.parseInt(request.getParameter("no"));
		
		// 게시글정보, 첨부파일정보
		ChallengeService cService = new ChallengeService();
		Challenge ch = cService.selectChall(challNo);
		Attachment at = cService.selectAttachment(challNo);
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			response.sendRedirect(request.getContextPath() + "/goLogin.me");
		} else {
			request.setAttribute("ch", ch);
			request.setAttribute("at", at);
			
			request.getRequestDispatcher("views/challenge/adChallUpdateForm.jsp").forward(request, response);
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
