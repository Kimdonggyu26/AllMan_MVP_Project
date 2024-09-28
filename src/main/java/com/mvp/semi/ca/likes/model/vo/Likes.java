package com.mvp.semi.ca.likes.model.vo;

public class Likes {
	private int userNo;
	private int reviewNo;
	
	public Likes() {}

	public Likes(int userNo, int reviewNo) {
		super();
		this.userNo = userNo;
		this.reviewNo = reviewNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	@Override
	public String toString() {
		return "Likes [userNo=" + userNo + ", reviewNo=" + reviewNo + "]";
	};
	
	
}
