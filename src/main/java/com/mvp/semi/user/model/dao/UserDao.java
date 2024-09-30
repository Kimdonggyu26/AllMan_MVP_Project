package com.mvp.semi.user.model.dao;

import static com.mvp.semi.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.mvp.semi.common.model.vo.PageInfo;
import com.mvp.semi.movie.model.vo.Movie;
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
		User result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginUser");

		try {
			pstmt = conn.prepareStatement(sql); // 미완성된 sql문
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				result = new User(rset.getInt("USER_NO"),
						rset.getString("USER_ID"), 
						rset.getString("USER_PWD"),
						rset.getString("PHONE"),
						rset.getString("EMAIL"),
						rset.getString("USER_NICKNAME"),
						rset.getDate("ENROLL_DATE"),
						rset.getDate("MODIFY_DATE"),
						rset.getString("STATUS"),
						rset.getInt("taste_No"),
						rset.getString("PROFILE_PATH"),
						rset.getString("taste_code"));
			}

			System.out.println(result);
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

			if (rset.next()) {
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

	public int deleteUser(Connection conn, String userId, String userPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteUser");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public User finduserId(Connection conn, String email) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("finduserid");
		ResultSet rset = null;
		User u = new User();

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, email);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				u.setUserId(rset.getString("user_id"));
			
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return u;

	}

	public User finduserPwd(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("finduserpwd");
		ResultSet rset = null;
		User u = new User();

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();
 
			if (rset.next()) {
				u.setUserPwd(rset.getString("user_pwd"));
			
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return u;
	}

	public int modifyUser(Connection conn,String userId, String userNick, String email, String phone) {
		int result = 0;
        PreparedStatement pstmt = null;
        String sql =prop.getProperty("modifyuser");
       
        
        try {
			pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, userNick);
	        			pstmt.setString(2, email);
	        			pstmt.setString(3, phone);
	        			pstmt.setString(4, userId);
	        			
	        			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
        
        return result;
        
        
	}

	public int updateUserProfile(Connection conn, User u) {
	    PreparedStatement pstmt = null;
	    int result = 0;

	    // SQL 쿼리 가져오기 (닉네임과 프로필 이미지 모두 업데이트)
	    String sql = prop.getProperty("updateuserprofile");

	    try {
	        pstmt = conn.prepareStatement(sql);

	        // 닉네임, 프로필 이미지 경로, 사용자 ID 설정
	        pstmt.setString(1, u.getUserNick());
	        pstmt.setString(2, u.getFilePath());
	        pstmt.setString(3, u.getUserId());

	        // SQL 실행
	        result = pstmt.executeUpdate();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(pstmt);
	    }

	    return result;
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
		} finally {
			close(pstmt);
		}
		return result;
		
	}



	public int updateUserTaste(Connection conn, int i, String u) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("userTaste");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, i);
			pstmt.setString(2, u);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int updateUser(Connection conn,User user) {
        PreparedStatement pstmt = null;
        int result = 0;
        String sql = prop.getProperty("modifyuser");

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUserNick());  // 수정할 닉네임
            pstmt.setString(2, user.getFilePath());
            pstmt.setString(3, user.getEmail());   // 수정할 이메일
            pstmt.setString(4, user.getPhone());   // 수정할 전화번호
            pstmt.setString(5, user.getUserId());

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }

        return result;
    }

	public int selectAllUserList(Connection conn, Map<String, String> searchData) { // map 넘겨받기

		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllUserList"); // "select ~~~~ where status = '10'"

		String startDate = searchData.get("startDate");
		String endDate = searchData.get("endDate");
		String teamNo = searchData.get("teamNo");
		String keyword = searchData.get("keyword");

		if (!startDate.equals("") && !endDate.equals("")) {
			sql += " AND OPEN_DATE BETWEEN '" + startDate + "' AND '" + endDate + "'";
		}

		if (!teamNo.equals("")) {
			sql += " AND (TEAM_NO = '" + teamNo +"'";
		}

		if (!keyword.equals("")) {
			sql += " AND USER_NICKNAME LIKE '%" + keyword + "%'";
		}

		/*
		 * 넘겨 받은 map으로 부터 startDate, endDate, genre, keyword 다 뽑기
		 * 
		 * if(startDate랑 endDate가 존재할 경우) { sql += "and startDate와 endDate 기간조건 "; }
		 * 
		 * if(genre 가 존재할 경우) { sql += "and 장르에 대한 in 조건"; }
		 * 
		 * if(keyword가 존재할 경우) { sql += "and 검색어에 대한 조건"; }
		 */

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		}
		
			
	return listCount;

	}


	public int emailCheck(Connection conn, String checkEmail) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("emailCheck");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkEmail);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				count = rset.getInt("count");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	public int selectAllAdminList(Connection conn, Map<String, String> searchData) { // map 넘겨받기

		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllAdminList"); // "select ~~~~ where status = '10'"

		String startDate = searchData.get("startDate");
		String endDate = searchData.get("endDate");
		String teamNo = searchData.get("teamNo");
		String keyword = searchData.get("keyword");

		if (!startDate.equals("") && !endDate.equals("")) {
			sql += " AND OPEN_DATE BETWEEN '" + startDate + "' AND '" + endDate + "'";
		}

		if (!teamNo.equals("")) {
			sql += " AND (TEAM_NO = '" + teamNo +"'";
		}

		if (!keyword.equals("")) {
			sql += " AND USER_NICKNAME LIKE '%" + keyword + "%'";
		}

		/*
		 * 넘겨 받은 map으로 부터 startDate, endDate, genre, keyword 다 뽑기
		 * 
		 * if(startDate랑 endDate가 존재할 경우) { sql += "and startDate와 endDate 기간조건 "; }
		 * 
		 * if(genre 가 존재할 경우) { sql += "and 장르에 대한 in 조건"; }
		 * 
		 * if(keyword가 존재할 경우) { sql += "and 검색어에 대한 조건"; }
		 */

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt("COUNT");

		return count;
	}



	public int phoneCheck(Connection conn, String checkPhone) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("phoneCheck");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkPhone);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				count = rset.getInt("count");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	public List<User> selectPagingShowUserList(Connection conn, PageInfo pi, Map<String, String> searchData) { // map
																													// 넘겨받기

		List<User> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPagingShowUserList");

		String startDate = searchData.get("startDate");
		String endDate = searchData.get("endDate");
		String teamNo = searchData.get("teamNo");
		String keyword = searchData.get("keyword");

		if (!startDate.equals("") && !endDate.equals("")) {
			sql += " AND OPEN_DATE BETWEEN '" + startDate + "' AND '" + endDate + "'";
		}

		if (!teamNo.equals("")) {
			sql += " AND TEAM_NO = '" + teamNo +"'";
		}

		if (!keyword.equals("")) {
			sql += " AND USER_NICKNAME LIKE '%" + keyword + "%'";
		}

		sql += ") WHERE RNUM BETWEEN ? AND ?";

		/*
		 * 넘겨 받은 map으로 부터 startDate, endDate, genre, keyword 다 뽑기
		 * 
		 * if(startDate랑 endDate가 존재할 경우) { sql += "and startDate와 endDate 기간조건 "; }
		 * 
		 * if(genre 가 존재할 경우) { sql += "and 장르에 대한 in 조건"; }
		 * 
		 * if(keyword가 존재할 경우) { sql += "and 검색어에 대한 조건"; }
		 * 
		 * sql += ")  WHERE RNUM BETWEEN ? AND ?";
		 */
		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new User(rset.getInt("USER_NO"), rset.getString("USER_ID"),
						rset.getString("USER_PWD"), rset.getString("PHONE"), rset.getString("EMAIL"),
						rset.getString("USER_NICKNAME"), rset.getDate("ENROLL_DATE"), rset.getDate("MODIFY_DATE"),
						rset.getString("STATUS"), rset.getInt("TASTE_NO"), rset.getString("PROFILE_PATH"),
						rset.getInt("TEAM_NO"), rset.getString("TASTE_CODE")));
			}
			System.out.println(sql);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public List<User> selectPagingShowAdminList(Connection conn, PageInfo pi, Map<String, String> searchData) { // map
																													// 넘겨받기

		List<User> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPagingShowAdminList");

		String startDate = searchData.get("startDate");
		String endDate = searchData.get("endDate");
		String teamNo = searchData.get("teamNo");
		String keyword = searchData.get("keyword");

		if (!startDate.equals("") && !endDate.equals("")) {
			sql += " AND OPEN_DATE BETWEEN '" + startDate + "' AND '" + endDate + "'";
		}

		if (!teamNo.equals("")) {
			sql += " AND (TEAM_NO = '" + teamNo +"'";
		}

		if (!keyword.equals("")) {
			sql += " AND MOVIE_TITLE LIKE '%" + keyword + "%'";
		}

		sql += ") WHERE RNUM BETWEEN ? AND ?";


		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new User(rset.getInt("USER_NO"), rset.getString("USER_ID"),
						rset.getString("USER_PWD"), rset.getString("PHONE"), rset.getString("EMAIL"),
						rset.getString("USER_NICKNAME"), rset.getDate("ENROLL_DATE"), rset.getDate("MODIFY_DATE"),
						rset.getString("STATUS"), rset.getInt("TASTE_NO"), rset.getString("PROFILE_PATH"),
						rset.getInt("TEAM_NO"), rset.getString("TASTE_CODE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;

		return count;
	}
	

}
