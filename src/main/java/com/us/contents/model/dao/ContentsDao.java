package com.us.contents.model.dao;

import static com.us.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.us.common.model.vo.Attachment;
import com.us.contents.model.vo.Contents;

public class ContentsDao {

	private Properties prop = new Properties();
	
	public ContentsDao() {
		try {
			prop.loadFromXML(new FileInputStream( ContentsDao.class.getResource("/db/sql/contents-mapper.xml").getPath() ));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertContents(Connection conn, Contents c) {
		// contents에 insert => 처리된 행 수
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertContents");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getCntTitle());
			pstmt.setString(2, c.getCntContent());
			pstmt.setString(3, c.getCntThumbnail());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertAttachment(Connection conn, Attachment at) {
		// attachment에 insert => 처리된 행 수
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
	
	public ArrayList<Contents> selectAdList(Connection conn) {
		// select => ResultSet(여러 행) => ArrayList<Contents>
		ArrayList<Contents> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Contents(rset.getInt("cnt_no"),
									  rset.getString("cnt_title"),
									  rset.getInt("cnt_count"),
									  rset.getDate("cnt_enroll_date"),
									  rset.getInt("cnt_like")				
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
	
	public int increaseCount(Connection conn, int cntNo) {
		// update => 처리된 행 수
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cntNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Contents selectContents(Connection conn, int cntNo) {
		// contents로부터 select => ResultSet(한 행) => Contents
		Contents c = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectContents");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cntNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Contents(rset.getInt("cnt_no"),
								 rset.getString("cnt_title"),
								 rset.getString("cnt_content"),
								 rset.getString("cnt_thumbnail"),
								 rset.getInt("cnt_count"),
								 rset.getDate("cnt_enroll_date"),
								 rset.getInt("cnt_like")
								);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return c;
	}
	
	public Attachment selectAttachment(Connection conn, int cntNo) {
		// attachment로부터 select => ResultSet(한 행) => Attachment
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cntNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment(rset.getInt("file_no"),
								    rset.getString("origin_name"),
								    rset.getString("change_name"),
								    rset.getString("file_path")
									);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return at;
	}
	
	public int updateContents(Connection conn, Contents c) {
		// contents에 update => 처리된 행 수
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateContents");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getCntTitle());
			pstmt.setString(2, c.getCntContent());
			pstmt.setString(3, c.getCntThumbnail());
			pstmt.setInt(4, c.getCntNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateAttachment(Connection conn, Attachment at) {
		// attachment에 update => 처리된 행 수
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<Contents> selectContentsList(Connection conn) {
		// select => ResultSet(여러 행) => ArrayList<Contents>
		ArrayList<Contents> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectContentsList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Contents(rset.getInt("cnt_no"),
									  rset.getString("cnt_title"),
									  rset.getString("cnt_content"),
									  rset.getString("cnt_thumbnail"),
									  rset.getDate("cnt_enroll_date"),
									  rset.getInt("cnt_like")
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
	
	public int deleteContents(Connection conn, String cntNo) {
		// update => 처리된 행 수
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteContents");
		
		// 동적 sql문
		sql += "WHERE CNT_NO IN ("; 
		
		String[] cntArr = cntNo.split(",");  // ["3", "4"]
		for(int i=0; i<cntArr.length; i++) {
			sql += cntArr[i];
			if(i != cntArr.length-1) {
				sql += ",";
			}
		}
		
		sql += ")";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;		
	}
}
