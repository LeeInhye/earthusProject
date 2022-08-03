package com.us.cs.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.cs.qna.model.service.QnaService;
import com.us.cs.qna.model.vo.Qna;

/**
 * Servlet implementation class QnaPwdController
 */
@WebServlet("/checkPwd.qa")
public class QnaPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaPwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qNo = Integer.parseInt(request.getParameter("qNo"));
		String inputPwd = request.getParameter("inputPwd");
		
		// 해당 Q&A 번호의 비밀번호 가져오기
		Qna q = new QnaService().selectQna(qNo);
		String qPwd = q.getQnaPwd();
		System.out.println(qNo);
		System.out.println(qPwd);
		System.out.println(inputPwd);
		
		if(inputPwd.equals(qPwd)) {
			response.getWriter().print("YYY");
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
