package com.mvp.semi.ca.favorites.model.dao;

import static com.mvp.semi.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class FavoritesDao {
	
	private Properties prop = new Properties();
	
	public FavoritesDao() {
		try {
			prop.loadFromXML(new FileInputStream(FavoritesDao.class.getResource("/db/mappers/favorites-mapper.xml").getPath()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public int insertMovieLike(Connection conn, int userNo, int movieNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMovieLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, movieNo);
			
			result = pstmt.executeUpdate();
			//System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteMovieLike(Connection conn, int userNo, int movieNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMovieLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, movieNo);
			
			result = pstmt.executeUpdate();
			System.out.println("삭제되었는지 : " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
		
	}
	
	public int checkMovieLiked(Connection conn, int userNo, int movieNo) {
		int alreadyLiked = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkMovieLiked");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, movieNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				alreadyLiked = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return alreadyLiked;
		
	}

}
