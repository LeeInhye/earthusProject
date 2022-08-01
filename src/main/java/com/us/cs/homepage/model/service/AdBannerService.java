package com.us.cs.homepage.model.service;

import static com.us.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.us.common.model.vo.Attachment;
import com.us.cs.homepage.model.dao.AdBannerDao;
import com.us.cs.homepage.model.vo.Banner;


public class AdBannerService {
	
	public ArrayList<Banner> selectList(){
		Connection conn = getConnection();
		ArrayList<Banner> list = new AdBannerDao().selectList(conn);
		close(conn);
		return list;
	}
	
	public int insertBanner(Attachment at) {
		Connection conn = getConnection();
		int result1 = new AdBannerDao().insertBanner(conn, at);
		int result2 = new AdBannerDao().insertAttachment(conn, at);
		
		if(result1 * result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}
	
	
	public int updateBanner(Banner b, Attachment at) {
		Connection conn = getConnection();
		int result1 = new AdBannerDao().updateBanner(conn, b, at);
		int result2 = 1;
		
		if(at != null) {
			result2 = new AdBannerDao().updateAttachment(conn, b, at);			
		}
		
		if(result1 * result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}

}
