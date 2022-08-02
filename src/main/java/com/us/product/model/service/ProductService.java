package com.us.product.model.service;

import static com.us.common.JDBCTemplate.close;
import static com.us.common.JDBCTemplate.commit;
import static com.us.common.JDBCTemplate.getConnection;
import static com.us.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.us.common.model.vo.PageInfo;
import com.us.product.model.dao.ProductDao;
import com.us.product.model.vo.Category;
import com.us.product.model.vo.ProQna;
import com.us.product.model.vo.Product;
import com.us.product.model.vo.WishList;

public class ProductService {
	
	
	public int selectListCount(int categoryNo) {
		Connection conn = getConnection();
		int listCount = new ProductDao().selectListCount(conn, categoryNo);
		close(conn);
		return listCount;
	}
	
	public ArrayList<Category> selectCategoryList() {
		Connection conn = getConnection();
		ArrayList<Category> cList = new ProductDao().selectCategoryList(conn);
		close(conn);
		return cList;
	}
	
	public ArrayList<Product> selectProductCountList(){
		Connection conn = getConnection();
		ArrayList<Product> pcList = new ProductDao().selectProductCountList(conn);
		close(conn);
		return pcList;
	}
	
	public ArrayList<Product> selectProductList(PageInfo pi, int categoryNo){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectProductList(conn, pi, categoryNo);
		close(conn);
		return list;
	}
	
	public ArrayList<Product> selectBestProductList(int categoryNo){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectBestProductList(conn, categoryNo);
		close(conn);
		return list;
	}
	
	public ArrayList<WishList> selectWishList(int userNo){
		Connection conn = getConnection();
		ArrayList<WishList> list = new ProductDao().selectWishList(conn, userNo);
		close(conn);
		return list;
	}
	
	public int deleteWish(int userNo, String pCode) {
		Connection conn = getConnection();
		int result = new ProductDao().deleteWish(conn, userNo, pCode);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public int increaseProCount(String proCode) {
		Connection conn = getConnection();
		int result = new ProductDao().increaseProCount(conn, proCode);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	public Product selectProduct(String proCode) {
		Connection conn = getConnection();
		Product p = new ProductDao().selectProduct(conn, proCode);
		close(conn);
		return p;
	}
	
	public int selectQlistCount(String proCode) {
		Connection conn = getConnection();
		int listCount = new ProductDao().selectQlistCount(conn, proCode);
		close(conn);
		return listCount;
	}
	
	public ArrayList<ProQna> selectProQnaList(String proCode){
		Connection conn = getConnection();
		ArrayList<ProQna> list = new ProductDao().selectProQnaList(conn, proCode);
		close(conn);
		return list;
	}
	
	public ArrayList<Product> priceDesc(PageInfo pi, int categoryNo){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().priceDesc(conn,pi,categoryNo);
		close(conn);
		return list;
	}
	
	public int insertProQna(ProQna pq) {
		Connection conn = getConnection();
		int result = new ProductDao().insertProQna(conn, pq);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
}
