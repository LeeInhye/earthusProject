package com.us.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.us.common.model.vo.PageInfo;
import com.us.member.model.vo.Member;
import com.us.product.model.service.ProductService;
import com.us.product.model.vo.ProQna;
import com.us.product.model.vo.Product;
import com.us.product.model.vo.WishList;

/**
 * Servlet implementation class productDetailController
 */
@WebServlet("/detail.pro")
public class productDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String proCode = request.getParameter("proCode");
		
		// 조회수 1 증가
		int result = new ProductService().increaseProCount(proCode);
		
		// 상품 정보 조회
		Product p = new ProductService().selectProduct(proCode);
		
		// 상품 문의 페이징 처리에 필요한 객체 세팅
		int listCount = new ProductService().selectQlistCount(proCode);
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int pageLimit = 5;
		int boardLimit = 5;
		
		int maxPage = (int)Math.ceil( (double)listCount / boardLimit );
		int startPage = (currentPage - 1) * pageLimit / pageLimit + 1;
		int endPage = currentPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// 상품 문의 리스트
		ArrayList<ProQna> list = new ProductService().selectProQnaList(pi, proCode);
		
		// 상품 찜 여부
		if( ((Member)session.getAttribute("loginUser")) != null ) {
			int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
			WishList w = new ProductService().checkWish(userNo, proCode);
			
			request.setAttribute("w", w);
		}
		
		// 페이지 요청
		if(result > 0 && p != null) { // 상품 조회 성공, 조회수 1 증가
			
			request.setAttribute("p", p);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/product/productDetailView.jsp").forward(request, response);
		}else {
			request.setAttribute("errorMsg", "상품 조회 실패");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
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
