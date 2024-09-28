package com.mvp.semi.board.model.service;

import static com.mvp.semi.common.template.JDBCTemplate.close;
import static com.mvp.semi.common.template.JDBCTemplate.commit;
import static com.mvp.semi.common.template.JDBCTemplate.getConnection;
import static com.mvp.semi.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.mvp.semi.board.model.dao.FBoardDao;
import com.mvp.semi.board.model.vo.Board;
import com.mvp.semi.common.model.vo.PageInfo;
import com.mvp.semi.movie.model.vo.Movie;


public class FBoardService {
	
	private FBoardDao fbDao = new FBoardDao();
	
	public int selectFBoardListCount() {
		Connection conn = getConnection();
		int listCount = fbDao.selectFBoardListCount(conn);
		close(conn);
		return listCount;
	}

	public List<Board> selectFBoardList(PageInfo pi) {
		Connection conn = getConnection();
		
		List<Board> list = fbDao.selectFBoardList(conn, pi);
		close(conn);
		

		
		return list;
	}


	public Board selectFBoardByNo(int fBoardNo) {
		Connection conn = getConnection();
		
		Board b = fbDao.selectBoardByNo(conn,fBoardNo);
		
		close(conn);
		
		return b;
	}
	
	public int FBoardInsertSearchCount(String search) {
		Connection conn = getConnection();
		int listCount = fbDao.FBoardInsertSearchCount(conn, search);
		close(conn);
		return listCount;
	}
	
	public List<Movie> FboardInsertSaerchList(String search, PageInfo pi) {
		Connection conn = getConnection();
		List<Movie> list = fbDao.FboardInsertSaerchList(conn, search, pi);
		close(conn);
		
		return list;
	}

	public int insertFBoard(Board b) {
		Connection conn = getConnection();
		int result = fbDao.insertFBoard(conn, b);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}






}
