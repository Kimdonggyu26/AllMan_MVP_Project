package com.mvp.semi.ca.review.model.dao;

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

import com.mvp.semi.ca.review.model.vo.Review;
import com.mvp.semi.movie.model.dao.MovieDao;

public class ReviewDao {

	private Properties prop = new Properties();
	
	public ReviewDao() {
		try {
			prop.loadFromXML(new FileInputStream(ReviewDao.class.getResource("/db/mappers/review-mapper.xml").getPath()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<Review> rvListByDate(Connection conn, int movieNo){
		
		List<Review> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("rvListByDate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, movieNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(rset.getInt("REVIEW_NO"), rset.getString("REVIEW_CONTENT")
								  , rset.getInt("GRADE"), rset.getInt("USER_NO")
								  , rset.getInt("MOVIE_NO"), rset.getDate("REVIEW_DATE")
								  , rset.getString("USER_NICKNAME"),rset.getString("PROFILE_PATH"),rset.getInt("LIKE_COUNT")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public List<Review> rvListByLike(Connection conn, int movieNo){
		
		List<Review> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("rvListByLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, movieNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(rset.getInt("REVIEW_NO"), rset.getString("REVIEW_CONTENT")
								  , rset.getInt("GRADE"), rset.getInt("USER_NO")
								  , rset.getInt("MOVIE_NO"), rset.getDate("REVIEW_DATE")
								  , rset.getString("USER_NICKNAME"),rset.getString("PROFILE_PATH"), rset.getInt("LIKE_COUNT")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
		
				
	}
	
	public int insertReview(Connection conn, int userNo, String reviewContent, int rate, int movieNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, reviewContent);
			pstmt.setInt(2, rate);
			pstmt.setInt(3, userNo);
			pstmt.setInt(4, movieNo);
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public double mvpGrade(Connection conn, int movieNo) {
		
		double mvpGrade = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getMvpGrade");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, movieNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mvpGrade = rset.getDouble("AVG_GRADE");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return mvpGrade;
		
	}
	
	public int checkReviewLiked(Connection conn, int userNo, int movieNo) {
		int alreadyLiked = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkReviewLiked");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, movieNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				alreadyLiked = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return alreadyLiked;
		
	}


}
