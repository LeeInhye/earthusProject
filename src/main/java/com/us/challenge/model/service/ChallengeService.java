package com.us.challenge.model.service;

import static com.us.common.JDBCTemplate.close;
import static com.us.common.JDBCTemplate.commit;
import static com.us.common.JDBCTemplate.getConnection;
import static com.us.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.us.challenge.model.dao.ChallengeDao;
import com.us.challenge.model.vo.Challenge;
import com.us.common.model.vo.Attachment;

public class ChallengeService {
	
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
	
	// 관리자_챌린지 리스트 조회
	public ArrayList<Challenge> selectAdList() {
		Connection conn = getConnection();
		ArrayList<Challenge> list = new ChallengeDao().selectAdList(conn);
		close(conn);
		
		return list;
	}

}
