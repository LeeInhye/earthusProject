package com.us.cs.faq.model.service;

import static com.us.common.JDBCTemplate.*;
import static com.us.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.us.common.model.vo.PageInfo;
import com.us.cs.faq.model.dao.FaqDao;
import com.us.cs.faq.model.vo.Faq;
import com.us.cs.model.vo.CsCategory;

public class FaqService {
	
	// 전체 목록 조회
	public ArrayList<Faq> selectFaqList(){
		Connection conn = getConnection();
		ArrayList<Faq> list = new FaqDao().selectFaqList(conn);
		close(conn);
		return list;
	}
	
	// 카테고리 조회
	public ArrayList<CsCategory> selectCategoryList(){
		Connection conn = getConnection();
		ArrayList<CsCategory> list = new FaqDao().selectCategoryList(conn);
		close(conn);
		return list;
	}
	
	// 카테고리별 목록 조회
	public ArrayList<Faq> selectCateFaqList(int a){
		Connection conn = getConnection();
		ArrayList<Faq> list = new FaqDao().selectCateFaqList(conn, a);
		close(conn);
		return list;
	}
	
	// 페이징
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new FaqDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	// 전체 조회
	public ArrayList<Faq> selectAdFaqList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Faq> list = new FaqDao().selectAdFaqList(conn, pi);
		close(conn);
		return list;
	}
	
	// 게시글 삭제
	public int adDeleteFaq(String a) {
		Connection conn = getConnection();
		int result = new FaqDao().adDeleteFaq(conn, a);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
	
	
	
	
	
	
	
	

}
