package com.us.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.us.common.MyFileRenamePolicy;
import com.us.common.model.vo.Attachment;
import com.us.product.model.service.ReviewService;
import com.us.product.model.vo.Review;

/**
 * Servlet implementation class ReviewUpdateResultController
 */
@WebServlet("/updateResult.re")
public class ReviewUpdateResultController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateResultController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 0) multipartRequest로 값을 받음, 한글 있음 => 인코딩 / 조건검사
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/img/product/review/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 기존 첨부파일이 있는지 확인할 용도
			String oldFile = multiRequest.getParameter("oldFile");
			
			Review r = new Review();
			r.setRevNo( Integer.parseInt(multiRequest.getParameter("revNo")) );
			r.setRevRate( Integer.parseInt(multiRequest.getParameter("rate")) );
			r.setRevContent( multiRequest.getParameter("content") );
			
			Attachment at = null;
			if(multiRequest.getOriginalFileName("review-image") != null) { // 넘어온 첨부파일이 있을경우
				r.setRevType("P");
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("review-image"));
				at.setChangeName(multiRequest.getFilesystemName("review-image"));
				at.setFilePath("/resources/img/product/review/");
			}else {
				r.setRevType("T");
			}
			
			int result = new ReviewService().updateReview(r, at, oldFile);
			
			if(result > 0) {
				request.getRequestDispatcher("views/product/mypageReviewListView").forward(request, response);
			}else {
				request.setAttribute("errorMsg", "리뷰 수정에 실패하였습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp");
			}
			
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
