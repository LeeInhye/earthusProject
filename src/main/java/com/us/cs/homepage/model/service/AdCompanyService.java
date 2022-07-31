package com.us.cs.homepage.model.service;

import static com.us.common.JDBCTemplate.close;
import static com.us.common.JDBCTemplate.commit;
import static com.us.common.JDBCTemplate.getConnection;
import static com.us.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.us.cs.homepage.model.dao.AdCompanyDao;
import com.us.cs.homepage.model.vo.Company;

public class AdCompanyService {
	
	public int insertPost(String html, int category) {
		Connection conn = getConnection();
		int result = new AdCompanyDao().insertPost(conn, html, category);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public Company selectPost(int category) {
		Connection conn = getConnection();
		Company post = new AdCompanyDao().selectPost(conn, category);
		
		close(conn);
		return post;
	}

}
