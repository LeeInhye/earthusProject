package com.us.challenge.model.service;

import static com.us.common.JDBCTemplate.*;

import java.sql.Connection;

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
	

}
