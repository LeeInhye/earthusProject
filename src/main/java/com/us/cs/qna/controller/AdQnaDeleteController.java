package com.us.cs.qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.common.model.vo.Attachment;
import com.us.cs.qna.model.service.QnaService;

/**
 * Servlet implementation class AdQnaDeleteController
 */
@WebServlet("/adDelete.qa")
public class AdQnaDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdQnaDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 선택한 자주묻는질문 번호 문자열
		String cntNo = request.getParameter("checkCnt");
		
		ArrayList<Attachment> atlist = new ArrayList<>();
		atlist = new QnaService().selectAdAttachment(cntNo);
		
		int result = new QnaService().adDeleteQna(cntNo, atlist);
		
		if(result > 0) {
			response.getWriter().print(result);
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
