package com.us.contents.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.common.model.vo.Attachment;
import com.us.contents.model.service.ContentsService;
import com.us.contents.model.vo.Contents;

/**
 * Servlet implementation class adContentsDetailController
 */
@WebServlet("/detail.co")
public class ContentsDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContentsDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 콘텐츠 상세 조회
		
		int cntNo = Integer.parseInt(request.getParameter("no"));
		
		ContentsService cs = new ContentsService();
		
		// 1) 조회수 증가
		int result = cs.increaseCount(cntNo);
		
		if(result > 0) { // 성공 => 조회 가능한 글 맞음
			
			// 2) 게시글 데이터 조회(이전글, 다음글 번호 포함)
			Contents c = cs.selectContents(cntNo);

			// 3) 상세 이미지 첨부파일 조회
			Attachment at = cs.selectAttachment(cntNo);
			
			// 4) 이전 글, 다음 글 데이터 조회
			Contents prev = cs.selectPrevNextContents(c.getPrevNo());
			Contents next =	cs.selectPrevNextContents(c.getNextNo());	
			
			request.setAttribute("c", c);
			request.setAttribute("at", at);
			request.setAttribute("prev", prev);
			request.setAttribute("next", next);
			request.getRequestDispatcher("views/contents/contentsDetailView.jsp").forward(request, response);
			
		}else { // 실패 => 유효한 글번호가 아니거나 삭제될 글번호 => 조회 불가능
			request.setAttribute("modalMsg", "유효한 글이 아닙니다.");
			request.getRequestDispatcher("views/common/errorModal.jsp").forward(request, response);
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
