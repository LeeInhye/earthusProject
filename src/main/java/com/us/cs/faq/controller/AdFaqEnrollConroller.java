package com.us.cs.faq.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.us.cs.faq.model.service.FaqService;
import com.us.cs.faq.model.vo.Faq;
import com.us.member.model.vo.Member;

/**
 * Servlet implementation class AdFaqEnrollConroller
 */
@WebServlet("/adEnroll.fq")
public class AdFaqEnrollConroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdFaqEnrollConroller() {
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
		String csCate = request.getParameter("csCate");
		String fTitle = request.getParameter("fTitle");
		String fContent = request.getParameter("fContent");
		
		String fWriter = "";
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			response.sendRedirect(request.getContextPath() + "/goLogin.me");
		} else {
			fWriter = Integer.toString(loginUser.getUserNo());
			
			Faq f = new Faq(fWriter, csCate, fTitle, fContent);
			
			int result = new FaqService().insertFaq(f);
			
			// 자주 묻는 질문 등록 성공
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/adList.fq?fpage=1");
			} else {
				session.setAttribute("modalMsg", "공지사항 작성에 실패하였습니다.");
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
