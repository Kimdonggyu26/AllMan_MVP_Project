package com.mvp.semi.movie.model.service;

import static com.mvp.semi.common.template.JDBCTemplate.close;
import static com.mvp.semi.common.template.JDBCTemplate.getConnection;
import static com.mvp.semi.common.template.JDBCTemplate.commit;
import static com.mvp.semi.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mvp.semi.common.model.vo.PageInfo;
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
		
		// 관리자 페이지에서 영화 등록
		
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
	
	public int selectShowingMovieList(){
		
		// 상영중인 영화 갯수 반환(메인페이지)
		
		Connection conn = getConnection();
		
		int listCount = mvDao.selectShowingMovieList(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public List<Movie> selectMovieList(PageInfo pi, String searchData){
		Connection conn = getConnection();
		
		List<Movie> list = mvDao.selectMovieList(conn, pi, searchData);
		
		close(conn);
		
		return list;
	}
	
	public Movie selectMovieByNo(int movieNo){
		Connection conn = getConnection();
		
		Movie mv = mvDao.selectMovie(conn, movieNo);
		
//		Map<String, Object> map = new HashMap<>();
//		map.put("mv", mv);
		
		close(conn);
		
		return mv;
	}
	
	public List<Movie> showingMovieList() {
		
		// 관리자 화면(영화 관리)에서 '상영중인 영화' 탭 클릭시 조회되는 영화 리스트

		Connection conn = getConnection();
		
		List<Movie> list = mvDao.showingMovieList(conn);
		
		close(conn);
		
		return list;
	}
	
	public List<Movie> ottMovieList() {
		
		// 관리자 화면(영화 관리)에서 'OTT영화' 탭 클릭시 조회되는 영화 리스트

		Connection conn = getConnection();
		
		List<Movie> list = mvDao.ottMovieList(conn);
		
		close(conn);
		
		return list;
	}
	
}
