package com.us.product.model.service;

import static com.us.common.JDBCTemplate.close;
import static com.us.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.us.common.model.vo.PageInfo;
import com.us.product.model.dao.ProductDao;
import com.us.product.model.vo.Category;
import com.us.product.model.vo.Product;

public class ProductService {
	
	
	public int selectListCount(int categoryNo) {
		Connection conn = getConnection();
		int listCount = new ProductDao().selectListCount(conn, categoryNo);
		close(conn);
		return listCount;
	}
	
	public Category selectCategory(int categoryNo) {
		Connection conn = getConnection();
		Category c = new ProductDao().selectCategory(conn, categoryNo);
		close(conn);
		return c;
	}
	
	public ArrayList<Product> selectProductList(PageInfo pi, int categoryNo){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectProductList(conn, pi, categoryNo);
		close(conn);
		return list;
	}

}
