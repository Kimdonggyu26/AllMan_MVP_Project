package com.mvp.semi.user.model.dao;

import static com.mvp.semi.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.mvp.semi.user.model.vo.User;

public class UserDao {
	
	private Properties prop = new Properties();
	
	public UserDao() {
		
		String filePath = UserDao.class.getResource("/db/mappers/user-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public int loginUser(Connection conn, String userId, String userPwd) {
		// select문 => ResultSet (한 행, 한 회원) => Member객체
		int result  = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginUser");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성된 sql문
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = 1;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public int insertUser(Connection conn, User u) {
		// insert => 처리된 행 수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u.getUserId());
			pstmt.setString(2, u.getUserPwd());
			pstmt.setString(3, u.getPhone());
			pstmt.setString(4, u.getEmail());
			pstmt.setString(5, u.getUserNick());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int idCheck(Connection conn, String checkId) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}

	public int updatenick(Connection conn, User u) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("usernick");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u.getUserNick());
			pstmt.setString(2, u.getUserId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}

	public int selectUserByNick(Connection conn, String userNick) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("confirmnick");
		  try {
		        // PreparedStatement 준비 및 파라미터 설정
		        pstmt = conn.prepareStatement(sql);
		        pstmt.setString(1, userNick); 
		        rset = pstmt.executeQuery();

		        if (rset.next()) {
		            result = rset.getInt(1); // 결과가 0이면 중복 없음, 1이면 중복 있음
		        }
		        
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {

		     
		    	close(pstmt);
		    	close(rset);
		      
		    }
		    
		    return result;

	}


	

}
