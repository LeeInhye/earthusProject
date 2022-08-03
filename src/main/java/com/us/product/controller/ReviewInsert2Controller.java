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
@WebServlet("/insert2.re")
public class ReviewInsert2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsert2Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//(Review 객체에 USER_NO, PRO_CODE, PRO_NAME, PRO_IMG_PATH 담겨있음)
		
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
			if(multiRequest.getOriginalFileName("photo") != null) { // 넘어온 첨부파일이 있을경우
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("photo"));
				at.setChangeName(multiRequest.getFilesystemName("photo"));
				at.setFilePath("resources/img/product/review/");
				r.setRevType("P");
			}else {
				r.setRevType("T");
			}
			
			int result = new ReviewService().insertReview(r, at);
			
			if(result > 0) {
				session.setAttribute("resultMsg", "리뷰 등록에 성공하였습니다.");
				request.getRequestDispatcher("views/product/reviewInsertResultView.jsp");
			}else {
				session.setAttribute("resultMsg", "리뷰 등록에 실패하였습니다.");
				request.getRequestDispatcher("views/product/reviewInsertResultView.jsp");
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
