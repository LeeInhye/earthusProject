package com.us.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.us.product.model.service.adProductService;
import com.us.product.model.vo.Product;

/**
 * Servlet implementation class updateProductController
 */
@WebServlet("/update.pr")
public class updateProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String proCode = request.getParameter("proCode");
		String category = request.getParameter("category");
		String proName = request.getParameter("proName");
		String price = request.getParameter("price");
		String proImgPath;
		String detailImgPath;
		String reqInfoImgPath;
		
		if(request.getParameter("proImg") != "") { // 썸네일 파일 업로드했을 경우 -> 새 파일 변수에 담기
			proImgPath = request.getParameter("proImg");
		}else { // 아닐 경우 -> 기존에 있는 파일 변수에 담기
			proImgPath = request.getParameter("existProImg");
		}
		
		if(request.getParameter("detailImg") != "") {
			detailImgPath = request.getParameter("detailImg");
		}else {
			detailImgPath = request.getParameter("existDetailImg");
		}
		
		if(request.getParameter("reqInfoImg") != ""){
			reqInfoImgPath = request.getParameter("reqInfoImg");
		}else {
			reqInfoImgPath = request.getParameter("existReqInfoImg");
		}
		
		Product p = new Product();
		p.setProCode(proCode);
		p.setCategory(category);
		p.setProName(proName);
		p.setPrice(price);
		p.setProImgPath(proImgPath);
		p.setDetailImgPath(detailImgPath);
		p.setReqInfoImgPath(reqInfoImgPath);
		
		int result = new adProductService().updateProduct(p);
		
		HttpSession session = request.getSession();
		
		if(result > 0) {
			session.setAttribute("modalId", "updateProModal");
			session.setAttribute("modalMsg", "상품 정보가 수정되었습니다.");
			session.setAttribute("url", request.getContextPath() + "/list.pr?cpage=1");
			request.getRequestDispatcher("/views/common/adSuccessPage.jsp").forward(request, response);
			
		}
		else {
			session.setAttribute("errorMsg", "상품 정보 수정에 실패하였습니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
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
