package com.us.product.controller;

import java.io.IOException;
import java.net.Authenticator.RequestorType;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.us.product.model.service.adProductService;
import com.us.product.model.vo.Product;

/**
 * Servlet implementation class adProductInsertController
 */
@WebServlet("/insert.pr")
public class adProductInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adProductInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String category = request.getParameter("category");
		String proName = request.getParameter("proName");
		String proInfo = request.getParameter("proInfo");
		String price = request.getParameter("price");
		String stock = request.getParameter("stock");
		String proImgPath = "resources/img/product/" + request.getParameter("proImg");
		String detailImgPath = "resources/img/product/" + request.getParameter("detailImg");
		String reqInfoImgPath = "resources/img/product/" + request.getParameter("reqInfoImg");
		
		Product p = new Product();
		p.setCategory(category);
		p.setProName(proName);
		p.setProInfo(proInfo);
		p.setPrice(price);
		p.setStock(Integer.parseInt(stock));
		p.setProImgPath(proImgPath);
		p.setDetailImgPath(detailImgPath);
		p.setReqInfoImgPath(reqInfoImgPath);
		
		int result = new adProductService().insertProduct(p);
		
			request.setAttribute("modalId", "insertProModal");
			request.setAttribute("modalMsg", "상품이 등록되었습니다.");
			request.setAttribute("url", request.getContextPath() + "/insertForm.pr");
			
			request.getRequestDispatcher("/views/common/adSuccessPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
