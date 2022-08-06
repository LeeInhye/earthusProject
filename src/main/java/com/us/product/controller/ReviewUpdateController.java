package com.us.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.member.model.vo.Member;
import com.us.product.model.service.ReviewService;
import com.us.product.model.vo.Review;

/**
 * Servlet implementation class ReviewUpdateController
 */
@WebServlet("/update.re")
public class ReviewUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// userNo, form으로 받은 proCode로 수정할 리뷰 정보 조회, 응답 페이지로 넘기기
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int revNo = Integer.parseInt(request.getParameter("revNo"));
		
		
		Review r = new ReviewService().selectReview(userNo, revNo);
		if(r != null) {
			request.setAttribute("r", r); // 수정할 리뷰에 대한 정보를 담은 객체
			request.getRequestDispatcher("views/product/mypageReviewEditView.jsp").forward(request, response);
		} else {
			request.setAttribute("errorMsg", "수정하고자 하는 리뷰 찾기에 실패하였습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
