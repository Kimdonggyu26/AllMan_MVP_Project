package com.mvp.semi.cs.inquiry.model.vo;

import java.sql.Date;

public class Inquiry {
	
	private int inquiryNo;				// 문의글번호
	private String inquiryTitle;		// 문의제목
	private String content;				// 문의내용
	private String inquirtType;			// 문의유형
	private Date registDate;			// 작성일
	private String status;				// 글상태 Y(유효한글)/N(삭제한글)
	private String userNo;				// 문의글 작성자
	private String replyContent;		// 답변내용
	private String userNickname;		// 답변자
	private Date replyDate;				// 답변일
	
	public Inquiry() {}

	public Inquiry(int inquiryNo, String inquiryTitle, String content, String inquirtType, Date registDate,
			String status, String userNo, String replyContent, String userNickname, Date replyDate) {
		super();
		this.inquiryNo = inquiryNo;
		this.inquiryTitle = inquiryTitle;
		this.content = content;
		this.inquirtType = inquirtType;
		this.registDate = registDate;
		this.status = status;
		this.userNo = userNo;
		this.replyContent = replyContent;
		this.userNickname = userNickname;
		this.replyDate = replyDate;
	}

	public int getInquiryNo() {
		return inquiryNo;
	}

	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
	}

	public String getInquiryTitle() {
		return inquiryTitle;
	}

	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getInquirtType() {
		return inquirtType;
	}

	public void setInquirtType(String inquirtType) {
		this.inquirtType = inquirtType;
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

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	@Override
	public String toString() {
		return "Inquiry [inquiryNo=" + inquiryNo + ", inquiryTitle=" + inquiryTitle + ", content=" + content
				+ ", inquirtType=" + inquirtType + ", registDate=" + registDate + ", status=" + status + ", userNo="
				+ userNo + ", replyContent=" + replyContent + ", userNickname=" + userNickname + ", replyDate="
				+ replyDate + "]";
	}
	
}
