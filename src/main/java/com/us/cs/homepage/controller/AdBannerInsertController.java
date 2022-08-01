package com.us.cs.homepage.controller;

import java.io.File;
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

/**
 * Servlet implementation class AjaxBannerAddController
 * adBannerView.jsp의 add-banner 모달의 form 요청 처리하는 서블릿
 */
@WebServlet("/insert.bn")
public class AdBannerInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdBannerInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		// File 넘겨 받으므로 request 아닌 MultipartRequest 사용!!
		if(ServletFileUpload.isMultipartContent(request)) {
			// 1) 전송 용량 제한
			int maxSize = 10 * 1024 * 1024; // 10mb
			
			// 2) 배너 이미지 저장할 폴더의 물리적 경로
			String savePath = session.getServletContext().getRealPath("/resources/img/banner/");
			
			// 3) 파일명 수정작업해서 올릴 객체 선언 + 생성
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 4) DB INSERT문에 필요한 값들을 뽑아 Attachment 객체에 저장
			Attachment at = null;
			
			at = new Attachment();
			at.setOriginName( multiRequest.getOriginalFileName("banner-img") );
			at.setChangeName( multiRequest.getFilesystemName("banner-img") );
			at.setFilePath( "resources/img/banner/" );
			
			// 5) 요청처리
			int result = new AdBannerService().insertBanner(at);
			
			// 6) 응답 페이지로 
			if(result > 0) {
				// 성공 : adBannerView.jsp 재요청
				request.setAttribute("successMsg", "배너 동록에 성공하였습니다.");
				response.sendRedirect(request.getContextPath() + "/list.bn");
			}else {
				// 업로드 되었던 첨부파일 찾아서 삭제시키기
				if(at != null) {
					new File(savePath + at.getChangeName()).delete();
				}
				request.setAttribute("errorMsg", "배너 등록에 실패하였습니다.");
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
