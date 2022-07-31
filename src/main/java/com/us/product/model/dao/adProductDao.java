package com.us.product.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

public class adProductDao {

	Properties prop = new Properties();
	
	public adProductDao() {
		try {
			prop.loadFromXML(new FileInputStream( adProductDao.class.getResource("db/sql/adProduct-mapper.xml").getPath() ));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
}
