package com.us.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.product.model.service.adProductService;
import com.us.product.model.vo.Product;

/**
 * Servlet implementation class UpdateProductController
 */
@WebServlet("/updateForm.pr")
public class updateProductFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateProductFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String proCode = request.getParameter("no");
		
		// 단순히 상품 수정 페이지로 이동시켜주는 servlet
		// 상품 정보 가지고 이동
		Product p = new adProductService().selectProduct(proCode);
		request.setAttribute("p", p);
		request.getRequestDispatcher("/views/product/adProductUpdateView.jsp").forward(request, response);
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
