package com.us.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.order.model.vo.Order;
import com.us.product.model.service.CheckoutService;

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
		
		Order o = null;
		int result = 0;
		
		String proQty = request.getParameter("proQty");
		String proCode = request.getParameter("proCode");
		String cardUid = request.getParameter("cardUid");
		
		
		o = new Order(
					Integer.parseInt(request.getParameter("userNo")),
					request.getParameter("payment"),
					Integer.parseInt(request.getParameter("point")),
					request.getParameter("shippingMemo"),
					Integer.parseInt(request.getParameter("totalPrice")),
					request.getParameter("userName"), 
					request.getParameter("userPhone"),
					request.getParameter("name"),
					request.getParameter("phone"),
					request.getParameter("postCode"),
					request.getParameter("roadAddr"),
					request.getParameter("detailAddr")
				);
		
		if( request.getParameter("payment") == "CARD" ) {
			// 카드 결제인 경우 : ORDER, ORDER_PRODUCT, PAY_CARD 테이블에 DML문 처리
			result = new CheckoutService().processCardPayment(o, proQty, proCode, cardUid);
			
			if(result > 0) {
				request.setAttribute("totalPrice", request.getParameter("totalPrice"));
				request.getRequestDispatcher("views/order/confirmation.jsp").forward(request, response);
			}else {
				request.setAttribute("errorMsg", "결제에 실패하였습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
		}else {
			// 무통장 결제인 경우 : ORDER, ORDER_PRODUCT, PAY_CASH 테이블에 DML문 처리
			result = new CheckoutService().processCashPayment(o, proQty, proCode);
			
			if(result > 0) {
				request.setAttribute("totalPrice", request.getParameter("totalPrice"));
				request.getRequestDispatcher("views/order/confirmation_cash.jsp").forward(request, response);
			}else {
				request.setAttribute("errorMsg", "결제에 실패하였습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
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
