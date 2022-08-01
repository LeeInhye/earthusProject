package com.us.cs.homepage.controller;

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
import com.us.cs.homepage.model.service.AdBannerService;
import com.us.cs.homepage.model.vo.Banner;

/**
 * Servlet implementation class AdBannerUpdateController
 */
@WebServlet("/edit.bn")
public class AdBannerUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdBannerUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// multiRequest 조건검사
		if(ServletFileUpload.isMultipartContent(request)) {
			// 첨부파일에 대한 설정
			int maxSize = 10 * 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("resources/img/banner/"); // 첨부파일의 물리적 경로
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// Banner 객체에 대한 변경 사항 담기
			Banner b = new Banner();
			b.setBnNo( Integer.parseInt(multiRequest.getParameter("banner-no")) );
			b.setBnStatus( multiRequest.getParameter("banner-status") );
			
			Attachment at = null;
			
			// 새로 넘어온 첨부파일이 있는지 조건검사 
			// 새로 넘어온 첨부파일이 있으면 Attachment 객체에 대한 변경 사항 담기
			if(multiRequest.getOriginalFileName("banner-img") != null) {
				at = new Attachment();
				at.setOriginName( multiRequest.getOriginalFileName("banner-img") );
				at.setChangeName( multiRequest.getFilesystemName("banner-img") );
				at.setFilePath( "resources/img/banner/" );
				at.setStatus( multiRequest.getParameter("banner-status") );
				at.setRefBNo( Integer.parseInt(multiRequest.getParameter("banner-no")) );
			}
			
			// 요청처리 (하나의 controller에서 두번 service 호출하면 안돼!!)
			int result = new AdBannerService().updateBanner(b, at);
			
			HttpSession session = request.getSession();
			
			if(result > 0) {
				session.setAttribute("successMsg", "배너 수정에 성공하였습니다.");
				response.sendRedirect(request.getContextPath() + "/list.bn");
			}else {
				session.setAttribute("errorMsg", "배너 수정에 실패하였습니다.");
				response.sendRedirect(request.getContextPath() + "/list.bn");
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
