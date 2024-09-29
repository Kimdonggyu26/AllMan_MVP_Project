package com.mvp.semi.cs.inquiry.model.service;

import static com.mvp.semi.common.template.JDBCTemplate.close;
import static com.mvp.semi.common.template.JDBCTemplate.commit;
import static com.mvp.semi.common.template.JDBCTemplate.getConnection;
import static com.mvp.semi.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mvp.semi.common.model.vo.Attachment;
import com.mvp.semi.common.model.vo.PageInfo;
import com.mvp.semi.cs.faq.model.vo.FaQ;
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

	public Map<String, Object> selectInquiryByNo(int inquiryNo) {
		Connection conn = getConnection();
		
		// 1) Board로 부터 게시글 데이터 조회
		Inquiry i = iDao.selectInquiry(conn, inquiryNo);
		
		
		// 2) Attachment로부터 첨부파일 데이터 조회
		Attachment at = iDao.selectAttachment(conn, inquiryNo);
		
		Map<String, Object>map = new HashMap<>();
		map.put("i", i);
		map.put("at", at);
		
		close(conn);
		
		
		return map;
	}

	public int deleteInquiry(int iqNo) {
		Connection conn = getConnection();
		int result = iDao.deleteInquiry(conn, iqNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	public int updateInquiry(Inquiry i, Attachment at) {
		Connection conn = getConnection();
		
		// 1) Board Update
		int result = iDao.updateInquiry(conn, i);
		
		if(result > 0 && at != null) {
			if(at.getFileNo() != 0) {
				// 2_1) Attachment Update
				result = iDao.updateAttachment(conn, at);
			} else {
				// 2_2) Attachment Insert
				result = iDao.insertNewAttachment(conn,at);
				
			}	
			
		}
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public int insertInquiry(Inquiry i, Attachment at) {
		Connection conn = getConnection();
		
		// 1) Board에 Insert
		int result = iDao.insertInquiry(conn, i);
		
		if(result > 0 && at != null) {
			// 2) Attachment에  Insert
			result = iDao.insertAttachment(conn, at);
		}
		if (result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		
		return result;
	}
	 public List<Inquiry> getUserInquiries(String userId) {
	        Connection conn = getConnection();  // DB 연결 객체 가져오기
	        List<Inquiry> inquiries = new InquiryDao().selectInquiriesByUser(conn, userId);  // DAO 호출
	        close(conn);  // DB 연결 닫기
	        return inquiries;  // 조회 결과 반환
	    }

}
