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
import com.us.common.model.vo.PageInfo;
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
	
	// 페이징바_현재 총 게시글 갯수
	public int selectListCount(Connection conn) {
		// select문 => ResultSet(숫자 한 개) => listCount
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	// 관리자_콘텐츠 리스트 조회
	public ArrayList<Contents> selectAdList(Connection conn, PageInfo pi) {
		// select => ResultSet(여러 행) => ArrayList<Contents>
		ArrayList<Contents> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
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
	
	// 관리자_콘텐츠 작성
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
	
	// 관리자_콘텐츠 수정
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
	
	// 관리자_콘텐츠 선택 삭제
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
	
	// 사용자_콘텐츠 리스트 조회
	public ArrayList<Contents> selectContentsList(Connection conn, PageInfo pi) {
		// select => ResultSet(여러 행) => ArrayList<Contents>
		ArrayList<Contents> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectContentsList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
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
	
	// 사용자_콘텐츠 상세 조회
	// 1) 조회수 증가
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
	
	// 2) 게시글 데이터 조회
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
								 rset.getInt("cnt_like"),
								 rset.getInt("cntno_prev"),
								 rset.getInt("cntno_next")
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
	
	// 3) 상세 이미지 첨부파일 조회
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
	
	// 4) 이전 글, 다음 글 데이터 조회
	public Contents selectPrevNextContents(Connection conn, int cntNo) {
		// select => ResultSet(한 행) => Contents
		Contents c = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPrevNextContents");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cntNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Contents(rset.getInt("cnt_no"),
								 rset.getString("cnt_title"),
								 rset.getString("cnt_thumbnail")
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
	
}
