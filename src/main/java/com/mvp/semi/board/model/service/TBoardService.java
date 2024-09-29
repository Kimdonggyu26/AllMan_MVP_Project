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
import com.mvp.semi.movie.model.vo.Movie;




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

	public int TBoardInsertSearchCount(String search, int tno) {
		Connection conn = getConnection();
		int listCount = tbDao.TBoardInsertSearchCount(conn, search, tno);
		close(conn);
		return listCount;
	}

	public List<Movie> TboardInsertSaerchList(String search, int tno, PageInfo pi) {
		Connection conn = getConnection();
		List<Movie> list = tbDao.TboardInsertSaerchList(conn, search, tno, pi);
		close(conn);
		
		return list;
	}

	public int insertTBoard(Board b) {
		Connection conn = getConnection();
		int result = tbDao.insertTBoard(conn, b);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int TBoarNDHEConut(String searchtext, int searchField) {
		Connection conn = getConnection();
		int listCount = tbDao.TBoarNDHEConut(conn, searchtext, searchField);
		close(conn);
		
		return listCount;
	}

	public List<Board> TboardSaerchNDHE(String searchtext, PageInfo pi, int searchField) {
		Connection conn = getConnection();
		List<Board> list = tbDao.TboardSaerchNDHE(conn, searchtext, pi, searchField);
		close(conn);
				
		return list;
	}

	public int TBoarVDSEConut(String searchtext, int searchField) {
		Connection conn = getConnection();
		int listCount = tbDao.TBoarVDSEConut(conn, searchtext, searchField);
		close(conn);
		
		return listCount;
	}

	public List<Board> TboardSaerchVDSE(String searchtext, PageInfo pi, int searchField) {
		Connection conn = getConnection();
		List<Board> list = tbDao.TboardSaerchVDSE(conn, searchtext, pi, searchField);
		close(conn);
				
		return list;
	}
	
	public int TBoarSPTFConut(String searchtext, int searchField) {
		Connection conn = getConnection();
		int listCount = tbDao.TBoarSPTFConut(conn, searchtext, searchField);
		close(conn);
		
		return listCount;
	}

	public List<Board> TboardSaerchSPTF(String searchtext, PageInfo pi, int searchField) {
		Connection conn = getConnection();
		List<Board> list = tbDao.TboardSaerchSPTF(conn, searchtext, pi, searchField);
		close(conn);
				
		return list;
	}
	
	public int TBoarBOFAConut(String searchtext, int searchField) {
		Connection conn = getConnection();
		int listCount = tbDao.TBoarBOFAConut(conn, searchtext, searchField);
		close(conn);
		
		return listCount;
	}

	public List<Board> TboardSaerchBOFA(String searchtext, PageInfo pi, int searchField) {
		Connection conn = getConnection();
		List<Board> list = tbDao.TboardSaerchBOFA(conn, searchtext, pi, searchField);
		close(conn);
				
		return list;
	}
	
	public int TBoarETRFConut(String searchtext, int searchField) {
		Connection conn = getConnection();
		int listCount = tbDao.TBoarETRFConut(conn, searchtext, searchField);
		close(conn);
		
		return listCount;
	}

	public List<Board> TboardSaerchETRF(String searchtext, PageInfo pi, int searchField) {
		Connection conn = getConnection();
		List<Board> list = tbDao.TboardSaerchETRF(conn, searchtext, pi, searchField);
		close(conn);
				
		return list;
	}
	
	public int TBoarCCFEConut(String searchtext, int searchField) {
		Connection conn = getConnection();
		int listCount = tbDao.TBoarCCFEConut(conn, searchtext, searchField);
		close(conn);
		
		return listCount;
	}

	public List<Board> TboardSaerchCCFE(String searchtext, PageInfo pi, int searchField) {
		Connection conn = getConnection();
		List<Board> list = tbDao.TboardSaerchCCFE(conn, searchtext, pi, searchField);
		close(conn);
				
		return list;
	}
	
	public int TBoarCASEConut(String searchtext, int searchField) {
		Connection conn = getConnection();
		int listCount = tbDao.TBoarCASEConut(conn, searchtext, searchField);
		close(conn);
		
		return listCount;
	}

	public List<Board> TboardSaerchCASE(String searchtext, PageInfo pi, int searchField) {
		Connection conn = getConnection();
		List<Board> list = tbDao.TboardSaerchCASE(conn, searchtext, pi, searchField);
		close(conn);
				
		return list;
	}
	
	public int TBoarHHALConut(String searchtext, int searchField) {
		Connection conn = getConnection();
		int listCount = tbDao.TBoarHHALConut(conn, searchtext, searchField);
		close(conn);
		
		return listCount;
	}

	public List<Board> TboardSaerchHHAL(String searchtext, PageInfo pi, int searchField) {
		Connection conn = getConnection();
		List<Board> list = tbDao.TboardSaerchHHAL(conn, searchtext, pi, searchField);
		close(conn);
				
		return list;
	}
	
	


	
	
}
