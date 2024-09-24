package com.mvp.semi.board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class FBoardDao {
	
	private Properties prop = new Properties();
	
	public FBoardDao() {
		try {
			prop.loadFromXML(new FileInputStream(FBoardDao.class.getResource("/db/mappers/fboard-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
