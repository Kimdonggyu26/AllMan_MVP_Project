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

	public List<Movie> searchMovieList(String searchData) {
		Connection conn = getConnection();
		
		List<Movie> list = mvDao.searchMovieList(conn, searchData);
		close(conn);
		System.out.println(list.toString());
		return list;
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
	
	public List<Movie> selectShowingMovieList(){
		Connection conn = getConnection();
		
		List<Movie> list = mvDao.selectShowingMovieList(conn);
		
		close(conn);
		
		return list;
	}
	
	public List<Movie> selectOttMovieList(){
		Connection conn = getConnection();
		
		List<Movie> list = mvDao.selectOttMovieList(conn);
		
		close(conn);
		
		return list;
	}
	
}
