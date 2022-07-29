package com.us.cs.homepage.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.us.cs.homepage.model.vo.Banner;
import static com.us.common.JDBCTemplate.*;

public class AdBannerDao {
	
	// 필드 영역에 매번 사용할 Properties타입 객체 생성
	private Properties prop = new Properties();
	
	// 기본 생성자 : prop객체로 XML파일 불러오기
	public AdBannerDao() {
		try {
			prop.loadFromXML(new FileInputStream( AdBannerDao.class.getResource("/db/sql/banner-mapper.xml").getPath() ));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Banner> selectList(Connection conn){
		ArrayList<Banner> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Banner(
									rset.getInt("BN_BO")
								  , rset.getString("BN_IMG_SRC")
								  , rset.getString("BN_STATUS")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
