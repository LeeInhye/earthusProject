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
import com.us.member.model.service.MemberService;
import com.us.member.model.vo.Member;

/**
 * Servlet implementation class adCmntGivePointController
 */
@WebServlet("/givePoint.ch")
public class adCmntGivePointController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adCmntGivePointController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userName = request.getParameter("userName");
		int challNo = Integer.parseInt(request.getParameter("no"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		int cmntNo = Integer.parseInt(request.getParameter("cmntNo"));
		
		Member m = new ChallengeService().selectByUserName(userName);
		int userNo = m.getUserNo();
		
		Challenge ch = new ChallengeService().selectChall(challNo);
		String challTitle = ch.getChallTitle();
		
		int result = new ChallengeService().givePoint(userNo, challNo, challTitle, amount, cmntNo);
		
		response.getWriter().print(result);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
