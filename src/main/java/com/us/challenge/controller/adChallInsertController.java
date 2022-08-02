package com.us.challenge.controller;

import java.io.File;
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
 * Servlet implementation class adChallInsertController
 */
@WebServlet("/insert.ch")
public class adChallInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adChallInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		// enctype이 multipart/form-data로 잘 전송되었을 경우
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 1. 첨부파일 내가 지정한 폴더에 업로드 (파일 저장)
			// 1_1) 전송 용량 제한
			int maxSize = 10 * 1024 * 1024;
			// 1_2) 저장시킬 폴더의 물리적인 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/challenge_upfiles/");
			// 1_3) 파일명 수정작업 되어서 업로드
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 2. DB에 데이터 INSERT
			// 챌린지 제목, 내용, 지급포인트, 썸네일이미지(파일경로+수정파일명) => CHALLENGE에 INSERT
			Challenge ch = new Challenge();
			ch.setChallTitle(multiRequest.getParameter("title"));
			ch.setChallContent(multiRequest.getParameter("content"));
			ch.setChallPoint(Integer.parseInt(multiRequest.getParameter("point")));
			ch.setChallThumbnail("resources/challenge_upfiles/"+multiRequest.getParameter("file1"));
			
			// 첨부파일의 원본명, 수정명, 저장경로 => ATTACHMENT에 INSERT
			Attachment at = new Attachment();
			at.setOriginName(multiRequest.getOriginalFileName("file2"));
			at.setChangeName(multiRequest.getFilesystemName("file2"));
			at.setFilePath("resources/challenge_upfiles/");
			
			int result = new ChallengeService().insertChall(ch, at);

			if(result > 0) { // 성공 => 관리자 챌린지 리스트 페이지
				response.sendRedirect(request.getContextPath() + "/adList.ch?cpage=1");
			}else { // 실패 => 업로드된 첨부파일 찾아서 삭제, 에러페이지
				new File(savePath + at.getChangeName()).delete();
				
				request.setAttribute("errorMsg", "게시글 작성 실패");
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
