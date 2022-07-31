package com.us.cs.qna.controller;

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

/**
 * Servlet implementation class MpQnaUpdateController
 */
@WebServlet("/mpUpdate.qa")
public class MpQnaUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MpQnaUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/qna_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int qNo = Integer.parseInt(multiRequest.getParameter("qno"));
			String title = multiRequest.getParameter("qnaTitle");
			String content = multiRequest.getParameter("qnaContent");
			String qnaPwd = multiRequest.getParameter("qnaPwd");
			String qnaEmail = multiRequest.getParameter("qnaEmail");
			String qnaPhone = multiRequest.getParameter("qnaPhone");
			
			Qna q = new Qna();
			q.setQnaNo(qNo);
			q.setQnaTitle(title);
			q.setQnaContent(content);
			q.setQnaPwd(qnaPwd);
			q.setQnaEmail(qnaEmail);
			q.setQnaPhone(qnaPhone);
			
			Attachment at = null;
			if(multiRequest.getOriginalFileName("upfile") != null) {
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/qna_upfiles/");
				
				// 기존 첨부파일이 존재한다면 기존 첨부파일 번호가 필요하다
				if(multiRequest.getParameter("originFileNo") != null) {
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
				} else {
					at.setRefBNo(qNo);
				}
			}
			
			HttpSession session = request.getSession();
			
			int result = new QnaService().updateQna(q, at);
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/mpDetail.qa?qno=" + qNo);
			} else {
				session.setAttribute("modalId", "updateQnaFail");
				session.setAttribute("modalMsg", "Q&A 게시글 수정 오류");
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
