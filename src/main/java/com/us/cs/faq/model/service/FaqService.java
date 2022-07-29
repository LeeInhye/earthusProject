package com.us.cs.faq.model.service;

import static com.us.common.JDBCTemplate.close;
import static com.us.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.us.cs.faq.model.dao.FaqDao;
import com.us.cs.faq.model.vo.Faq;

public class FaqService {
	
	// 전체 목록 조회
	public ArrayList<Faq> selectFaqList(){
		Connection conn = getConnection();
		ArrayList<Faq> list = new FaqDao().selectFaqList(conn);
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

}
