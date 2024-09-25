package com.mvp.semi.board.model.vo;

public class Reply {
	
	private int replyNo;			// 댓글번호
	private String replyContent;	// 댓글내용
	private String registDt;		// 댓글단날짜
	private String status;			// 댓글상태
	private String replyWriter;		// 댓글쓴이
	private String writerProfile;	// 댓글쓴이프로필사진
	private int refBoardNo;			// 댓글쓴게시판번호
	
	public Reply() {}
	
	public Reply(int replyNo, String replyContent, String registDt, String status, String replyWriter,
			String writerProfile, int refBoardNo) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.registDt = registDt;
		this.status = status;
		this.replyWriter = replyWriter;
		this.writerProfile = writerProfile;
		this.refBoardNo = refBoardNo;
	}
	
	

	public Reply(int replyNo, String replyContent, String replyWriter, String writerProfile) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyWriter = replyWriter;
		this.writerProfile = writerProfile;
	}


	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getRegistDt() {
		return registDt;
	}

	public void setRegistDt(String registDt) {
		this.registDt = registDt;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getWriterProfile() {
		return writerProfile;
	}

	public void setWriterProfile(String writerProfile) {
		this.writerProfile = writerProfile;
	}

	public int getRefBoardNo() {
		return refBoardNo;
	}

	public void setRefBoardNo(int refBoardNo) {
		this.refBoardNo = refBoardNo;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", registDt=" + registDt + ", status="
				+ status + ", replyWriter=" + replyWriter + ", writerProfile=" + writerProfile + ", refBoardNo="
				+ refBoardNo + "]";
	}
	
	
	
	



}
