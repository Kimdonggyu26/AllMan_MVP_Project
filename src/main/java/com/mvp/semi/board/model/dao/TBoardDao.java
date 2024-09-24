package com.mvp.semi.board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;


public class TBoardDao {
	
	private Properties prop = new Properties();
	
	public TBoardDao() {
		try {
			prop.loadFromXML(new FileInputStream(TBoardDao.class.getResource("/db/mappers/tboard-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
