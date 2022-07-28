package com.us.member.model.service;

import static com.us.common.JDBCTemplate.close;
import static com.us.common.JDBCTemplate.commit;
import static com.us.common.JDBCTemplate.getConnection;
import static com.us.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.us.member.model.dao.MemberDao;
import com.us.member.model.vo.Member;

public class MemberService {
	
		// 아이디 중복 체크
		public int checkId(String inputId) {
			Connection conn = getConnection();
			int count = new MemberDao().checkId(conn, inputId);
			close(conn);
			return count;
		}
		
		// 이메일 중복 체크
		public int checkEmail(String inputEmail) {
			Connection conn = getConnection();
			int count = new MemberDao().checkEmail(conn, inputEmail);
			close(conn);
			return count;
		}
		
		// 전화번호 중복 체크
		public int checkPhone(String inputPhone) {
			Connection conn = getConnection();
			int count = new MemberDao().checkPhone(conn, inputPhone);
			close(conn);
			return count;
		}
		
		// 회원가입시 insert
		public int insertMember(Member m) {
			Connection conn = getConnection();
			int result = new MemberDao().insertMember(conn, m);
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			close(conn);
			return result;
		}
		
		// 로그인
		public Member loginMember(String userId, String userPwd) {
			Connection conn = getConnection();
			Member m = new MemberDao().loginMember(conn, userId, userPwd);
			close(conn);
			return m;
		}
		
		// 비밀번호 찾기
		public int findPwd(String inputId, String inputName) {
			Connection conn = getConnection();
			int count = new MemberDao().findPwd(conn, inputId, inputName);
			close(conn);
			return count;
		}
		
		// 회원 인증의 이메일 조회
		public String enterEmail(String inputId) {
			Connection conn = getConnection();
			String memEmail = new MemberDao().enterEmail(conn, inputId);
			close(conn);
			return memEmail;
		}
		
		// 비밀번호 변경
		public int updatePwd(String inputId, String newPwd) {
			Connection conn = getConnection();
			int result = new MemberDao().updatePwd(conn, inputId, newPwd);
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			return result;
		}
		
		
		
		
		
		
		
		
		
		
		

}
