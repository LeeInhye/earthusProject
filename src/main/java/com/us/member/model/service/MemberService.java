package com.us.member.model.service;

import static com.us.common.JDBCTemplate.*;
import static com.us.common.JDBCTemplate.getConnection;

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
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

}
