package com.mvp.semi.cs.inquiry.model.service;

import static com.mvp.semi.common.template.JDBCTemplate.close;
import static com.mvp.semi.common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mvp.semi.common.model.vo.Attachment;
import com.mvp.semi.common.model.vo.PageInfo;
import com.mvp.semi.cs.inquiry.model.dao.InquiryDao;
import com.mvp.semi.cs.inquiry.model.vo.Inquiry;

public class InquiryService {
	
	private InquiryDao iDao = new InquiryDao();

	public int selectInquiryListCount() {
		Connection conn = getConnection();
		int listCount = iDao.selectInquiryListCount(conn);
		close(conn);
		return listCount;
	}

	public List<Inquiry> selectInquiryList(PageInfo pi) {
		Connection conn = getConnection();
		
		List<Inquiry> list = iDao.selectInquiryList(conn, pi);
		close(conn);
		
		return list;
	}

	public Map<String, Object> selectBoardByNo(int boardNo) {
		Connection conn = getConnection();
		
		// 1) Board로 부터 게시글 데이터 조회
		Inquiry b = iDao.selectInquiry(conn, boardNo);
		
		
		// 2) Attachment로부터 첨부파일 데이터 조회
		Attachment at = iDao.selectAttachment(conn, boardNo);
		
		Map<String, Object>map = new HashMap<>();
		map.put("b", b);
		map.put("at", at);
		
		close(conn);
		
		return map;
	}

}
