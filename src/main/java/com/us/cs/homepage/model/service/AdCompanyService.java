package com.us.cs.homepage.model.service;

import static com.us.common.JDBCTemplate.*;

import java.sql.Connection;

import com.us.cs.homepage.model.dao.AdCompanyDao;

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

}
