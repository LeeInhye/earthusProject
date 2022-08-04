package com.us.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.member.model.vo.Member;
import com.us.order.model.vo.Order;
import com.us.product.model.service.CheckoutService;
import com.us.product.model.vo.Cart;

/**
 * Servlet implementation class CheckoutPayController
 */
@WebServlet("/pay.or")
public class CheckoutPayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutPayController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * name : 주문자 이름 phone : 휴대폰번호 email : 이메일 postCode : 우편번호 roadAddr : 도로명주소
		 * detailAddr : 상세주소 shippingMemo : 배송메모 (1, 2, 3) point : 사용할 포인트 payment : 결제(cash / card) cardUid : string
		 */
		
		request.setCharacterEncoding("UTF-8");
		
		Member m = (Member)request.getSession().getAttribute("loginUser");
		ArrayList<Cart> orderList = (ArrayList<Cart>)request.getAttribute("orderList");
		
		Order o = new Order(
					m.getUserNo(),
					request.getParameter("payment"),
					Integer.parseInt(request.getParameter("point")),
					request.getParameter("shippingMemo"),
					Integer.parseInt(request.getParameter("totalPrice")),
					request.getParameter(m.getUserName()),
					request.getParameter(m.getPhone()),
					request.getParameter("name"),
					request.getParameter("phone"),
					request.getParameter("postCode"),
					request.getParameter("roadAddr"),
					request.getParameter("detailAddr")
				);
		
		String proCodes = "";
		for(int i=0; i<orderList.size(); i++) {
			proCodes += orderList.get(i).getProCode() + ",";
		}
		proCodes += proCodes.substring(0, proCodes.lastIndexOf(","));
		
		int result = 0;
		result = new CheckoutService().processPayment(o, orderList, proCodes);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
