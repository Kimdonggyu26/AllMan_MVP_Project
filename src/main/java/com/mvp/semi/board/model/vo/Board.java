package com.mvp.semi.board.model.vo;

import java.sql.Date;

public class Board {
	private int boardNo; 
	private int boardType; 
	private String boardTitle; 
	private String boardBoard; 
	private String boardCount; 
	private Date registDate; 
	private String status; 
	private String userNo;
	private String tasteNo;
	private String movieNo;
	
	public Board() {}

	public Board(int boardNo, int boardType, String boardTitle, String boardBoard, String boardCount, Date registDate,
			String status, String userNo, String tasteNo, String movieNo) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardBoard = boardBoard;
		this.boardCount = boardCount;
		this.registDate = registDate;
		this.status = status;
		this.userNo = userNo;
		this.tasteNo = tasteNo;
		this.movieNo = movieNo;
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

	public String getBoardBoard() {
		return boardBoard;
	}

	public void setBoardBoard(String boardBoard) {
		this.boardBoard = boardBoard;
	}

	public String getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(String boardCount) {
		this.boardCount = boardCount;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getTasteNo() {
		return tasteNo;
	}

	public void setTasteNo(String tasteNo) {
		this.tasteNo = tasteNo;
	}

	public String getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(String movieNo) {
		this.movieNo = movieNo;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardType=" + boardType + ", boardTitle=" + boardTitle + ", boardBoard="
				+ boardBoard + ", boardCount=" + boardCount + ", registDate=" + registDate + ", status=" + status
				+ ", userNo=" + userNo + ", tasteNo=" + tasteNo + ", movieNo=" + movieNo + "]";
	}
	
	
}
