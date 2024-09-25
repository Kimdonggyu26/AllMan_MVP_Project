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

	public int selectShowingMovieList(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMovieListCount");

		try {
			pstmt = conn.prepareStatement(sql);
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

	public List<Movie> selectMovieList(Connection conn, PageInfo pi, String searchData) {
		List<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchMovieList");

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
	
	public Movie selectMovie(Connection conn, int movieNo) {
		Movie mv = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMovie");
		
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


}
