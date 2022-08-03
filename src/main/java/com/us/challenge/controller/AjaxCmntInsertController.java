package com.us.challenge.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.challenge.model.service.ChallengeService;
import com.us.challenge.model.vo.Comment;
import com.us.member.model.vo.Member;

/**
 * Servlet implementation class AjaxCmntInsertController
 */
@WebServlet("/cmntInsert.ch")
public class AjaxCmntInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCmntInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int challNo = Integer.parseInt(request.getParameter("no"));
		String cmntContent = request.getParameter("content");
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		Comment cmnt = new Comment();
		cmnt.setChallNo(challNo);
		cmnt.setCmntContent(cmntContent);
		cmnt.setCmntWriter(String.valueOf(userNo));
				
		int result = new ChallengeService().insertCmnt(cmnt);
		
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
