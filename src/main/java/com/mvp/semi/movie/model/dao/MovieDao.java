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

	public List<Movie> searchMovieList(Connection conn , String searchData) {
		List<Movie> list = new ArrayList<>();
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
			
			while(rset.next()) {
				list.add(new Movie(rset.getInt("MOVIE_NO")
								 , rset.getString("MOVIE_TITLE")
								 , rset.getString("MOVIE_CONTENT")
								 , rset.getString("GENRE")
								 , rset.getInt("PLAYTIME")
								 , rset.getString("COUNTRY")
								 , rset.getString("AGE_LV")
								 , rset.getString("OPEN_DATE")
								 , rset.getString("DIRECTOR")
								 , rset.getInt("AUDIENCE_COUNT")
								 , rset.getString("ACTOR")
								 , rset.getString("PREVIEW")
								 , rset.getString("STATUS")
								 , rset.getInt("GRADE")
								 , rset.getString("MAIN_PATH")
								 , rset.getInt("TASTE_NO")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("dao list : " + list);
		
		return list;
	}

}
