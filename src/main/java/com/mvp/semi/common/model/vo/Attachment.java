package com.mvp.semi.common.model.vo;

import java.sql.Date;

public class Attachment {
	
	private int fileNo;				// 파일번호
	private String originName;		// 원본명
	private String changeName;		// 실제업로드파일명
	private String filePath;		// 저장경로
	private Date uploadDate;		// 업로드일
	private String refType;			// 1:1("IB")/공지사항("NT")/영화("MV")/게시글("BD") 등등
	private int refNo;				// 1:1번호/공지사항번호/영화번호/게시글번호  등등
	
	public Attachment(int fileNo, String originName, String changeName, String filePath, Date uploadDate,
			String refType, int refNo) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.refType = refType;
		this.refNo = refNo;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getRefType() {
		return refType;
	}

	public void setRefType(String refType) {
		this.refType = refType;
	}

	public int getRefNo() {
		return refNo;
	}

	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}

	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", originName=" + originName + ", changeName=" + changeName
				+ ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", refType=" + refType + ", refNo=" + refNo
				+ "]";
	} 
	
	
	
	
}
