package com.mvp.semi.cs.notice.model.vo;

import java.sql.Date;

public class Notice {
	
	private int noticeNo;				// 공지사항글번호
	private String noticeTitle;			// 공지사항제목
 	private String noticeContent;		// 공지사항내용
	private Date registDate;			// 작성일
	private String status;				// 글상태 Y(유효한글)/N(삭제한글)
	private String userNo; 				// 작성자
	
	public Notice() {}

	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date registDate, String status,
			String userNo) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.registDate = registDate;
		this.status = status;
		this.userNo = userNo;
	}
	
	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date registDate, String userNo) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.registDate = registDate;
		this.userNo = userNo;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
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

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", registDate=" + registDate + ", status=" + status + ", userNo=" + userNo + "]";
	}
	
	
}
