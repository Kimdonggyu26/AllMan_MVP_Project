package com.mvp.semi.board.model.dao;

import static com.mvp.semi.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.mvp.semi.board.model.vo.Board;
import com.mvp.semi.board.model.vo.Reply;
import com.mvp.semi.common.model.vo.PageInfo;
import com.mvp.semi.movie.model.vo.Movie;


public class TBoardDao {
	
	private Properties prop = new Properties();
	
	public TBoardDao() {
		try {
			prop.loadFromXML(new FileInputStream(TBoardDao.class.getResource("/db/mappers/tboard-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int selectTBoardListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTBoardListCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, 10);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public List<Board> selectTBoardList(Connection conn, PageInfo pi) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, 10);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board( rset.getInt("BOARD_NO")
						  		  , rset.getString("USER_ID")
								  , rset.getString("PROFILE_PATH")
								  , rset.getString("MOVIE_TITLE")
								  , rset.getString("MOVIE_CONTENT")
								  , rset.getDate("OPEN_DATE")
								  , rset.getString("TITLE_PATH")
								  , rset.getInt("TASTE_NO")
								  , rset.getString("TASTE_CODE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int selectVDSEListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTBoardListCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, 20);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public List<Board> selectVDSEList(Connection conn, PageInfo pi) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, 20);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board( rset.getInt("BOARD_NO")
						  		  , rset.getString("USER_ID")
								  , rset.getString("PROFILE_PATH")
								  , rset.getString("MOVIE_TITLE")
								  , rset.getString("MOVIE_CONTENT")
								  , rset.getDate("OPEN_DATE")
								  , rset.getString("TITLE_PATH")
								  , rset.getInt("TASTE_NO")
								  , rset.getString("TASTE_CODE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int selectSPTFListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTBoardListCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, 30);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public List<Board> selectSPTFList(Connection conn, PageInfo pi) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, 30);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board( rset.getInt("BOARD_NO")
						  		  , rset.getString("USER_ID")
								  , rset.getString("PROFILE_PATH")
								  , rset.getString("MOVIE_TITLE")
								  , rset.getString("MOVIE_CONTENT")
								  , rset.getDate("OPEN_DATE")
								  , rset.getString("TITLE_PATH")
								  , rset.getInt("TASTE_NO")
								  , rset.getString("TASTE_CODE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int selectBOFAListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTBoardListCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, 40);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public List<Board> selectBOFAList(Connection conn, PageInfo pi) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, 40);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board( rset.getInt("BOARD_NO")
						  		  , rset.getString("USER_ID")
								  , rset.getString("PROFILE_PATH")
								  , rset.getString("MOVIE_TITLE")
								  , rset.getString("MOVIE_CONTENT")
								  , rset.getDate("OPEN_DATE")
								  , rset.getString("TITLE_PATH")
								  , rset.getInt("TASTE_NO")
								  , rset.getString("TASTE_CODE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int selectETRFListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTBoardListCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, 50);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public List<Board> selectETRFList(Connection conn, PageInfo pi) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, 50);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board( rset.getInt("BOARD_NO")
						  		  , rset.getString("USER_ID")
								  , rset.getString("PROFILE_PATH")
								  , rset.getString("MOVIE_TITLE")
								  , rset.getString("MOVIE_CONTENT")
								  , rset.getDate("OPEN_DATE")
								  , rset.getString("TITLE_PATH")
								  , rset.getInt("TASTE_NO")
								  , rset.getString("TASTE_CODE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int selectCCFEList(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTBoardListCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, 60);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public List<Board> selectCCFEList(Connection conn, PageInfo pi) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, 60);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board( rset.getInt("BOARD_NO")
						  		  , rset.getString("USER_ID")
								  , rset.getString("PROFILE_PATH")
								  , rset.getString("MOVIE_TITLE")
								  , rset.getString("MOVIE_CONTENT")
								  , rset.getDate("OPEN_DATE")
								  , rset.getString("TITLE_PATH")
								  , rset.getInt("TASTE_NO")
								  , rset.getString("TASTE_CODE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int selectCASEListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTBoardListCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, 70);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public List<Board> selectCASEList(Connection conn, PageInfo pi) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, 70);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board( rset.getInt("BOARD_NO")
						  		  , rset.getString("USER_ID")
								  , rset.getString("PROFILE_PATH")
								  , rset.getString("MOVIE_TITLE")
								  , rset.getString("MOVIE_CONTENT")
								  , rset.getDate("OPEN_DATE")
								  , rset.getString("TITLE_PATH")
								  , rset.getInt("TASTE_NO")
								  , rset.getString("TASTE_CODE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int selectHHALListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTBoardListCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, 80);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public List<Board> selectHHALList(Connection conn, PageInfo pi) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, 80);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board( rset.getInt("BOARD_NO")
						  		  , rset.getString("USER_ID")
								  , rset.getString("PROFILE_PATH")
								  , rset.getString("MOVIE_TITLE")
								  , rset.getString("MOVIE_CONTENT")
								  , rset.getDate("OPEN_DATE")
								  , rset.getString("TITLE_PATH")
								  , rset.getInt("TASTE_NO")
								  , rset.getString("TASTE_CODE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public Board selectBoardByNo(Connection conn, int tBoardNo) {
		
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoardByNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tBoardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board();
				b.setBoardNo(rset.getInt("board_no"));
				b.setBoardTitle(rset.getString("board_title"));
				b.setBoardContent(rset.getString("board_content"));
				b.setRegistDate(rset.getString("regist_date"));
				b.setUserId(rset.getString("user_id"));
				b.setGenre(rset.getString("genre"));
				b.setTitlePath(rset.getString("title_path"));
				b.setTasteNo(rset.getInt("taste_no"));
				b.setTasteCode(rset.getString("taste_code"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return b;
	}

	

	public int insertReply(Connection conn, Reply r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insetReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getReplyWriter());
			pstmt.setString(2, r.getReplyContent());
			pstmt.setInt(3, r.getRefBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int deleteReply(Connection conn, int replyNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	

	public int selectTBoardReplyCount(Connection conn, int boardNo) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTBoardReplyCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	public List<Reply> selectReplyList(Connection conn, int boardNo, PageInfo pi) {
		List<Reply> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, boardNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Reply(rset.getInt("reply_no")
								 , rset.getString("reply_content")
								 , rset.getString("regist_date")
								 , rset.getString("user_id")
								 , rset.getString("profile_path")));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int TBoardInsertSearchCount(Connection conn, String search) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("TBoardInsertSearchCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, search);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public List<Movie> TboardInsertSaerchList(Connection conn, String search, int tno, PageInfo pi) {
		List<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("TboardInsertSaerchList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, search);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Reply(rset.getInt("reply_no")
								 , rset.getString("reply_content")
								 , rset.getString("regist_date")
								 , rset.getString("user_id")
								 , rset.getString("profile_path")));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}



}
