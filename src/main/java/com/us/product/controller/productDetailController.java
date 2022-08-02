package com.us.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.us.product.model.service.ProductService;
import com.us.product.model.vo.ProQna;
import com.us.product.model.vo.Product;

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
		
		String proCode = request.getParameter("proCode");
		
		int result = new ProductService().increaseProCount(proCode);
		Product p = new ProductService().selectProduct(proCode);
		
		// 페이징 x, 리스트만 전달하기
		ArrayList<ProQna> list = new ProductService().selectProQnaList(proCode);
		
		
		HttpSession session = request.getSession();
		if(result > 0 && p != null) { // 상품 조회 성공, 조회수 1 증가
			
			session.setAttribute("p", p);
			session.setAttribute("list", list);
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
