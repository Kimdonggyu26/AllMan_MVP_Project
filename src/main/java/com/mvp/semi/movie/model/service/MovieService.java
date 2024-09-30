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

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public int selectShowMovieList(String searchData) {

		// 검색페이지 상영중인 영화 갯수 반환(메인페이지)

		Connection conn = getConnection();

		int listCount = mvDao.selectShowMovieList(conn, searchData);

		close(conn);

		return listCount;
	}

	public int selectOttMovieList(String searchData) {

		// 검색페이지 상영중인 OTT 갯수 반환(메인페이지)

		Connection conn = getConnection();

		int listCount = mvDao.selectOttMovieList(conn, searchData);

		close(conn);

		return listCount;
	}

	public int selectShowMainMovieList() {

		// 메인페이지 상영중인 영화 갯수 반환(메인페이지)

		Connection conn = getConnection();

		int listCount = mvDao.selectShowMainMovieList(conn);

		close(conn);

		return listCount;
	}

	public int selectOTTMainMovieList() {

		// 메인페이지 상영중인 영화 갯수 반환(메인페이지)

		Connection conn = getConnection();

		int listCount = mvDao.selectOTTMainMovieList(conn);

		close(conn);

		return listCount;
	}

	public List<Movie> selectShowMovieList(PageInfo pi, String searchData) {
		// 예찬
		// 검색페이지 상영 포스터 영화 리스트 가져오기
		Connection conn = getConnection();

		List<Movie> list = mvDao.selectShowMovieList(conn, pi, searchData);

		close(conn);

		return list;
	}

	public List<Movie> selectOttMovieList(PageInfo pi, String searchData) {
		// 예찬
		// 검색페이지 OTT 포스터 영화 리스트 가져오기
		Connection conn = getConnection();

		List<Movie> list = mvDao.selectOttMovieList(conn, pi, searchData);

		close(conn);

		return list;
	}

	public List<Movie> selectShowMainMovieList(PageInfo pi) {
		// 예찬
		// 메인페이지 상영 포스터 영화 리스트 가져오기
		Connection conn = getConnection();

		List<Movie> list = mvDao.selectShowMainMovieList(conn, pi);

		close(conn);

		return list;
	}

	public List<Movie> selectOttMainMovieList(PageInfo pi) {
		// 예찬
		// 메인페이지 OTT 포스터 영화 리스트 가져오기
		Connection conn = getConnection();

		List<Movie> list = mvDao.selectOttMainMovieList(conn, pi);

		close(conn);

		return list;
	}

	public Movie selectMovieByNo(int movieNo) {
		Connection conn = getConnection();

		Movie mv = mvDao.selectMovieByNo(conn, movieNo);

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

	public int modifyMovie(Movie m, int movieNo) {
		Connection conn = getConnection();

		int result = mvDao.modifyMovie(conn, m, movieNo);

		close(conn);

		return result;
	}

	public int deleteMovie(String allNum) {
		Connection conn = getConnection();

		int result = mvDao.deleteMovie(conn, allNum);

		close(conn);

		return result;

	}

	public int selectAllShowMovieList(Map<String, String> searchData) {
		Connection conn = getConnection();
		int listCount = mvDao.selectAllShowMovieList(conn, searchData);
		close(conn);
		return listCount;
	}

	public int selectAllOttMovieList(Map<String, String> searchData) {
		Connection conn = getConnection();
		int listCount = mvDao.selectAllOttMovieList(conn, searchData);
		close(conn);
		return listCount;
	}

	public List<Movie> selectPagingShowMovieList(PageInfo pi, Map<String, String> searchData) {
		Connection conn = getConnection();
		List<Movie> list = mvDao.selectPagingShowMovieList(conn, pi, searchData);
		close(conn);
		return list;
	}

	public List<Movie> selectPagingOttMovieList(PageInfo pi, Map<String, String> searchData) {
		Connection conn = getConnection();
		List<Movie> list = mvDao.selectPagingOttMovieList(conn, pi, searchData);
		close(conn);
		return list;
	}
	
	public Movie showDetail(int movieNo) {
		Connection conn = getConnection();
		Movie mv = mvDao.showDetail(conn, movieNo);
		
		close(conn);
		
		return mv;
	}

	 public List<Movie> getOttMoviesByPage(int page, int itemsPerPage) {
	        Connection conn = getConnection();
	        List<Movie> ottMovies = new MovieDao().selectOttMoviesByPage(conn, page, itemsPerPage);
	        close(conn);
	        return ottMovies;
	    }

	public Movie compareList(int parseInt) {
		Connection conn = getConnection();
		Movie movie = mvDao.compareList(conn, parseInt);
		close(conn);
		return movie;
	}

}
