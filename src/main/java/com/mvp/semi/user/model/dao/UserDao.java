package com.mvp.semi.user.model.dao;

import static com.mvp.semi.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
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
	
	public User loginUser(Connection conn, String userId, String userPwd) {
		// select문 => ResultSet (한 행, 한 회원) => Member객체
		User u  = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginUser");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성된 sql문
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				 u = new User(rset.getInt("USER_NO")
							 , rset.getString("user_id")
							 , rset.getString("user_pwd")
							 , rset.getString("phone")
							 , rset.getString("email")
							 , rset.getDate("enroll_date")
							 , rset.getDate("modify_date")
							 , rset.getString("status"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return u;
		
	}
	
	public int insertUser(Connection conn,User u) {
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

			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	/*
	 * public int updateUser(Connection conn, User u) { // update문 => 처리된 행수 int
	 * result = 0; PreparedStatement pstmt = null; String sql =
	 * prop.getProperty("updateMember");
	 * 
	 * try { pstmt = conn.prepareStatement(sql); pstmt.setString(1,
	 * u.getUserName()); pstmt.setString(2, u.getPhone()); pstmt.setString(3,
	 * u.getEmail());
	 * 
	 * result = pstmt.executeUpdate();
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); } finally { close(pstmt); }
	 * 
	 * return result;
	 * 
	 * 
	 * }
	 * 
	 * public User selectUserById(Connection conn, String userId) { // select =>
	 * ResultSet (한행, 한회원) => Member User u = null; PreparedStatement pstmt = null;
	 * ResultSet rset = null; String sql = prop.getProperty("selectMemberById");
	 * 
	 * try { pstmt = conn.prepareStatement(sql); pstmt.setString(1, userId); rset =
	 * pstmt.executeQuery();
	 * 
	 * if(rset.next()) { u = new User(rset.getInt("USER_NO") ,
	 * rset.getString("user_id") , rset.getString("user_pwd") ,
	 * rset.getString("user_name") , rset.getString("phone") ,
	 * rset.getString("email") , rset.getDate("enroll_date") ,
	 * rset.getDate("modify_date") , rset.getString("status")); } } catch
	 * (SQLException e) { e.printStackTrace(); } finally { close(rset);
	 * close(pstmt); }
	 * 
	 * return m; }
	 * 
	 * public int updateUserPwd(Connection conn, Map<String, String> map) { //
	 * update => 처리된 행수 int result = 0; PreparedStatement pstmt = null; String sql =
	 * prop.getProperty("updateMemberPwd");
	 * 
	 * try { pstmt = conn.prepareStatement(sql); pstmt.setString(1,
	 * map.get("updatePwd")); pstmt.setString(2, map.get("userId"));
	 * pstmt.setString(3, map.get("userPwd")); result = pstmt.executeUpdate(); }
	 * catch (SQLException e) { e.printStackTrace(); } finally { close(pstmt); }
	 * 
	 * return result; }
	 * 
	 * public int deleteUser(Connection conn, String userId, String userPwd) { //
	 * update문 => 처리된 행수 int result = 0; PreparedStatement pstmt = null; String sql
	 * = prop.getProperty("deleteMember");
	 * 
	 * try { pstmt = conn.prepareStatement(sql); pstmt.setString(1, userId);
	 * pstmt.setString(2, userPwd); result = pstmt.executeUpdate();
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); } finally { close(pstmt); }
	 * 
	 * return result; }
	 * 
	 * public int idCheck(Connection conn, String checkId) { int count = 0;
	 * PreparedStatement pstmt = null; ResultSet rset = null; String sql =
	 * prop.getProperty("idCheck");
	 * 
	 * try { pstmt = conn.prepareStatement(sql); pstmt.setString(1, checkId);
	 * 
	 * rset = pstmt.executeQuery();
	 * 
	 * if(rset.next()) { count = rset.getInt("count"); }
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); } finally { close(rset);
	 * close(pstmt); }
	 * 
	 * return count; }
	 * 
	 * 
	 */


	

}
