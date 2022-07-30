package com.us.cs.faq.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.cs.faq.model.service.FaqService;
import com.us.cs.faq.model.vo.Faq;
import com.us.cs.model.vo.CsCategory;

/**
 * Servlet implementation class FaqListController
 */
@WebServlet("/list.fq")
public class FaqListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 공지사항 목록 조회
		// 요청 처리
		int order = 20;
		int deliver = 21;
		int cancle = 22;
		int exchange = 23;
		int etc = 24;
		
		
		// 전체 목록
		ArrayList<Faq> list = new FaqService().selectFaqList();
		
		// 카테고리 조회
		ArrayList<CsCategory> cateList = new FaqService().selectCategoryList();
		
		// 카테고리별 목록
		ArrayList<Faq> orList = new FaqService().selectCateFaqList(order);
		ArrayList<Faq> deList = new FaqService().selectCateFaqList(deliver);
		ArrayList<Faq> canList = new FaqService().selectCateFaqList(cancle);
		ArrayList<Faq> exList = new FaqService().selectCateFaqList(exchange);
		ArrayList<Faq> etcList = new FaqService().selectCateFaqList(etc);
		
		
		// 응답 뷰
		request.setAttribute("list", list);
		request.setAttribute("cateList", cateList);
		request.setAttribute("orList", orList);
		request.setAttribute("deList", deList);
		request.setAttribute("canList", canList);
		request.setAttribute("exList", exList);
		request.setAttribute("etcList", etcList);
		request.getRequestDispatcher("/views/cs/faq/faqListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
