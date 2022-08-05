package com.us.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.member.model.vo.Member;
import com.us.product.model.service.CheckoutService;
import com.us.product.model.vo.Cart;
import com.us.product.model.vo.Product;

/**
 * Servlet implementation class CheckoutViewController
 */
@WebServlet("/checkout.or")
public class CheckoutViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/// 바로결제에서 이동 -> DB에서 해당 상품 하나만 결제 : Product(proCode, proName, price)를 전달
		
		request.setCharacterEncoding("UTF-8");
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		Cart c = null;
		
		// 바로결제에서 이동한 경우
		// 결제 페이지에 회원번호, 상품코드, 상품명 전달 => 얘도 그냥 Cart로 전달해볼까?
		c = new Cart();
		c.setUserNo(userNo);
		c.setProCode( request.getParameter("proCode") );
		c.setProName( request.getParameter("proName") );
		c.setPrice( Integer.parseInt(request.getParameter("price")) );
		c.setProQty( Integer.parseInt(request.getParameter("proQty")) );
	
		request.setAttribute("orderProduct", c);
		request.getRequestDispatcher("views/order/checkoutView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
