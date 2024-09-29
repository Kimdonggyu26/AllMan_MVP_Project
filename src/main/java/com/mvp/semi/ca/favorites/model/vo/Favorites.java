package com.mvp.semi.ca.favorites.model.vo;

import java.sql.Date;

public class Favorites {
	private Date favoriteDate;
	private int userNo;
	private int movieNo;
	
	public Favorites() {}

	public Favorites(Date favoriteDate, int userNo, int movieNo) {
		super();
		this.favoriteDate = favoriteDate;
		this.userNo = userNo;
		this.movieNo = movieNo;
	}

	public Date getFavoriteDate() {
		return favoriteDate;
	}

	public void setFavoriteDate(Date favoriteDate) {
		this.favoriteDate = favoriteDate;
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

	@Override
	public String toString() {
		return "Favorites [favoriteDate=" + favoriteDate + ", userNo=" + userNo + ", movieNo=" + movieNo + "]";
	}
	
	
}
