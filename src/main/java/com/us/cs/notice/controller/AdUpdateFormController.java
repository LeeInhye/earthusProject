package com.us.cs.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.us.cs.model.vo.CsCategory;
import com.us.cs.notice.model.service.NoticeService;
import com.us.cs.notice.model.vo.Notice;
import com.us.member.model.vo.Member;

/**
 * Servlet implementation class AdUpdateFormController
 */
@WebServlet("/adUpdateForm.no")
public class AdUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 전달값
		String nNo = request.getParameter("nNo");
		
		// 해당 게시글 정보 가져오기
		Notice n = new NoticeService().selectNotice(nNo);
		
		// 카테고리 목록
		ArrayList<CsCategory> cateList = new NoticeService().selectCategoryList();
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			response.sendRedirect(request.getContextPath() + "/goLogin.me");
		} else {
			request.setAttribute("cateList", cateList);
			request.setAttribute("nNo", nNo);
			request.setAttribute("n", n);
			request.getRequestDispatcher("/views/cs/notice/adNoticeUpdateForm.jsp").forward(request, response);
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
