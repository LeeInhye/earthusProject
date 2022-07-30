package com.us.cs.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.common.model.vo.Attachment;
import com.us.cs.qna.model.service.QnaService;
import com.us.cs.qna.model.vo.Qna;

/**
 * Servlet implementation class QnaUpdateFormController
 */
@WebServlet("/updateForm.qa")
public class QnaUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전달값
		int qNo = Integer.parseInt(request.getParameter("qno"));
		
		// 해당 글 정보 가져오기
		QnaService qService = new QnaService();
		Qna q = qService.selectQna(qNo);
		Attachment at = qService.selectAttachment(qNo);
		
		request.setAttribute("q", q);
		request.setAttribute("at", at);
		
		// 페이지 응답
		request.getRequestDispatcher("/views/cs/qna/qnaUpdateForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
