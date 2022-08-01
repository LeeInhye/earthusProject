package com.us.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.us.product.model.service.adProductService;

/**
 * Servlet implementation class adProductDeleteController
 */
@WebServlet("/delete.pr")
public class adProductDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adProductDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		// 삭제할 상품 코드가 담긴 배열
		//String[] pcArr = request.getParameterValues("no");
		String pcDel = request.getParameter("no"); // "86,87"
		String[] pcArr = pcDel.split(",");
		
		int result = 0;
		for(int i=0; i<pcArr.length; i++) {
			result += new adProductService().deleteProduct( pcArr[i] );
		}
		
		
		if(result == pcArr.length) { // 모두 삭제되었을 경우
			request.setAttribute("modalId", "deleteProModal");
			request.setAttribute("modalMsg", "상품이 삭제되었습니다.");
			request.setAttribute("url", request.getContextPath() + "/adlist.pr?cpage=1");
			request.getRequestDispatcher("/views/common/adSuccessPage.jsp").forward(request, response);
		}else {
			request.setAttribute("errorMsg", "상품 삭제 실패");
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
