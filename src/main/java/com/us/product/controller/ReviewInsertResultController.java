package com.us.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.us.common.MyFileRenamePolicy;
import com.us.common.model.vo.Attachment;
import com.us.product.model.service.ReviewService;
import com.us.product.model.vo.Review;

/**
 * Servlet implementation class ReviewInsert2Controller
 */
@WebServlet("/insertResult.re")
public class ReviewInsertResultController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertResultController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			String savePath = session.getServletContext().getRealPath("/resources/img/product/review/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			Review r = new Review();
			r.setUserNo( Integer.parseInt(multiRequest.getParameter("userNo")) );
			r.setProCode( multiRequest.getParameter("proCode") );
			r.setRevRate( Integer.parseInt(multiRequest.getParameter("rate")) );
			r.setRevContent( multiRequest.getParameter("content") );
			
			Attachment at = null;
			if(multiRequest.getOriginalFileName("review-image") != null) { // 넘어온 첨부파일이 있을경우
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("review-image"));
				at.setChangeName(multiRequest.getFilesystemName("review-image"));
				at.setFilePath("resources/img/product/review/");
				r.setRevType("P");
			}else {
				r.setRevType("T");
			}
			
			int result = new ReviewService().insertReview(r, at);
			
			if(result > 0) {
				request.setAttribute("resultMsg", "리뷰 등록에 성공하였습니다.");
				request.getRequestDispatcher("views/product/reviewInsertResultView.jsp").forward(request, response);
			}else {
				request.setAttribute("resultMsg", "리뷰 등록에 실패하였습니다.");
				request.getRequestDispatcher("views/product/reviewInsertResultView.jsp").forward(request, response);
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
