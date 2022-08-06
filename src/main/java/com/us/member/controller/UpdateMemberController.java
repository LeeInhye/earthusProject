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
 * Servlet implementation class UpdateMemberController
 */
@WebServlet("/update.me")
public class UpdateMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 전달값 가져오기
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String newPwd = request.getParameter("inputNewPwd");
		String userName = request.getParameter("userName");
		String email = request.getParameter("inputEmail");
		String phone = request.getParameter("inputPhone");
		String zonecode = request.getParameter("zonecode");
		String address = request.getParameter("address");
		String addrExtra = request.getParameter("addr_extra");
		String addrDetail = request.getParameter("addr_detail");
		String userBirth = request.getParameter("birthday");
		String gender = request.getParameter("gender");
		
		Member m = null;
		// Member 객체에 전달값 담기
		if(newPwd.equals("")) {
			m = new Member(userId, userPwd, userName, email, phone, zonecode, address, addrExtra, addrDetail, userBirth, gender);
		} else {
			m = new Member(userId, newPwd, userName, email, phone, zonecode, address, addrExtra, addrDetail, userBirth, gender);
		}
		
		
		System.out.println(newPwd);
		// 회원정보가 수정됐는지 확인
		int result = new MemberService().updateMember(m);
		
		Member newM = null;
		// 수정된 회원 정보 조회
		if(newPwd.equals("")) {
			newM = new MemberService().loginMember(userId, userPwd);
		} else {
			newM = new MemberService().loginMember(userId, newPwd);
		}
		
		
		HttpSession session = request.getSession();
		
		if(result > 0) {	// 수정 성공
			//response.sendRedirect(request.getContextPath() + "/goUpdate.me");
			session.setAttribute("modalMsg", "회원 정보 수정에 성공하였습니다.");
			request.getRequestDispatcher("/views/common/errorModal.jsp").forward(request, response);
			session.setAttribute("loginUser", newM);
		} else {	// 수정 실패
			session.setAttribute("modalId", "updateMemberFail");
			session.setAttribute("modalMsg", "회원 정보 수정에 실패하였습니다.");
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
