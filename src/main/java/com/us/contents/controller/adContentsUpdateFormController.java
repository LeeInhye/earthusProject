package com.us.contents.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.common.model.vo.Attachment;
import com.us.contents.model.service.ContentsService;
import com.us.contents.model.vo.Contents;

/**
 * Servlet implementation class adContentsUpdateFormController
 */
@WebServlet("/updateForm.co")
public class adContentsUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adContentsUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int cntNo = Integer.parseInt(request.getParameter("no"));
		
		// 게시글정보, 첨부파일정보
		ContentsService cService = new ContentsService();
		Contents c = cService.selectContents(cntNo);
		Attachment at = cService.selectAttachment(cntNo);
		
		request.setAttribute("c", c);
		request.setAttribute("at", at);

		request.getRequestDispatcher("views/contents/adContentsUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
