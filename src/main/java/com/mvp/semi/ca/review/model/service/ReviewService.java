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
		
}
