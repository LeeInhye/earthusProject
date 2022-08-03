package com.us.product.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class CheckoutDao {
	
	private Properties prop = new Properties();
	
	public CheckoutDao() {
		try {
			prop.loadFromXML(new FileInputStream( ProductDao.class.getResource("/db/sql/checkout-mapper.xml").getPath() ));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
