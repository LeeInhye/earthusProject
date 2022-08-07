package com.us.challenge.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.us.challenge.model.service.ChallengeService;
import com.us.challenge.model.vo.Challenge;
import com.us.common.MyFileRenamePolicy;
import com.us.common.model.vo.Attachment;

/**
 * Servlet implementation class adChallUpdateController
 */
@WebServlet("/update.ch")
public class adChallUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adChallUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {

			// 1. 첨부파일 내가 지정한 폴더에 업로드 (파일 저장)
			int maxSize = 10 * 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/challenge_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 2. DB에 데이터 UPDATE
			// 챌린지 제목, 내용, 썸네일이미지(파일경로+수정파일명) => CHALLENGE에 UPDATE
			Challenge ch = new Challenge();
			ch.setChallNo(Integer.parseInt(multiRequest.getParameter("no")));
			ch.setChallTitle(multiRequest.getParameter("title"));
			ch.setChallContent(multiRequest.getParameter("content"));
			
			if(multiRequest.getOriginalFileName("file1") != null) {
				// 새로 넘어온 썸네일 첨부파일이 있을 경우
				ch.setChallThumbnail("resources/challenge_upfiles/"+multiRequest.getFilesystemName("file1"));
			}else {
				// 새로 넘어온 썸네일 첨부파일이 없을 경우
				ch.setChallThumbnail(multiRequest.getParameter("originThumbnail"));
			}
			
			// 첨부파일의 원본명, 수정명, 저장경로 => ATTACHMENT에 UPDATE
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("file2") != null) {
				// 새로 넘어온 상세이미지 첨부파일이 있을 경우 => Attachment 객체 생성
				at = new Attachment();
				at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
				at.setOriginName(multiRequest.getOriginalFileName("file2"));
				at.setChangeName(multiRequest.getFilesystemName("file2"));
				at.setFilePath("resources/challenge_upfiles/");
			}
			
			// 새로 넘어온 첨부파일이 없었다면 at는 여전히 null
			int result = new ChallengeService().updateChall(ch, at);
			// 새로운 첨부파일 x					=> c, null 			  => CHALLENGE UPDATE
			// 새로운 첨부파일 O, 기존 첨부파일 O	=> c, fileNo이 담긴 at  => CHALLENGE UPDATE, ATTACHMENT UPDATE
			
			if(result > 0) { // 성공 => 챌린지관리 리스트 페이지
				response.sendRedirect(request.getContextPath() + "/adList.ch?cpage=1");
			}else { // 실패 => 에러 페이지
				request.setAttribute("errorMsg", "게시글 수정 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
