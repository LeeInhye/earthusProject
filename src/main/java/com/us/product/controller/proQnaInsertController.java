package com.us.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.product.model.service.ProductService;
import com.us.product.model.vo.ProQna;

/**
 * Servlet implementation class proQnaInsertController
 */
@WebServlet("/insert.pq")
public class proQnaInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public proQnaInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String proCode = request.getParameter("proCode");
		String proQnaTitle = request.getParameter("proQnaTitle");
		String proQnaContent = request.getParameter("proQnaContent");
		String proQnaPwd = request.getParameter("proQnaPwd");
		String proQnaWriterName = request.getParameter("proQnaWriterName");
		String proQnaEmail = request.getParameter("proQnaEmail");
		String proQnaPhone = request.getParameter("proQnaPhone");
		
		ProQna pq = new ProQna(proCode, proQnaTitle, proQnaContent, proQnaPwd, proQnaWriterName, proQnaEmail, proQnaPhone);
		
		int result = new ProductService().insertProQna(pq);
		
		if(result > 0) { // 성공
		
			request.setAttribute("proCode", proCode);
			request.getRequestDispatcher("/views/product/proQnaInsertSuccessView.jsp").forward(request, response);
			
		}else { // 실패
			request.setAttribute("errorMsg", "상품 문의 작성 실패");
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
