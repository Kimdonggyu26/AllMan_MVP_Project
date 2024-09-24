package com.mvp.semi.movie.model.service;

import static com.mvp.semi.common.template.JDBCTemplate.close;
import static com.mvp.semi.common.template.JDBCTemplate.getConnection;
import static com.mvp.semi.common.template.JDBCTemplate.commit;
import static com.mvp.semi.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mvp.semi.movie.model.dao.MovieDao;
import com.mvp.semi.movie.model.vo.Movie;



public class MovieService {

	private MovieDao mvDao = new MovieDao();

	public Map<String, Object> searchMovieList(String searchData) {
		Connection conn = getConnection();
		
		Movie mv = mvDao.searchMovieList(conn, searchData);
			
		Map<String, Object> map = new HashMap<>();
		map.put("mv", mv);
		
		close(conn);
		
		System.out.println("서비스 작동");
		
		return map;
	}
	
	public int insertMovie(Movie m) {
		Connection conn = getConnection();
		
		int result = mvDao.insertMovie(conn, m);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
}
