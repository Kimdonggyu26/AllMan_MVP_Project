package com.mvp.semi.ca.likes.model.dao;

import static com.mvp.semi.common.template.JDBCTemplate.close;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

public class LikesDao {
	
	private Properties prop = new Properties();
	
	public int insertLike(Connection conn, int userNo, int reviewNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, reviewNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
				
	}
}
