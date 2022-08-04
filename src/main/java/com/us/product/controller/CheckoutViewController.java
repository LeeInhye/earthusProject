package com.us.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.member.model.vo.Member;
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
		// 장바구니에서 이동 -> DB에서 input[name=check]:check인 proCode만 모아서 결제 : ArrayList<Cart>를 전달
		// 바로결제에서 이동 -> DB에서 해당 상품 하나만 결제 : Product(proCode, proName, price)를 전달
		
		request.setCharacterEncoding("UTF-8");
		
		// 장바구니에서 이동하면 FORM요소로 넘어옴 		  => input[name=fromCart]의 value가 'T'
		// 바로결제에서 이동하면 FROM요소로 넘어오지 않음 => input요소가 있을 수 없음
		// ==> request.getParameter("fromCart") 가 NULL인지 조건검사해서 넘기면 되지않냐??
		// ==> 결제페이지에서 쓸 list 전달 (하나여도 list로 전달해서 해야 간편할듯)
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		Cart c = null;
		ArrayList<Cart> list = new ArrayList<>();
		
		if(request.getParameter("fromCart") == "T" ) {
			// 장바구니에서 이동한 경우,
			// 결제 페이지에 checked된 Cart(회원번호, 상품코드, 상품명, 수량) 모아서 전달
			list = (ArrayList<Cart>)request.getAttribute("list");
			
		}else {
			// 바로결제에서 이동한 경우
			// 결제 페이지에 회원번호, 상품코드, 상품명 전달 => 얘도 그냥 Cart로 전달해볼까?
			Product p = (Product)request.getSession().getAttribute("p");
			c = new Cart();
			c.setUserNo(userNo);
			c.setProCode( p.getProCode() );
			c.setProName( p.getProName() );
			c.setPrice( Integer.parseInt(p.getPrice()) );
			c.setProQty(1);
			list.add(c);			
		}
		
		request.setAttribute("list", list);
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
