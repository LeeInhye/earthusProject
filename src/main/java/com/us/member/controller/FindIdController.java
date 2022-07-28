package com.us.member.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.us.common.JDBCTemplate;
import com.us.member.model.dao.MemberDao;

/**
 * Servlet implementation class FindIdController
 */
@WebServlet("/findId.me")
public class FindIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String inputName = request.getParameter("inputName");
		String inputEmail = request.getParameter("inputEmail");
		
		String findId = "";
		
		// Service 단계 없이 바로 Dao 호출
		Connection conn = JDBCTemplate.getConnection();
		findId = new MemberDao().findId(conn, inputName, inputEmail);
		JDBCTemplate.close(conn);
		
		// 응답 데이터 돌려주기
		if(findId == "") {	// 아이디 못찾음
			response.getWriter().print("FIDNN");
			
		} else {	// 아이디 찾음
			response.getWriter().print(findId);
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
