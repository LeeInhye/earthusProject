package com.us.challenge.model.dao;

import static com.us.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.us.challenge.model.vo.Challenge;
import com.us.challenge.model.vo.Comment;
import com.us.common.model.vo.Attachment;
import com.us.common.model.vo.PageInfo;

public class ChallengeDao {
	
	private Properties prop = new Properties();
		
	public ChallengeDao() {
		try {
			prop.loadFromXML(new FileInputStream( ChallengeDao.class.getResource("/db/sql/challenge-mapper.xml").getPath() ));
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
	
	// 관리자_챌린지 리스트 조회
	public ArrayList<Challenge> selectAdList(Connection conn, PageInfo pi) {
		// select => ResultSet(여러 행) => ArrayList<Challenge>
		ArrayList<Challenge> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectChallList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Challenge(rset.getInt("chall_no"),
									   rset.getString("chall_title"),
									   rset.getInt("chall_point"),
									   rset.getDate("chall_enroll_date"),
									   rset.getInt("chall_cmnt")
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
	
	// 관리자_챌린지 작성
	public int insertChall(Connection conn, Challenge ch) {
		// challenge에 insert => 처리된 행 수
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertChall");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ch.getChallTitle());
			pstmt.setString(2, ch.getChallContent());
			pstmt.setInt(3, ch.getChallPoint());
			pstmt.setString(4, ch.getChallThumbnail());
			
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


	// 관리자_챌린지 선택 삭제
	public int deleteChall(Connection conn, String challNo) {
		// update => 처리된 행 수
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteChall");
		
		// 동적 sql문
		sql += "WHERE CHALL_NO IN ("; 
		
		String[] challArr = challNo.split(",");  // ["3", "4"]
		for(int i=0; i<challArr.length; i++) {
			sql += challArr[i];
			if(i != challArr.length-1) {
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

	// 사용자_챌린지 리스트 조회
	public ArrayList<Challenge> selectChallList(Connection conn, PageInfo pi) {
		// select => ResultSet(여러 행) => ArrayList<Challenge>
		ArrayList<Challenge> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectChallList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Challenge(rset.getInt("chall_no"),
									   rset.getString("chall_title"),
									   rset.getInt("chall_point"),
									   rset.getString("chall_thumbnail"),
									   rset.getDate("chall_enroll_date"),
									   rset.getInt("chall_cmnt")
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

	// 사용자_챌린지 상세 조회
	// 1) 조회수 증가
	public int increaseCount(Connection conn, int challNo) {
		// update => 처리된 행 수
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, challNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 2) 게시글 데이터 조회
	public Challenge selectChall(Connection conn, int challNo) {
		// challenge로부터 select => ResultSet(한 행) => Challenge
		Challenge ch = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectChall");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, challNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ch = new Challenge(rset.getInt("chall_no"),
								   rset.getString("chall_title"),
								   rset.getString("chall_content"),
								   rset.getString("chall_thumbnail"),
								   rset.getInt("chall_count"),
								   rset.getDate("chall_enroll_date"),
								   rset.getInt("chall_cmnt"),
								   rset.getInt("challno_prev"),
								   rset.getInt("challno_next")
								  );
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return ch;
	}
	
	// 3) 상세 이미지 첨부파일 조회
	public Attachment selectAttachment(Connection conn, int challNo) {
		// attachment로부터 select => ResultSet(한 행) => Attachment
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, challNo);
			
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
	public Challenge selectPrevNextChall(Connection conn, int challNo) {
		// select => ResultSet(한 행) => Challenge
		Challenge ch = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPrevNextChall");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, challNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ch = new Challenge(rset.getInt("chall_no"),
								   rset.getString("chall_title"),
								   rset.getString("chall_thumbnail")
								   );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return ch;
	}

	// 사용자_댓글 리스트 조회
	public ArrayList<Comment> selectCmntList(Connection conn, int challNo) {
		// select문 => ResultSet(여러 행) => ArrayList<Comment>
		ArrayList<Comment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCmntList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, challNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Comment(rset.getInt("cmnt_no"),
								     rset.getString("user_name"),
								     rset.getString("cmnt_content"),
								     rset.getString("enroll_date")
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
