package com.us.cs.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.us.cs.qna.model.service.QnaService;
import com.us.cs.qna.model.vo.Qna;

/**
 * Servlet implementation class AdQnaUpdateController
 */
@WebServlet("/adUpdate.qa")
public class AdQnaUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdQnaUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 전달값
		String ansWriter = request.getParameter("ansWriter");
		String qnaAns = request.getParameter("qnaAns");
		int qNo = Integer.parseInt(request.getParameter("qNo"));
		
		Qna q = new Qna(qNo, ansWriter, qnaAns);
		
		int result = new QnaService().adQnaUpdate(q);
		if(result > 0) {	// 수정 성공
			response.sendRedirect(request.getContextPath() + "/adUpdateForm.qa?qNo=" + qNo);
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("modalMsg", "Q&A 답변 등록/수정에 실패하였습니다.");
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
