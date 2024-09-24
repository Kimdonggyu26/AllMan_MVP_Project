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

	public Movie searchMovieList(Connection conn , String searchData) {
		Movie mv = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMovieList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchData);
			pstmt.setString(2, searchData);
			pstmt.setString(3, searchData);
			pstmt.setString(4, searchData);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mv = new Movie();
				mv.setMovieNo(rset.getInt("MOVIE_NO"));
				mv.setMovieTitle(rset.getString("MOVIE_TITLE"));
				mv.setGenre(rset.getString("GENRE")); 
				mv.setDirector(rset.getString("DIRECTOR")); 
				//상세페이지 이미지 경로 속성 추가로
				//나중에 디비 재 설정시 MAIN_PATH -> titlePath로 vo 변경
				mv.setTitlePath(rset.getString("MAIN_PATH"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("dao 작동");
		
		return mv;
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
	
	public List<Movie> selectShowingMovieList(Connection conn) {
		
		List<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectShowingMovieList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Movie(rset.getInt("movie_no")
								 , rset.getString("movie_title")
								 , rset.getString("movie_content")
								 , rset.getString("genre")
								 , rset.getInt("playtime")
								 , rset.getString("country")
								 , rset.getString("age_lv")
								 , rset.getString("open_date")
								 , rset.getString("director")
								 , rset.getInt("audience_count")
								 , rset.getString("actor")
								 , rset.getString("preview")
								 , rset.getString("status")
								 , rset.getDouble("grade")
								 , rset.getString("title_path")
								 , rset.getString("content_path")
								 , rset.getInt("taste_no")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public List<Movie> selectOttMovieList(Connection conn) {
		
		List<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOttMovieList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Movie(rset.getInt("movie_no")
								 , rset.getString("movie_title")
								 , rset.getString("movie_content")
								 , rset.getString("genre")
								 , rset.getInt("playtime")
								 , rset.getString("country")
								 , rset.getString("age_lv")
								 , rset.getString("open_date")
								 , rset.getString("director")
								 , rset.getInt("audience_count")
								 , rset.getString("actor")
								 , rset.getString("preview")
								 , rset.getString("status")
								 , rset.getDouble("grade")
								 , rset.getString("title_path")
								 , rset.getString("content_path")
								 , rset.getInt("taste_no")));
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
