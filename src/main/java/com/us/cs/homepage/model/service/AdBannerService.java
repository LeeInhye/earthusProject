package com.us.cs.homepage.model.service;

import static com.us.common.JDBCTemplate.close;
import static com.us.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.us.cs.homepage.model.dao.AdBannerDao;
import com.us.cs.homepage.model.vo.Banner;


public class AdBannerService {
	
	public ArrayList<Banner> selectList(){
		Connection conn = getConnection();
		ArrayList<Banner> list = new AdBannerDao().selectList(conn);
		close(conn);
		return list;
	}

}
