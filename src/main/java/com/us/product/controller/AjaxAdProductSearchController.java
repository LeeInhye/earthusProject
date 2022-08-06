package com.us.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.us.common.model.vo.PageInfo;
import com.us.product.model.service.adProductService;
import com.us.product.model.vo.Product;

/**
 * Servlet implementation class AjaxAdProductSearchController
 */
@WebServlet("/adsearch.pr")
public class AjaxAdProductSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdProductSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String categoryNo = request.getParameter("categoryNo");
		String keyword = request.getParameter("keyword");
		
		// 페이징
		int listCount = new adProductService().selectListCount(categoryNo, keyword);
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int pageLimit = 5;
		int boardLimit = 10;
		
		int maxPage = (int)Math.ceil( (double)listCount / boardLimit );
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Product> list = new adProductService().searchProduct(pi, categoryNo, keyword);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("pi", pi);
		map.put("list", list);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(map, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
