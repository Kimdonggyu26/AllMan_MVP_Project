package com.mvp.semi.movie.model.dao;

import static com.mvp.semi.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.mvp.semi.common.model.vo.PageInfo;
import com.mvp.semi.movie.model.vo.Movie;

public class MovieDao {

	private Properties prop = new Properties();

	public MovieDao() {
		try {
			prop.loadFromXML(new FileInputStream(MovieDao.class.getResource("/db/mappers/movie-mapper.xml").getPath()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<Movie> searchMovieList(Connection conn, String searchData) {
		List<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchMovieList");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, searchData);
			pstmt.setString(2, searchData);
			pstmt.setString(3, searchData);
			pstmt.setString(4, searchData);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Movie(rset.getInt("MOVIE_NO")
								 , rset.getString("MOVIE_TITLE")
								 , rset.getString("GENRE")
								 , rset.getString("DIRECTOR")
				// 상세페이지 이미지 경로 속성 추가로
				// 나중에 디비 재 설정시 MAIN_PATH -> titlePath로 vo 변경
								 , rset.getString("TITLE_PATH")));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int insertMovie(Connection conn, Movie m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMovie");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMovieTitle());
			pstmt.setString(2, m.getMovieContent());
			pstmt.setString(3, m.getGenre());
			pstmt.setInt(4, m.getPlayTime());
			pstmt.setString(5, m.getCountry());
			pstmt.setString(6, m.getAgeLv());
			pstmt.setString(7, m.getOpenDate());
			pstmt.setString(8, m.getDirector());
			pstmt.setInt(9, m.getAudienceCount());
			pstmt.setString(10, m.getActor());
			pstmt.setString(11, m.getPreview());
			pstmt.setString(12, m.getStatus());
			pstmt.setDouble(13, m.getGrade());
			pstmt.setString(14, m.getTitlePath());
			pstmt.setString(15, m.getContentPath());
			pstmt.setInt(16, m.getTasteNo());

			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int selectShowMovieList(Connection conn, String searchData) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectShowMovieListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchData);
			pstmt.setString(2, searchData);
			pstmt.setString(3, searchData);
			pstmt.setString(4, searchData);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				listCount = rset.getInt("COUNT");
			}
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return listCount;
	}
	
	public int selectOttMovieList(Connection conn, String searchData) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOTTMovieListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchData);
			pstmt.setString(2, searchData);
			pstmt.setString(3, searchData);
			pstmt.setString(4, searchData);

			rset = pstmt.executeQuery();
			
			if(rset.next()){
				listCount = rset.getInt("COUNT");
			}
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return listCount;
	}

	public List<Movie> selectShowMovieList(Connection conn, PageInfo pi, String searchData) {
		//예찬
		//메인페이지 포스터 영화 리스트
		List<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchShowMovieList");

		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setString(1, searchData);
			pstmt.setString(2, searchData);
			pstmt.setString(3, searchData);
			pstmt.setString(4, searchData);
			pstmt.setInt(5, startRow);
			pstmt.setInt(6, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Movie(rset.getInt("MOVIE_NO")
								 , rset.getString("MOVIE_TITLE")
								 , rset.getString("GENRE")
								 , rset.getString("DIRECTOR")
								 , rset.getString("TITLE_PATH")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}
	
	public List<Movie> selectOttMovieList(Connection conn, PageInfo pi, String searchData) {
		//예찬
		//메인페이지 포스터 영화 리스트
		List<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchOttMovieList");

		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setString(1, searchData);
			pstmt.setString(2, searchData);
			pstmt.setString(3, searchData);
			pstmt.setString(4, searchData);
			pstmt.setInt(5, startRow);
			pstmt.setInt(6, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Movie(rset.getInt("MOVIE_NO")
								 , rset.getString("MOVIE_TITLE")
								 , rset.getString("GENRE")
								 , rset.getString("DIRECTOR")
								 , rset.getString("TITLE_PATH")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}
	
	public Movie selectMovieByNo(Connection conn, int movieNo) {
		Movie mv = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMovieByNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, movieNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mv = new Movie();
				mv.setMovieNo(rset.getInt("movie_no"));
				mv.setMovieTitle(rset.getString("movie_title"));
				mv.setMovieContent(rset.getString("movie_content"));
				mv.setGenre(rset.getString("genre"));
				mv.setPlayTime(rset.getInt("playtime"));
				mv.setCountry(rset.getString("country"));
				mv.setAgeLv(rset.getString("age_lv"));
				mv.setOpenDate(rset.getString("open_date"));
				mv.setDirector(rset.getString("director"));
				mv.setAudienceCount(rset.getInt("audience_count"));
				mv.setActor(rset.getString("actor"));
				mv.setPreview(rset.getString("preview"));
				mv.setStatus(rset.getString("status"));
				mv.setGrade(rset.getDouble("grade"));
				mv.setTitlePath(rset.getString("title_path"));
				mv.setContentPath(rset.getString("content_path"));
				mv.setTasteNo(rset.getInt("taste_no"));
				
			}
				
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return mv;
		
	}
	
	public List<Movie> showingMovieList(Connection conn) {
		
		// 관리자 화면(영화 관리)에서 '상영중인 영화' 탭 클릭시 조회되는 영화 리스트

		
		List<Movie> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("showingMovieList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.add(new Movie(rset.getInt("movie_no"), rset.getString("movie_title"),
						rset.getString("movie_content"), rset.getString("genre"), rset.getInt("playtime"),
						rset.getString("country"), rset.getString("age_lv"), rset.getString("open_date"),
						rset.getString("director"), rset.getInt("audience_count"), rset.getString("actor"),
						rset.getString("preview"), rset.getString("status"), rset.getDouble("grade"),
						rset.getString("title_path"), rset.getString("content_path"), rset.getInt("taste_no")));
			}
		}
		 catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return list;
	}
	
	public List<Movie> ottMovieList(Connection conn) {
		
		// 관리자 화면(영화 관리)에서 'OTT영화' 탭 클릭시 조회되는 영화 리스트
		
		List<Movie> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("ottMovieList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Movie(rset.getInt("movie_no"), rset.getString("movie_title"),
						rset.getString("movie_content"), rset.getString("genre"), rset.getInt("playtime"),
						rset.getString("country"), rset.getString("age_lv"), rset.getString("open_date"),
						rset.getString("director"), rset.getInt("audience_count"), rset.getString("actor"),
						rset.getString("preview"), rset.getString("status"), rset.getDouble("grade"),
						rset.getString("title_path"), rset.getString("content_path"), rset.getInt("taste_no")));
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return list;
	}
	
	public int modifyMovie(Connection conn, Movie m, int movieNo) {
		
		// 영화 수정
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("modifyMovie");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMovieTitle());
			pstmt.setString(2, m.getMovieContent());
			pstmt.setString(3, m.getGenre());
			pstmt.setInt(4, m.getPlayTime());
			pstmt.setString(5, m.getCountry());
			pstmt.setString(6, m.getAgeLv());
			pstmt.setString(7, m.getOpenDate());
			pstmt.setString(8, m.getDirector());
			pstmt.setInt(9, m.getAudienceCount());
			pstmt.setString(10, m.getActor());
			pstmt.setString(11, m.getPreview());
			pstmt.setString(12, m.getStatus());
			pstmt.setDouble(13, m.getGrade());
			pstmt.setString(14, m.getTitlePath());
			pstmt.setString(15, m.getContentPath());
			pstmt.setInt(16, m.getTasteNo());
			pstmt.setInt(17, movieNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
		
	}
	
	public int deleteMovie(Connection conn, String allNum) {
		//156
		// 선택된 영화 삭제
		
		//String[] allNums = allNum.split("");
		//String movieNums = String.join(",", allNums); // 선택된 번호들을 , 로 구분해서 합치기
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMovie");
		sql += "WHERE MOVIE_NO IN (" + allNum + ")";
		
		try {
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
		
		
	}
	
	public int selectAllShowMovieList(Connection conn, Map<String, String> searchData) { // map 넘겨받기
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllShowMovieList"); // "select ~~~~ where status = '10'"
		
		String startDate = searchData.get("startDate");
		String endDate = searchData.get("endDate");
		String genre = searchData.get("genre");
		String keyword = searchData.get("keyword");
		
		String genreArr[] = genre.split(",");
		
		if(!startDate.equals("") && !endDate.equals("")) {
			sql += " AND OPEN_DATE BETWEEN '" + startDate + "' AND '" + endDate + "'";
		}
			
		if(!genre.equals("")) {
			sql += " AND (GENRE LIKE ";
			for(int i = 0; i < genreArr.length; i++) {
				sql += "'%" + genreArr[i];
				if (i < genreArr.length - 1) {
			        sql += "%' OR GENRE LIKE "; 
			    }else {
			    	sql += "%')";
			    }
			}
		}
		
		if(!keyword.equals("")) {
			sql += " AND MOVIE_TITLE LIKE '%" + keyword + "%'";
		}
		
		/*
		 * 넘겨 받은 map으로 부터 
		 * startDate, endDate, genre, keyword
		 * 다 뽑기 
		 * 
		 * if(startDate랑 endDate가 존재할 경우) {
		 *  	sql += "and startDate와 endDate 기간조건 ";
		 * }
		 * 
		 * if(genre 가 존재할 경우) {
		 * 		sql += "and 장르에 대한 in 조건";
		 * }
		 * 
		 * if(keyword가 존재할 경우) {
		 * 		sql += "and 검색어에 대한 조건";
		 * }
		 */
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	public int selectAllOttMovieList(Connection conn, Map<String, String> searchData) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllOttMovieList");
		
		String startDate = searchData.get("startDate");
		String endDate = searchData.get("endDate");
		String genre = searchData.get("genre");
		String keyword = searchData.get("keyword");
		
		String genreArr[] = genre.split(",");
		
		if(!startDate.equals("") && !endDate.equals("")) {
			sql += " AND OPEN_DATE BETWEEN '" + startDate + "' AND '" + endDate + "'";
		}
			
		if(!genre.equals("")) {
			sql += " AND (GENRE LIKE ";
			for(int i = 0; i < genreArr.length; i++) {
				sql += "'%" + genreArr[i];
				if (i < genreArr.length - 1) {
			        sql += "%' OR GENRE LIKE "; 
			    }else {
			    	sql += "%')";
			    }
			}
		}
		
		System.out.println(sql);
		
		if(!keyword.equals("")) {
			sql += " AND MOVIE_TITLE LIKE '%" + keyword + "%'";
		}
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	public List<Movie> selectPagingShowMovieList(Connection conn, PageInfo pi, Map<String, String> searchData){ // map 넘겨받기 
		
		List<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPagingShowMovieList");
		
		String startDate = searchData.get("startDate");
		String endDate = searchData.get("endDate");
		String genre = searchData.get("genre");
		String keyword = searchData.get("keyword");
		
		String genreArr[] = genre.split(",");
		
		if(!startDate.equals("") && !endDate.equals("")) {
			sql += " AND OPEN_DATE BETWEEN '" + startDate + "' AND '" + endDate + "'";
		}
			
		if(!genre.equals("")) {
			sql += " AND (GENRE LIKE ";
			for(int i = 0; i < genreArr.length; i++) {
				sql += "'%" + genreArr[i];
				if (i < genreArr.length - 1) {
			        sql += "%' OR GENRE LIKE "; 
			    }else {
			    	sql += "%')";
			    }
			}
		}
		
		System.out.println("\n" + sql);
		
		if(!keyword.equals("")) {
			sql += " AND MOVIE_TITLE LIKE '%" + keyword + "%'";
		}
		
		sql += ") WHERE RNUM BETWEEN ? AND ?";
		
		/*
		 * 넘겨 받은 map으로 부터 
		 * startDate, endDate, genre, keyword
		 * 다 뽑기 
		 * 
		 * if(startDate랑 endDate가 존재할 경우) {
		 *  	sql += "and startDate와 endDate 기간조건 ";
		 * }
		 * 
		 * if(genre 가 존재할 경우) {
		 * 		sql += "and 장르에 대한 in 조건";
		 * }
		 * 
		 * if(keyword가 존재할 경우) {
		 * 		sql += "and 검색어에 대한 조건";
		 * }
		 * 
		 * sql += ")  WHERE RNUM BETWEEN ? AND ?";
		 */
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Movie(rset.getInt("movie_no"), rset.getString("movie_title"),
						rset.getString("movie_content"), rset.getString("genre"), rset.getInt("playtime"),
						rset.getString("country"), rset.getString("age_lv"), rset.getString("open_date"),
						rset.getString("director"), rset.getInt("audience_count"), rset.getString("actor"),
						rset.getString("preview"), rset.getString("status"), rset.getDouble("grade"),
						rset.getString("title_path"), rset.getString("content_path"), rset.getInt("taste_no")));				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public List<Movie> selectPagingOttMovieList(Connection conn, PageInfo pi, Map<String, String> searchData){
		
		List<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPagingOttMovieList");
		
		String startDate = searchData.get("startDate");
		String endDate = searchData.get("endDate");
		String genre = searchData.get("genre");
		String keyword = searchData.get("keyword");
		
		String genreArr[] = genre.split(",");
		
		if(!startDate.equals("") && !endDate.equals("")) {
			sql += " AND OPEN_DATE BETWEEN '" + startDate + "' AND '" + endDate + "'";
		}
			
		if(!genre.equals("")) {
			sql += " AND (GENRE LIKE ";
			for(int i = 0; i < genreArr.length; i++) {
				sql += "'%" + genreArr[i];
				if (i < genreArr.length - 1) {
			        sql += "%' OR GENRE LIKE "; 
			    }else {
			    	sql += "%')";
			    }
			}
		}
		
		if(!keyword.equals("")) {
			sql += " AND MOVIE_TITLE LIKE '%" + keyword + "%'";
		}
		
		sql += ") WHERE RNUM BETWEEN ? AND ?";
		

		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Movie(rset.getInt("movie_no"), rset.getString("movie_title"),
						rset.getString("movie_content"), rset.getString("genre"), rset.getInt("playtime"),
						rset.getString("country"), rset.getString("age_lv"), rset.getString("open_date"),
						rset.getString("director"), rset.getInt("audience_count"), rset.getString("actor"),
						rset.getString("preview"), rset.getString("status"), rset.getDouble("grade"),
						rset.getString("title_path"), rset.getString("content_path"), rset.getInt("taste_no")));				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	


}
