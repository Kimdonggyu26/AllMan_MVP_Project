package com.mvp.semi.ca.review.model.service;

import static com.mvp.semi.common.template.JDBCTemplate.getConnection;

import static com.mvp.semi.common.template.JDBCTemplate.close;
import java.sql.Connection;
import java.util.List;

import com.mvp.semi.ca.review.model.dao.ReviewDao;
import com.mvp.semi.ca.review.model.vo.Review;


public class ReviewService {

	private ReviewDao rvDao = new ReviewDao();
	
	public List<Review> rvListByDate(int movieNo) {
		
		Connection conn = getConnection();
		
		List<Review> list = rvDao.rvListByDate(conn, movieNo);
		close(conn);
		
		return list;
		
	}
	
	public int insertReview(int userNo, String reviewContent, int rate, int movieNo) {
		Connection conn = getConnection();
		
		int result = rvDao.insertReview(conn, userNo, reviewContent, rate, movieNo);
		close(conn);
		
		return result;
	}
	
	public List<Review> rvListByLike(int movieNo){
		
		Connection conn = getConnection();
		
		List<Review> list = rvDao.rvListByLike(conn, movieNo);
		close(conn);
		
		return list;
	}
	
	public double mvpGrade(int movieNo) {
		Connection conn = getConnection();
		
		double mvpGrade = rvDao.mvpGrade(conn, movieNo);
		close(conn);
		
		return mvpGrade;
	}
	
	public int checkReviewLiked(int userNo, int movieNo) {
		Connection conn = getConnection();
		
		int alreadyLiked = rvDao.checkReviewLiked(conn, userNo, movieNo);
		
		close(conn);
		
		return alreadyLiked;
		
	}
		
}
