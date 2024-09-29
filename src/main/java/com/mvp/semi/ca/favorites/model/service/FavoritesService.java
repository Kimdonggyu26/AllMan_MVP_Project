package com.mvp.semi.ca.favorites.model.service;

import static com.mvp.semi.common.template.JDBCTemplate.getConnection;
import static com.mvp.semi.common.template.JDBCTemplate.close;
import static com.mvp.semi.common.template.JDBCTemplate.commit;
import static com.mvp.semi.common.template.JDBCTemplate.rollback;

import java.sql.Connection;

import com.mvp.semi.ca.favorites.model.dao.FavoritesDao;

public class FavoritesService {

	FavoritesDao fvDao = new FavoritesDao();
	
	public int insertMovieLike(int userNo, int movieNo) {
		Connection conn = getConnection();
		
		int result = fvDao.insertMovieLike(conn, userNo, movieNo);
		close(conn);
		
		return result;

	}
	
	public int deleteMovieLike(int userNo, int movieNo) {
		Connection conn = getConnection();
		
		int result = fvDao.deleteMovieLike(conn, userNo, movieNo);
		close(conn);
		
		return result;
	}
	
	public int checkMovieLiked(int userNo, int movieNo) {
		Connection conn = getConnection();
		
		int alreadyLiked = fvDao.checkMovieLiked(conn, userNo, movieNo);
		
		close(conn);
		
		return alreadyLiked;
		
	}
}
