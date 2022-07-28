package com.us.contents.model.service;

import static com.us.common.JDBCTemplate.*;

import java.sql.Connection;

import com.us.common.model.vo.Attachment;
import com.us.contents.model.dao.ContentsDao;
import com.us.contents.model.vo.Contents;

public class ContentsService {
	
	public int insertContents(Contents c, Attachment at) {
		Connection conn = getConnection();

		// CONTENTS INSERT
		int result1 = new ContentsDao().insertContents(conn, c); 
		
		// ATTACHMENT INSERT
		int result2 = new ContentsDao().insertAttachment(conn, at);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}

}
