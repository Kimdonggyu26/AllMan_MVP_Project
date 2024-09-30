package com.mvp.semi.cs.notice.model.service;

import static com.mvp.semi.common.template.JDBCTemplate.close;
import static com.mvp.semi.common.template.JDBCTemplate.commit;
import static com.mvp.semi.common.template.JDBCTemplate.getConnection;
import static com.mvp.semi.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.mvp.semi.common.model.vo.PageInfo;
import com.mvp.semi.cs.notice.model.dao.NoticeDao;
import com.mvp.semi.cs.notice.model.vo.Notice;

public class NoticeService {
	
	private NoticeDao nDao = new NoticeDao();
	
	public int selectNoticeListCount() {
		Connection conn = getConnection();
		int listCount = nDao.selectNoticeListCount(conn);
		close(conn);
		return listCount;
	}

	public List<Notice> selectNoticeList(PageInfo pi) {
		Connection conn = getConnection();
		
		List<Notice> list = nDao.selectNoticeList(conn, pi);
		close(conn);
		
		return list;
	}

	public Notice selectNoticeByNo(int noticeNo) {
		Connection conn = getConnection();
		Notice n = nDao.selectNoticeByNo(conn, noticeNo);
		close(conn);
		
		return n;
	}

	public int updateNotice(Notice n) {
		
		Connection conn = getConnection();
		int result = nDao.updateNotice(conn,n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	public int deleteNotice(int noticeNo) {
		Connection conn = getConnection();
		int result = nDao.deleteNotice(conn, noticeNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		int result = nDao.insertNotice(conn, n);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

}
