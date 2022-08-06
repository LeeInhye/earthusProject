package com.us.cs.homepage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.us.cs.homepage.model.service.AdBannerService;
import com.us.cs.homepage.model.vo.Banner;

/**
 * Servlet implementation class IndexBannerViewController
 */
@WebServlet("/loadBanner.us")
public class AjaxIndexBannerViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxIndexBannerViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Banner> blist = new AdBannerService().selectMainList();
		
		
		// blist를 JSONArray 형태로 다시 index.jsp로 보내기
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(blist, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
