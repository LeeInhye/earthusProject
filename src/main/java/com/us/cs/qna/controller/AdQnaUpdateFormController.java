package com.us.cs.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.us.common.model.vo.Attachment;
import com.us.cs.qna.model.service.QnaService;
import com.us.cs.qna.model.vo.Qna;
import com.us.member.model.vo.Member;

/**
 * Servlet implementation class AdQnaUpdateFormController
 */
@WebServlet("/adUpdateForm.qa")
public class AdQnaUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdQnaUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전달값
		int qNo = Integer.parseInt(request.getParameter("qNo"));
		
		Qna q = new QnaService().selectQna(qNo);
		Attachment at = new QnaService().selectAttachment(qNo);
		
		q.setQnaNo(qNo);
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		if(loginUser == null) {
			response.sendRedirect(request.getContextPath() + "/goLogin.me");
		} else {
			request.setAttribute("at", at);
			request.setAttribute("q", q);
			request.getRequestDispatcher("/views/cs/qna/adQnaUpdateForm.jsp").forward(request, response);
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
