package com.us.cs.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.cs.notice.model.service.NoticeService;
import com.us.cs.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeListController
 */
@WebServlet("/list.no")
public class NoticeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 공지사항 목록 조회
		// 요청 처리
		int notice = 10;
		int deliver = 11;
		int event = 12;
		int hire = 13;
		
		
		// 전체 목록
		ArrayList<Notice> list = new NoticeService().selectNoticeList();
		
		// 카테고리별 목록
		ArrayList<Notice> noList = new NoticeService().selectCateNoticeList(notice);
		ArrayList<Notice> deList = new NoticeService().selectCateNoticeList(deliver);
		ArrayList<Notice> evList = new NoticeService().selectCateNoticeList(event);
		ArrayList<Notice> hiList = new NoticeService().selectCateNoticeList(hire);
		
		// 응답 뷰
		request.setAttribute("list", list);
		request.setAttribute("noList", noList);
		request.setAttribute("deList", deList);
		request.setAttribute("evList", evList);
		request.setAttribute("hiList", hiList);
		request.getRequestDispatcher("/views/cs/notice/noticeListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
