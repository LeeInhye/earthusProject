package com.us.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.product.model.service.CheckoutListService;
import com.us.product.model.vo.Cart;

/**
 * Servlet implementation class CheckoutListViewController
 */
@WebServlet("/checkoutList.or")
public class CheckoutListViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutListViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/// 장바구니에서 이동 -> DB에서 여러 상품 조회 : ArrayList<Cart> (proCode, proName, price)를 전달

		request.setCharacterEncoding("UTF-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String proCode = request.getParameter("orderProCode");
		
		
		
		ArrayList<Cart> list = new ArrayList<>();
		
		// 바로결제에서 이동한 경우
		// 결제 페이지에 회원번호, 상품코드, 상품명 전달 => ArrayList로
		list = new CheckoutListService().selectProList(userNo, proCode);
		
		System.out.println("proCode : " + proCode);
		
		String orderProCode = "";
		for(Cart c : list) {
			System.out.println("결제페이지로 보내는 Cart객체 : " + c);
			orderProCode += c.getProCode() + ",";
		}
		
		orderProCode = orderProCode.substring(0, orderProCode.lastIndexOf(","));
		
		System.out.println("결제페이지로 보내는 orderProCode : " + orderProCode);
		
		request.setAttribute("list", list);
		request.setAttribute("orderProCode", orderProCode);
		request.getRequestDispatcher("views/order/checkoutListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
