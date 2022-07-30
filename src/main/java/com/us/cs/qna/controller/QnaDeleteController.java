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

/**
 * Servlet implementation class QnaDeleteController
 */
@WebServlet("/delete.qa")
public class QnaDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		
		HttpSession session = request.getSession();
		
			int qNo = Integer.parseInt(request.getParameter("qNo"));
			
			// 첨부파일 insert
			Attachment at = null;
			
			
			at = new QnaService().selectAttachment(qNo);
			
			int result = new QnaService().deleteQna(qNo, at);

			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/list.qa?qpage=1");
			} else {
				
				session.setAttribute("modalId", "deleteQnaFail");
				session.setAttribute("modalMsg", "Q&A글 삭제 실패");
				request.getRequestDispatcher("/views/cs/qna/qnaListView.jsp").forward(request, response);
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
