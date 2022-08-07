package com.us.challenge.model.service;

import static com.us.common.JDBCTemplate.close;
import static com.us.common.JDBCTemplate.commit;
import static com.us.common.JDBCTemplate.getConnection;
import static com.us.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import com.us.challenge.model.dao.ChallengeDao;
import com.us.challenge.model.vo.Challenge;
import com.us.challenge.model.vo.Comment;
import com.us.common.model.vo.Attachment;
import com.us.common.model.vo.PageInfo;
import com.us.contents.model.dao.ContentsDao;
import com.us.contents.model.vo.Contents;
import com.us.member.model.vo.Member;

public class ChallengeService {
	
	// 페이징바_현재 총 게시글 개수
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new ChallengeDao().selectListCount(conn);
		close(conn);
		
		return listCount;		
	}
	
	// 페이징바_챌린지 게시글별 총 댓글 개수
	public int selectCmntCount(int challNo) {
		Connection conn = getConnection();
		int listCount = new ChallengeDao().selectCmntCount(conn, challNo);
		close(conn);
		
		return listCount;		
	}
	
	// 페이징바_챌린지 댓글 관리에서 검색 필터별 댓글 개수
	public int selectCmntCount(int challNo, String selectSt) {
		Connection conn = getConnection();
		int listCount = new ChallengeDao().selectCmntFilterCount(conn, challNo, selectSt);
		close(conn);
		
		return listCount;		
	}
	
	// 관리자_챌린지 리스트 조회
	public ArrayList<Challenge> selectAdList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Challenge> list = new ChallengeDao().selectAdList(conn, pi);
		close(conn);
		
		return list;
	}
	
	// 관리자_챌린지 작성
	public int insertChall(Challenge ch, Attachment at) {
		Connection conn = getConnection();
		
		// CHALLENGE INSERT
		int result1 = new ChallengeDao().insertChall(conn, ch);
		
		// ATTACHMENT INSERT
		int result2 = new ChallengeDao().insertAttachment(conn, at);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}
	
	// 관리자_챌린지 선택 삭제
	public int deleteChall(String challNo) {
		Connection conn = getConnection();
		int result = new ChallengeDao().deleteChall(conn, challNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}		
		close(conn);

		return result;
	}
	
	// 관리자_챌린지 수정
	public int updateChall(Challenge ch, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new ChallengeDao().updateChall(conn, ch);
		
		int result2 = 1;
		if(at != null) { // 새로운 상세이미지 첨부파일 있는 경우 => Attachment update
			result2 = new ChallengeDao().updateAttachment(conn, at);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
	
		return result1 * result2;
	}
	
	
	
	// 사용자_챌린지 리스트 조회
	public ArrayList<Challenge> selectChallList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Challenge> list = new ChallengeDao().selectChallList(conn, pi);
		close(conn);
		
		return list;
	}
	
	// 메인페이지 리스트 조회
	// 사용자_챌린지 리스트 조회
		public ArrayList<Challenge> selectChallList(){
			Connection conn = getConnection();
			ArrayList<Challenge> list = new ChallengeDao().selectChallList(conn);
			close(conn);
			
			return list;
		}
	
	// 사용자_챌린지 상세 조회
	// 1) 조회수 증가
	public int increaseCount(int challNo) {
		Connection conn = getConnection();
		int result = new ChallengeDao().increaseCount(conn, challNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	// 2) 게시글 데이터 조회 (이전글번호, 다음글번호 포함)
	public Challenge selectChall(int challNo) {
		Connection conn = getConnection();
		Challenge ch = new ChallengeDao().selectChall(conn, challNo);
		close(conn);
		
		return ch;
	}
	
	// 3) 상세 이미지 첨부파일 조회
	public Attachment selectAttachment(int challNo) {
		Connection conn = getConnection();
		Attachment at = new ChallengeDao().selectAttachment(conn, challNo);
		close(conn);
		
		return at;
	}
	
	// 4) 이전 글, 다음 글 데이터 조회
	public Challenge selectPrevNextChall(int challNo) {
		Connection conn = getConnection();
		Challenge ch = new ChallengeDao().selectPrevNextChall(conn, challNo);
		close(conn);
		
		return ch;
	}

	// 사용자_게시글 상세 조회 시 댓글 리스트 조회, 관리자_댓글 관리 시 댓글 리스트 조회
	public ArrayList<Comment> selectCmntList(int challNo, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Comment> list = new ChallengeDao().selectCmntList(conn, challNo, pi);
		close(conn);
		return list;
	}
	
	// 관리자_챌린지 댓글 관리에서 검색 필터별 댓글 리스트 조회
	public ArrayList<Comment> selectCmntList(int challNo, String selectSt, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Comment> list = new ChallengeDao().selectCmntList(conn, challNo, selectSt, pi);
		close(conn);
		return list;
	}
	
	// 사용자_댓글 등록
	public int insertCmnt(Comment cmnt) {
		Connection conn = getConnection();
		int result = new ChallengeDao().insertCmnt(conn, cmnt);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	// 관리자_댓글 선택 삭제
	public int deleteCmnt(String cmntNo) {
		Connection conn = getConnection();
		int result = new ChallengeDao().deleteCmnt(conn, cmntNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}		
		close(conn);

		return result;
	}
	
	// 관리자_회원명으로 회원번호 불러오기
	public Member selectByUserName(String userName) {
		Connection conn = getConnection();
		Member m = new ChallengeDao().selectByUserName(conn, userName);
		close(conn);
		
		return m;
	}

	// 관리자_챌린지 포인트 지급
	public int givePoint(int userNo, int challNo, String challTitle, int amount, int cmntNo) {
		Connection conn = getConnection();
		
		// 포인트 테이블에 내역 insert
		int result1 = new ChallengeDao().givePoint(conn, userNo, challNo, challTitle, amount);
		
		// 챌린지 댓글 테이블에서 처리상태를 Y로 update
		int result2 = new ChallengeDao().updateCmntStatus(conn, cmntNo);
		
		int result = result1 * result2;
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}		
		close(conn);

		return result;
	}
	
	
}
