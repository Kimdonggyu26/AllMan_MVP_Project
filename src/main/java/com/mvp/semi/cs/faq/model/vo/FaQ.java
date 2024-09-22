package com.mvp.semi.cs.faq.model.vo;

import java.sql.Date;

public class FaQ {
	
	private int faqNo;					// faq 글번호
	private String faqTitle;			// faq 제목
	private String faqContent;			// faq 내용
 	private Date registDate;			// 작성일
	private String status;				// 글상태 Y(유효한글)/N(삭제한글)
	private String userNo;				// 작성자
	
	public FaQ() {}
	
	public FaQ(int faqNo, String faqTitle, String faqContent, Date registDate, String status, String userNo) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.registDate = registDate;
		this.status = status;
		this.userNo = userNo;
	}
	
	

	public FaQ(int faqNo, String faqTitle, String faqContent, Date registDate, String userNo) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.registDate = registDate;
		this.userNo = userNo;
	}



	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
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
		return "FaQ [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", registDate="
				+ registDate + ", status=" + status + ", userNo=" + userNo + "]";
	}
	
	
	
}
