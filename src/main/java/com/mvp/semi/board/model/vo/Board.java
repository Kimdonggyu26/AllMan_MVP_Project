package com.mvp.semi.board.model.vo;

import java.sql.Date;

public class Board {
	private int boardNo; 
	private int boardType; 
	private String boardTitle; 
	private String boardContent; 
	private String boardCount; 
	private String registDate; // 게시글 등록일
	private String status; 
	private String userId;
	private String profilePath;
	private String movieTitle;
	private String movieContent;
	private Date movieOpenDate; // 영화개봉일
	private String genre;
	private String titlePath;
	private int tasteNo;
	private String tasteCode;
	
	
	public Board() {}

	public Board(int boardNo, String boardTitle, String boardContent, String registDate) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.registDate = registDate;
	}

	public Board(int boardNo, int boardType, String boardTitle, String boardContent, String boardCount, String registDate,
			String status, String userId, String profilePath, String movieTitle, String movieContent,
			Date movieOpenDate, String genre, String titlePath, int tasteNo, String tasteCode) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardCount = boardCount;
		this.registDate = registDate;
		this.status = status;
		this.userId = userId;
		this.profilePath = profilePath;
		this.movieTitle = movieTitle;
		this.movieContent = movieContent;
		this.movieOpenDate = movieOpenDate;
		this.genre = genre;
		this.titlePath = titlePath;
		this.tasteNo = tasteNo;
		this.tasteCode = tasteCode;
		
	}
	
	public Board(int boardNo, int boardType, String userId, String profilePath, String movieTitle, String movieContent, Date movieOpenDate, String titlePath, int tasteNo,
			String tasteCode) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.userId = userId;
		this.profilePath = profilePath;
		this.movieTitle = movieTitle;
		this.movieContent = movieContent;
		this.movieOpenDate = movieOpenDate;
		this.titlePath = titlePath;
		this.tasteNo = tasteNo;
		this.tasteCode = tasteCode;
		
	}
	
	

	public Board(int boardNo, String boardTitle, String boardContent, String registDate, String userId, String genre,
			int tasteNo, String tasteCode) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.registDate = registDate;
		this.userId = userId;
		this.genre = genre;
		this.tasteNo = tasteNo;
		this.tasteCode = tasteCode;
	}
	
	

	public Board(int boardNo, int boardType, String userId, String profilePath, String movieTitle, String movieContent,
			Date movieOpenDate, String titlePath) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.userId = userId;
		this.profilePath = profilePath;
		this.movieTitle = movieTitle;
		this.movieContent = movieContent;
		this.movieOpenDate = movieOpenDate;
		this.titlePath = titlePath;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(String boardCount) {
		this.boardCount = boardCount;
	}

	public String getRegistDate() {
		return registDate;
	}

	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getProfilePath() {
		return profilePath;
	}

	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public String getMovieContent() {
		return movieContent;
	}

	public void setMovieContent(String movieContent) {
		this.movieContent = movieContent;
	}

	public Date getMovieOpenDate() {
		return movieOpenDate;
	}

	public void setMovieOpenDate(Date movieOpenDate) {
		this.movieOpenDate = movieOpenDate;
	}
	
	public String getTitlePath() {
		return titlePath;
	}

	public void setTitlePath(String titlePath) {
		this.titlePath = titlePath;
	}

	public int getTasteNo() {
		return tasteNo;
	}

	public void setTasteNo(int tasteNo) {
		this.tasteNo = tasteNo;
	}

	public String getTasteCode() {
		return tasteCode;
	}

	public void setTasteCode(String tasteCode) {
		this.tasteCode = tasteCode;
	}
	
	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardType=" + boardType + ", boardTitle=" + boardTitle + ", boardContent="
				+ boardContent + ", boardCount=" + boardCount + ", registDate=" + registDate + ", status=" + status
				+ ", userId=" + userId + ", profilePath=" + profilePath + ", movieTitle=" + movieTitle
				+ ", movieContent=" + movieContent + ", movieOpenDate=" + movieOpenDate + ", , titlePath=" + titlePath + ", tasteNo=" + tasteNo
				+ ", tasteCode=" + tasteCode + ", genre=" + genre +"]";
	}


	

	

	
}
