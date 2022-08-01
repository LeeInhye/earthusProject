package com.us.contents.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.contents.model.service.ContentsService;

/**
 * Servlet implementation class adAjaxContentsDeleteController
 */
@WebServlet("/delete.co")
public class adAjaxContentsDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adAjaxContentsDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String cntNo = request.getParameter("checkCnt");
		
		int result = new ContentsService().deleteContents(cntNo);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/adList.co");
		}else {
			request.setAttribute("modalMsg", "콘텐츠 삭제에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorModal.jsp").forward(request, response);
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
