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
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩 작업
		request.setCharacterEncoding("UTF-8");
		
		// 전달값을 변수 및 객체에 기록
		String userId = request.getParameter("inputId");
		String userPwd = request.getParameter("inputPwd");
		String userName = request.getParameter("inputName");
		String email = request.getParameter("inputEmail");
		String phone = request.getParameter("inputPhone");
		String zonecode = request.getParameter("zonecode");
		String address = request.getParameter("address");
		String addrExtra = request.getParameter("addr_extra");
		String addrDetail = request.getParameter("addr_detail");
		
		String birthday = request.getParameter("birthday");
		
		String gender = request.getParameter("gender");
		
		String status = "";
		
		// 아이디에 admin이 포함되어있으면 관리자 계정으로 처리
		if( userId.contains("admin") ) {
			status = "M";
		} else{
			status = "Y";
		}
		
		// 변수들을 Member 객체에 넣기
		Member m = new Member(userId, userPwd, userName, email, phone, zonecode, address, addrExtra, addrDetail, birthday, gender, status);
		
		// 요청 처리
		int result = new MemberService().insertMember(m);
		
		HttpSession session = request.getSession();
		// 처리결과를 갖고 보게 될 응답화면
		if(result > 0) {	// 성공 => 회원가입 완료 페이지로 이동
			session.setAttribute("m", m);
			request.getRequestDispatcher("views/member/memberJoin_3.jsp").forward(request, response);
			
		} else {	// 실패 => 에러 페이지로 이동
			session.setAttribute("modalMsg", "회원가입 실패");
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
