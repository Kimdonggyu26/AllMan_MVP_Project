package com.mvp.semi.cs.notice.model.service;

import java.sql.Connection;
import java.util.List;

import com.mvp.semi.cs.notice.model.dao.NoticeDao;
import com.mvp.semi.cs.notice.model.vo.Notice;

import static com.mvp.semi.common.template.JDBCTemplate.getConnection;
import static com.mvp.semi.common.template.JDBCTemplate.close;
import static com.mvp.semi.common.template.JDBCTemplate.rollback;
import static com.mvp.semi.common.template.JDBCTemplate.commit;

public class NoticeService {
	
	private NoticeDao nDao = new NoticeDao();

	public List<Notice> selectNoticeList() {
		Connection conn = getConnection();
		
		List<Notice> list = nDao.selectNoticeList(conn);
		close(conn);
		
		return list;
	}

}
