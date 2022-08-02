package com.us.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.product.model.service.ReviewService;
import com.us.product.model.vo.Review;

/**
 * Servlet implementation class AjaxReviewInsertController
 */
@WebServlet("/insert.re")
public class AjaxReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReviewInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 리뷰 객체 채우기, 요청처리
		Review r = new Review();
		r.setUserNo( Integer.parseInt(request.getParameter("userNo")) );
		r.setProCode( request.getParameter("proCode") );
		r.setRevRate( Integer.parseInt(request.getParameter("revRate")) );
		r.setRevContent( request.getParameter("revContent") );
		r.setRevType("T");
		
		int result = new ReviewService().insertReview(r);
		
		// 리뷰 파일첨부했을 때에는...?
		if( request.getParameter("photo") != null) {
			
		}
		Attachment at = new Attachment();
		
		response.getWriter().print(result);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
