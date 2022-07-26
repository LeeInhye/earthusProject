package com.us.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	
	public static void main(String[] args) {
		getConnection();
	}
	
	// 1.  Connection 객체 생성 후 해당 Connection을 반환
	public static Connection getConnection() {
	
		Connection conn = null;
		Properties prop = new Properties();	// Map계열 컬렉션
		
		// 읽어들이고자 하는 파일 : driver.properties
		// 해당 파일을 찾아 물리적인 경로 저장
		String filePath = JDBCTemplate.class.getResource("/db/driver/driver.properties").getPath();
		
		try {
			prop.load(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 1) jdbc driver 등록
		try {
			Class.forName(prop.getProperty("driver"));
			
			// 2) 접속하고자 하는 db의 url, 계정명, 비밀번호 제시해서 Connection 생성
			conn = DriverManager.getConnection(prop.getProperty("url"),
											   prop.getProperty("username"),
											   prop.getProperty("password"));
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	// 2. Connection 객체를 전달받아 commit시켜주는 메소드
	public static void commit(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 3. rollback
	public static void rollback(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 4. Connection 객체를 전달받아 close
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 5. Statement 객체 전달받아 close
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 6. ResultSet 객체 전달받아서 close
		public static void close(ResultSet rset) {
			try {
				if(rset != null && !rset.isClosed()) {
					rset.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
}
