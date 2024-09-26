package com.mvp.semi.board.model.service;

import static com.mvp.semi.common.template.JDBCTemplate.close;
import static com.mvp.semi.common.template.JDBCTemplate.commit;
import static com.mvp.semi.common.template.JDBCTemplate.getConnection;
import static com.mvp.semi.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.mvp.semi.board.model.dao.TBoardDao;
import com.mvp.semi.board.model.vo.Board;
import com.mvp.semi.board.model.vo.Reply;
import com.mvp.semi.common.model.vo.PageInfo;




public class TBoardService {

	private TBoardDao tbDao = new TBoardDao();

	public int selectTBoardListCount() {
		Connection conn = getConnection();
		int listCount = tbDao.selectTBoardListCount(conn);
		close(conn);
		return listCount;
	}

	public List<Board> selectTBoardList(PageInfo pi) {
		Connection conn = getConnection();
		
		List<Board> list = tbDao.selectTBoardList(conn, pi);
		close(conn);
		
		
		return list;
	}
	
	public int selectVDSEListCount() {
		Connection conn = getConnection();
		int listCount = tbDao.selectVDSEListCount(conn);
		close(conn);
		return listCount;
	}

	public List<Board> selectVDSEList(PageInfo pi) {
		Connection conn = getConnection();
		
		List<Board> list = tbDao.selectVDSEList(conn, pi);
		close(conn);
		
		
		return list;
	}

	public int selectSPTFListCount() {
		Connection conn = getConnection();
		int listCount = tbDao.selectSPTFListCount(conn);
		close(conn);
		return listCount;
	}

	public List<Board> selectSPTFList(PageInfo pi) {
		Connection conn = getConnection();
		
		List<Board> list = tbDao.selectSPTFList(conn, pi);
		close(conn);
		
		
		return list;
	}
	
	public int selectBOFAListCount() {
		Connection conn = getConnection();
		int listCount = tbDao.selectBOFAListCount(conn);
		close(conn);
		return listCount;
	}

	public List<Board> selectBOFAList(PageInfo pi) {
		Connection conn = getConnection();
		
		List<Board> list = tbDao.selectBOFAList(conn, pi);
		close(conn);
		
		
		return list;
	}
	
	public int selectETRFListCount() {
		Connection conn = getConnection();
		int listCount = tbDao.selectETRFListCount(conn);
		close(conn);
		return listCount;
	}

	public List<Board> selectETRFList(PageInfo pi) {
		Connection conn = getConnection();
		
		List<Board> list = tbDao.selectETRFList(conn, pi);
		close(conn);
		
		
		return list;
	}
	
	public int selectCCFEListCount() {
		Connection conn = getConnection();
		int listCount = tbDao.selectCCFEList(conn);
		close(conn);
		return listCount;
	}

	public List<Board> selectCCFEList(PageInfo pi) {
		Connection conn = getConnection();
		
		List<Board> list = tbDao.selectCCFEList(conn, pi);
		close(conn);
		
		
		return list;
	}
	
	public int selectCASEListCount() {
		Connection conn = getConnection();
		int listCount = tbDao.selectCASEListCount(conn);
		close(conn);
		return listCount;
	}

	public List<Board> selectCASEList(PageInfo pi) {
		Connection conn = getConnection();
		
		List<Board> list = tbDao.selectCASEList(conn, pi);
		close(conn);
		
		
		return list;
	}

	public int selectHHALListCount() {
		Connection conn = getConnection();
		int listCount = tbDao.selectHHALListCount(conn);
		close(conn);
		return listCount;
	}

	public List<Board> selectHHALList(PageInfo pi) {
		Connection conn = getConnection();
		
		List<Board> list = tbDao.selectHHALList(conn, pi);
		close(conn);
		
		
		return list;
	}

	public Board selectTBoardByNo(int tBoardNo) {
		Connection conn = getConnection();
		
		Board b = tbDao.selectBoardByNo(conn,tBoardNo);
		
		close(conn);
		
		return b;
	}
	

	public int insertReply(Reply r) {
		Connection conn = getConnection();
		int result = tbDao.insertReply(conn, r);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteReply(int replyNo) {
		Connection conn = getConnection();
		int result = tbDao.deleteReply(conn, replyNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int selectTBoardReplyCount(int boardNo) {
		Connection conn = getConnection();
		int listCount = tbDao.selectTBoardReplyCount(conn, boardNo);
		close(conn);
		return listCount;
	}


	public List<Reply> selectReplyList(int boardNo, PageInfo pi) {
		Connection conn = getConnection();
		List<Reply> list = tbDao.selectReplyList(conn, boardNo, pi);
		close(conn);
		
		return list;
	}


	
	
}
