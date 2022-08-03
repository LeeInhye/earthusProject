package com.us.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.member.model.vo.Member;
import com.us.product.model.service.ReviewService;
import com.us.product.model.vo.Product;
import com.us.product.model.vo.Review;

/**
 * Servlet implementation class ReviewInsertController
 */
@WebServlet("/insert.re")
public class ReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     * 리뷰 입력 팝업창으로 넘어가는 요청처리 수행하는 서블릿
     */
    public ReviewInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 리뷰 작성 전 : 로그인 유저(userNo), 유저가 상품을 구입했는지 체크하고 작성창으로 연결
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		String proCode = ((Product)request.getSession().getAttribute("p")).getProCode();
		
		// 상품 구입 여부를 체크
		Review r = null;
		r = new ReviewService().checkPurchase(userNo, proCode);
		
		if(r != null) {
			// 상품 구입 여부 -> TRUE -> Review 객체에 값이 담겨 옴
			// => 필요한 값 (USER_NO, PRO_CODE, PRO_NAME, PRO_IMG_PATH 담아 넘기기)
			request.getSession().setAttribute("r", r);
			request.getRequestDispatcher("views/product/reviewInsertView.jsp");	
		} else {
			response.sendRedirect(request.getContextPath() + "/detail.pro?proCode=" + proCode);
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
