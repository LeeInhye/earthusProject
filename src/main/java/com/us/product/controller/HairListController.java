package com.us.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.common.model.vo.PageInfo;
import com.us.product.model.service.ProductService;
import com.us.product.model.vo.Category;
import com.us.product.model.vo.Product;

/**
 * Servlet implementation class HairListController
 */
@WebServlet("/list.hair")
public class HairListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HairListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
		
		// -------- 페이징 처리 ---------
		int listCount; // 현재 총 게시글 개수
		int currentPage; // 사용자가 보게 될 페이지
		int pageLimit; // 페이징바의 페이지 최대개수
		int boardLimit; // 한 페이지당 보여질 게시글 최대개수
		
		int maxPage; // 가장 마지막 페이지
		int startPage; // 페이징바의 시작 수
		int endPage; // 페이징바의 끝 수
		
		listCount = new ProductService().selectListCount(categoryNo);
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		pageLimit = 5;
		boardLimit = 9;
		
		maxPage = (int)Math.ceil( (double)listCount / boardLimit );
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1 ;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// 헤어 카테고리 조회 (배너 이미지 있음)
		Category c = new ProductService().selectCategory(categoryNo);
		
		// 헤어 상품 목록 조회
		ArrayList<Product> list = new ProductService().selectProductList(pi, categoryNo);
		
		// 포워딩
		request.setAttribute("pi", pi);
		request.setAttribute("c", c);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/product/ProductHair.jsp").forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
