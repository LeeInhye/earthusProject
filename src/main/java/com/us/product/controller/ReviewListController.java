package com.us.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.common.model.vo.Attachment;
import com.us.member.model.vo.Member;
import com.us.product.model.service.ReviewService;
import com.us.product.model.vo.Review;

/**
 * Servlet implementation class ReviewListController
 */
@WebServlet("/myList.re")
public class ReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     * 마이페이지의 내 리뷰 리스트를 조회
     */
    public ReviewListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// session에 저장되어있는 loginUser 객체를 이용해서 
		// 1) REVIEW 테이블로부터 USER_NO = loginUser.userNo()인 ArrayList<Review> 를 조회해옴
		// 2) (첨부파일 있는 경우 대비) ATTACHMENT 테이블로부터 REVIEW+ATTACHMENT를 글 번호로 조인해서 ArrayList<Attachment> 조회해옴
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		// 회원의 모든 리뷰 리스트 
		ArrayList<Review> list = new ReviewService().selectList(userNo);
		System.out.println(list);
		
		// 회원의 사진 리뷰의 사진에 대한 정보를 담은 리스트
		ArrayList<Attachment> picList = new ReviewService().selectAttachmentList(userNo);
		System.out.println(picList);
		
		request.setAttribute("list", list);
		request.setAttribute("picList", picList);
		request.getRequestDispatcher("views/product/mypageReviewListView.jsp").forward(request, response);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
