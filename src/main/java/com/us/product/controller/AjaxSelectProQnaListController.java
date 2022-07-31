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
import com.us.product.model.vo.ProQna;

import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxSelectProQnaListController
 */
@WebServlet("/qlist.pro")
public class AjaxSelectProQnaListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSelectProQnaListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String proCode = request.getParameter("proCode");
		
		int listCount = new ProductService().selectQlistCount("procode"); // 현재 총 게시글 개수
		int currentPage = Integer.parseInt(request.getParameter("cpage")); // 사용자가 보게 될 페이지
		int pageLimit = 5; // 페이징바의 페이지 최대 개수
		int boardLimit = 5; // 한 페이지당 보여질 게시글 개수
		
		int maxPage = (int)Math.ceil( (double)listCount/boardLimit ); // 가장 마지막 페이지
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;// 페이징바의 시작 수
		int endPage = startPage + pageLimit - 1; // 페이징바의 끝 수
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// 해당 상품의 문의 게시글 전체 조회
		ArrayList<ProQna> qlist = new ProductService().selectProQnaList(pi, proCode);
		
		
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(qlist, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
