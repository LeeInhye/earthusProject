package com.us.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.us.member.model.service.MemberService;
import com.us.member.model.vo.Member;

/**
 * Servlet implementation class AdMemberUpdateController
 */
@WebServlet("/adUpdate.me")
public class AdMemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdMemberUpdateController() {
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
		String mNo = request.getParameter("mNo");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("inputPwd");
		String userName = request.getParameter("userName");
		String email = request.getParameter("inputEmail");
		String phone = request.getParameter("inputPhone");
		String zonecode = request.getParameter("zonecode");
		String address = request.getParameter("address");
		String addrExtra = request.getParameter("addr_extra");
		String addrDetail = request.getParameter("addr_detail");
		
		Member m = new Member(userId, userPwd, userName, email, phone, zonecode, address, addrExtra, addrDetail);
		
		int result = new MemberService().adUpdateMember(mNo, m);
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			response.sendRedirect(request.getContextPath() + "/goLogin.me");
		} else {
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/adList.me?mpage=1");
			} else {
				session.setAttribute("modalMsg", "회원 수정에 실패하였습니다.-관-");
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
