package com.mvp.semi.ca.review.model.vo;

import java.sql.Date;

public class Review {

	private int reviewNo;
	private String reviewContent;
	private int grade;
	private int userNo;
	private int movieNo;
	private Date reviewDate;
	private String userNickname;
	private int likeCount;
	
	public Review() {}

	public Review(int reviewNo, String reviewContent, int grade, int userNo, int movieNo, Date reviewDate) {
		super();
		this.reviewNo = reviewNo;
		this.reviewContent = reviewContent;
		this.grade = grade;
		this.userNo = userNo;
		this.movieNo = movieNo;
		this.reviewDate = reviewDate;
	}
	
	public Review(int reviewNo, String reviewContent, int grade, int userNo, int movieNo, Date reviewDate, String userNickname, int likeCount) {
		super();
		this.reviewNo = reviewNo;
		this.reviewContent = reviewContent;
		this.grade = grade;
		this.userNo = userNo;
		this.movieNo = movieNo;
		this.reviewDate = reviewDate;
		this.userNickname = userNickname;
		this.likeCount = likeCount;
	}
	
	

	public Review(int reviewNo, String reviewContent, int movieNo) {
		super();
		this.reviewNo = reviewNo;
		this.reviewContent = reviewContent;
		this.movieNo = movieNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	
	

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewContent=" + reviewContent + ", grade=" + grade + ", userNo="
				+ userNo + ", movieNo=" + movieNo + ", reviewDate=" + reviewDate + "]";
	}
	
	
	
	
}


