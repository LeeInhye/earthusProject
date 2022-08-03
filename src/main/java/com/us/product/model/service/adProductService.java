package com.us.product.model.service;

import static com.us.common.JDBCTemplate.close;
import static com.us.common.JDBCTemplate.getConnection;
import static com.us.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.us.common.model.vo.PageInfo;
import com.us.product.model.dao.adProductDao;
import com.us.product.model.vo.ProQna;
import com.us.product.model.vo.Product;

public class adProductService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new adProductDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	public ArrayList<Product> selectProductList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Product> list = new adProductDao().selectProductList(conn, pi);
		close(conn);
		return list;
	}
	
	public Product selectProduct(String proCode) {
		Connection conn = getConnection();
		Product p = new adProductDao().selectProduct(conn, proCode);
		close(conn);
		return p;
	}
	
	public int updateProduct(Product p) {
		Connection conn = getConnection();
		int result = new adProductDao().updateProduct(conn, p);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public String selectMaxProCode() {
		Connection conn = getConnection();
		String maxProCode = new adProductDao().selectMaxProCode(conn);
		close(conn);
		return maxProCode;
	}
	
	public int insertProduct(Product p) {
		Connection conn = getConnection();
		int result = new adProductDao().insertProduct(conn, p);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int deleteProduct(String proCode) {
		Connection conn = getConnection();
		int result = new adProductDao().deleteProduct(conn, proCode);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public ArrayList<ProQna> selectProQnaList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<ProQna> list = new adProductDao().selectProQnaList(conn, pi);
		close(conn);
		return list;
	}

	public int selectpqlistCount() {
		Connection conn = getConnection();
		int listCount = new adProductDao().selectpqlistCount(conn);
		close(conn);
		return listCount;
	}
}
