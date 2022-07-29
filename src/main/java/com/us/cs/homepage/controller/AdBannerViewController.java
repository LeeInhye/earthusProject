package com.us.cs.homepage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.cs.homepage.model.service.AdBannerService;
import com.us.cs.homepage.model.vo.Banner;
/**
 * Servlet implementation class AdBannerViewController
 * 
 * 관리자 메인페이지 > 배너 관리 클릭 > 요청 처리를 수행하는 Servlet 클래스
 * <<Dao에서 ArrayList<Banner> 여러행 조회하여 응답 페이지에 전달>>
 */
@WebServlet("/list.bn")
public class AdBannerViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdBannerViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 넘겨받은 값 없으므로 인코딩, 변수에 값 담는 과정 필요 없음
		
		// 1. 응답페이지에 필요한 데이터 조회, 변수에 담기
		ArrayList<Banner> list = new AdBannerService().selectList();
		request.setAttribute("list", list);
		
		// 2. 응답페이지 넘기기 (처음 보내는 것이므로 "포워딩" 방식)
		request.getRequestDispatcher("views/cs/homepage/adBannerView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
