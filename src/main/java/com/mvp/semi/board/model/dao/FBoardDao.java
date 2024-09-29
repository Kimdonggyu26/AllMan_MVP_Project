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
import com.mvp.semi.common.model.vo.PageInfo;
import com.mvp.semi.movie.model.vo.Movie;

public class FBoardDao {
	
	private Properties prop = new Properties();
	
	public FBoardDao() {
		try {
			prop.loadFromXML(new FileInputStream(FBoardDao.class.getResource("/db/mappers/fboard-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int selectFBoardListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFBoardListCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
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

	public List<Board> selectFBoardList(Connection conn, PageInfo pi) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board( rset.getInt("BOARD_NO")
								  , rset.getInt("BOARD_TYPE")
						  		  , rset.getString("USER_ID")
								  , rset.getString("PROFILE_PATH")
								  , rset.getString("MOVIE_TITLE")
								  , rset.getString("MOVIE_CONTENT")
								  , rset.getDate("OPEN_DATE")
								  , rset.getString("TITLE_PATH")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		
		return list;
	}

	public Board selectBoardByNo(Connection conn, int fBoardNo) {
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoardByNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fBoardNo);
			
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
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return b;
	}
	
	public int FBoardInsertSearchCount(Connection conn, String search) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("FBoardInsertSearchCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			pstmt.setString(3, search);
			pstmt.setString(4, search);
			
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

	public List<Movie> FboardInsertSaerchList(Connection conn, String search, PageInfo pi) {
		List<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("FboardInsertSaerchList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			pstmt.setString(3, search);
			pstmt.setString(4, search);
			pstmt.setInt(5, startRow);
			pstmt.setInt(6, endRow);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Movie(rset.getInt("MOVIE_NO")
								 , rset.getString("MOVIE_TITLE")
								 , rset.getString("GENRE")
								 , rset.getString("DIRECTOR")
								 , rset.getString("ACTOR")
								 , rset.getString("TITLE_PATH")));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public int insertFBoard(Connection conn, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b.getBoardType());
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setString(3, b.getBoardContent());
			pstmt.setString(4, b.getUserId());
			pstmt.setString(5, b.getMovieTitle());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int FBoarSearchCount(Connection conn, String searchtext, int searchField) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		if(searchField == 0) {
			String sql = prop.getProperty("FBoarSearchCount0");
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, searchtext);
				pstmt.setString(2, searchtext);
				
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
			
		}else{
			
			String sql = prop.getProperty("FBoarSearchCount1");
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, searchtext);
				
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
	}

	public List<Board> FboardSaerchList(Connection conn, String searchtext, PageInfo pi, int searchField) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		if(searchField == 0) {
			
			String sql = prop.getProperty("FboardSaerchList0");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
				int endRow = startRow + pi.getBoardLimit() - 1;
				
				pstmt.setString(1, searchtext);
				pstmt.setString(2, searchtext);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
				
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Board( rset.getInt("BOARD_NO")
									  , rset.getInt("BOARD_TYPE")
							  		  , rset.getString("USER_ID")
									  , rset.getString("PROFILE_PATH")
									  , rset.getString("MOVIE_TITLE")
									  , rset.getString("MOVIE_CONTENT")
									  , rset.getDate("OPEN_DATE")
									  , rset.getString("TITLE_PATH")));
				}
					
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			
			return list;
			
		}else {
			String sql = prop.getProperty("FboardSaerchList1");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
				int endRow = startRow + pi.getBoardLimit() - 1;
				
				pstmt.setString(1, searchtext);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Board( rset.getInt("BOARD_NO")
									  , rset.getInt("BOARD_TYPE")
							  		  , rset.getString("USER_ID")
									  , rset.getString("PROFILE_PATH")
									  , rset.getString("MOVIE_TITLE")
									  , rset.getString("MOVIE_CONTENT")
									  , rset.getDate("OPEN_DATE")
									  , rset.getString("TITLE_PATH")));
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

	public int deleteFboard(Connection conn, int boardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteboard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}


}
