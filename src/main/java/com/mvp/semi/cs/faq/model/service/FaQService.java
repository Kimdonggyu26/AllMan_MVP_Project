package com.mvp.semi.cs.faq.model.service;

import static com.mvp.semi.common.template.JDBCTemplate.close;
import static com.mvp.semi.common.template.JDBCTemplate.commit;
import static com.mvp.semi.common.template.JDBCTemplate.getConnection;
import static com.mvp.semi.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.mvp.semi.common.model.vo.PageInfo;
import com.mvp.semi.cs.faq.model.dao.FaQDao;
import com.mvp.semi.cs.faq.model.vo.FaQ;


public class FaQService {
	
	private FaQDao fDao = new FaQDao();
	
	public int selectFaQListCount() {
		Connection conn = getConnection();
		int listCount = fDao.selectFaQListCount(conn);
		close(conn);
		return listCount;
	}


	public List<FaQ> selectFaQList(PageInfo pi) {
		Connection conn = getConnection();
		
		List<FaQ> list = fDao.selectFaQList(conn, pi);
		close(conn);
		
		return list;
	}


	public FaQ selectFaQByNo(int faqNo) {
		Connection conn = getConnection();
		FaQ n = fDao.selectFaQByNo(conn, faqNo);
		close(conn);
		
		return n;
	}


	public int updateFaQ(FaQ f) {
		Connection conn = getConnection();
		int result = fDao.updateFaQ(conn, f);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}


	public int deleteFaQ(int faqNo) {
		Connection conn = getConnection();
		int result = fDao.deleteFaQ(conn, faqNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

}
