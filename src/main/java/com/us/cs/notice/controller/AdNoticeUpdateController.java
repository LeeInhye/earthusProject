package com.us.cs.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.us.cs.notice.model.service.NoticeService;
import com.us.cs.notice.model.vo.Notice;
import com.us.member.model.vo.Member;

/**
 * Servlet implementation class AdNoticeUpdateController
 */
@WebServlet("/adUpdate.no")
public class AdNoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdNoticeUpdateController() {
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
		int nNo = Integer.parseInt(request.getParameter("nNo"));
		String csCate = request.getParameter("csCate");
		String nTitle = request.getParameter("nTitle");
		String nContent = request.getParameter("nContent");
		
		String noticeWriter = "";
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			response.sendRedirect(request.getContextPath() + "/goLogin.me");
		} else {
			noticeWriter = Integer.toString(loginUser.getUserNo());
			
			Notice n = new Notice(nNo, noticeWriter, csCate, nTitle, nContent);
			
			int result = new NoticeService().updateNotice(n);
			
			// 공지사항 수정 성공
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/adUpdateForm.no?nNo=" + nNo );
			} else {
				session.setAttribute("modalMsg", "공지사항 수정에 실패하였습니다.");
				request.getRequestDispatcher("/views/common/errorModal.jsp").forward(request, response);
			}
			
			
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
