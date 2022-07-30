package com.us.cs.qna.controller;

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
import com.us.cs.qna.model.service.QnaService;
import com.us.cs.qna.model.vo.Qna;
import com.us.member.model.vo.Member;

/**
 * Servlet implementation class QnaInsertController
 */
@WebServlet("/insert.qa")
public class QnaInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// multipart/form-data 요청방식이라 request로 바로 값 뽑기 불가능
		
		HttpSession session = request.getSession();
		
		// enctype이 multipart/form-data로 잘 전송되었을 경우
		if( ServletFileUpload.isMultipartContent(request) ) {
			
			// 첨부파일을 내가 지정한 폴더에 업로드
			// 전달되는 파일 용량제한 -> 10MByte
			int maxSize = 10 * 1024 * 1024;
			
			// 저장시킬 폴더 경로
			String savePath = session.getServletContext().getRealPath("/resources/qna_upfiles/");
			
			// 전달된 파일의 파일명 수정 및 서버에 업로드(폴더에 저장)
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// DB에 insert
			int qnaWriter = ((Member)session.getAttribute("loginUser")).getUserNo();
			String title = multiRequest.getParameter("qnaTitle");
			String content = multiRequest.getParameter("qnaContent");
			String qnaPwd = multiRequest.getParameter("qnaPwd");
			String qnaEmail = multiRequest.getParameter("qnaEmail");
			String qnaPhone = multiRequest.getParameter("qnaPhone");
			
			Qna q = new Qna();
			q.setQnaWriter(String.valueOf(qnaWriter));
			q.setQnaTitle(title);
			q.setQnaContent(content);
			q.setQnaPwd(qnaPwd);
			q.setQnaEmail(qnaEmail);
			q.setQnaPhone(qnaPhone);
			
			// 첨부파일 insert
			Attachment at = null;
			// 넘어온 첨부파일이 있을 경우
			if(multiRequest.getOriginalFileName("upfile") != null) {
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/qna_upfiles/");
			}
			
			int result = new QnaService().insertQna(q, at);

			if(result > 0) {
				request.getRequestDispatcher("/views/cs/qna/qnaInsertSuccess.jsp").forward(request, response);
			} else {
				// 첨부파일이 있었을 경우 파일 삭제
				if( at != null) {
					new File(savePath + at.getChangeName()).delete();
				}
				
				session.setAttribute("modalId", "insertQnaFail");
				session.setAttribute("modalMsg", "Q&A 작성에 실패하였습니다.");
				request.getRequestDispatcher("/views/common/errorModal.jsp").forward(request, response);
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
