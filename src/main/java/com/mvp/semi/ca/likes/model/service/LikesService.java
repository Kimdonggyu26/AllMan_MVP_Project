package com.mvp.semi.ca.likes.model.service;

import java.sql.Connection;

import com.mvp.semi.ca.likes.model.dao.LikesDao;
import static com.mvp.semi.common.template.JDBCTemplate.getConnection;
import static com.mvp.semi.common.template.JDBCTemplate.close;
import static com.mvp.semi.common.template.JDBCTemplate.commit;
import static com.mvp.semi.common.template.JDBCTemplate.rollback;

public class LikesService {

	private LikesDao lDao = new LikesDao();
	
	public int insertLike(int userNo, int reviewNo) {
		Connection conn = getConnection();
		
		int result = lDao.insertLike(conn, userNo, reviewNo);
		close(conn);
		return result;
	}
	
	public int likeCount(int reviewNo) {
		Connection conn = getConnection();
		
		int likeCount = lDao.likeCount(conn, reviewNo);
		close(conn);
		return likeCount;
	}
	
}
