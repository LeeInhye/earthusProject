package com.us.cs.homepage.model.service;

import static com.us.common.JDBCTemplate.close;
import static com.us.common.JDBCTemplate.commit;
import static com.us.common.JDBCTemplate.getConnection;
import static com.us.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.us.cs.homepage.model.dao.AdCompanyDao;
import com.us.cs.homepage.model.vo.Company;

public class AdCompanyService {
	
	public int insertCompanyInfo(String html) {
		Connection conn = getConnection();
		int result = new AdCompanyDao().insertCompanyInfo(conn, html);
		
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
