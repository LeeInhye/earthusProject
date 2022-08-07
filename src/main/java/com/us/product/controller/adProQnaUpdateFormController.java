package com.us.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.product.model.service.adProductService;
import com.us.product.model.vo.ProQna;

/**
 * Servlet implementation class adProQnaUpdateFormController
 */
@WebServlet("/updateForm.pq")
public class adProQnaUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adProQnaUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int proQnaNo = Integer.parseInt(request.getParameter("proQnaNo"));
		ProQna pq = new adProductService().selectProQna(proQnaNo);
		
		request.setAttribute("pq", pq);
		request.getRequestDispatcher("/views/product/adProQnaUpdateFormView.jsp").forward(request, response);
		
		System.out.println(pq);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
