package com.us.cs.homepage.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.us.common.model.vo.Attachment;
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
									rset.getInt("BN_NO")
								  , rset.getString("BN_IMG_URL")
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
	
	
	public int insertBanner(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBanner");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getFilePath() + at.getChangeName());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int insertAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int updateBanner(Connection conn, Banner b, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "";
		
		
		if(at != null) {
			// 업로드된 이미지 파일이 있을 때
			sql = prop.getProperty("updataBannerWithPic");
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getFilePath() + at.getChangeName());
				pstmt.setString(2, b.getBnStatus());
				pstmt.setInt(3, b.getBnNo());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		}else {
			// 업로드된 이미지 파일이 없을 때
			sql = prop.getProperty("updateBannerWithoutPic");
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, b.getBnStatus());
				pstmt.setInt(2, b.getBnNo());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		}
		return result;
	}
	
	
	public int updateAttachment(Connection conn, Banner b, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setString(4, at.getStatus());
			pstmt.setInt(5, at.getRefBNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	

}
