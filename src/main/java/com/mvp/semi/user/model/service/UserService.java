package com.mvp.semi.user.model.service;

import static com.mvp.semi.common.template.JDBCTemplate.close;
import static com.mvp.semi.common.template.JDBCTemplate.getConnection;
import static com.mvp.semi.common.template.JDBCTemplate.commit;
import static com.mvp.semi.common.template.JDBCTemplate.rollback;


import java.lang.reflect.Member;
import java.sql.Connection;
import java.util.Map;

import com.mvp.semi.user.model.dao.UserDao;
import com.mvp.semi.user.model.vo.User;

public class UserService {

	private UserDao uDao = new UserDao();

	public int loginUser(String userId, String userPwd) {
		Connection conn = getConnection();
		 int result = uDao.loginUser(conn, userId, userPwd);

		close(conn);
		return result;
	}

	public int insertUser(User u) {
		Connection conn = getConnection();
		int result = uDao.insertUser(conn, u);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

	public int idCheck(String checkId) {
		Connection conn = getConnection();
		int count = uDao.idCheck(conn, checkId);
		close(conn);
		return count;
	}




	

	


	/*
	 * public Member updateMember(Member m) {
	 * 
	 * Connection conn = getConnection();
	 * 
	 * // 1. 회원정보 변경 (update) int result = mDao.updateMember(conn, m);
	 * 
	 * Member updateMem = null; if(result > 0) { commit(conn); // 2. 갱신된 회원 조회
	 * (select) updateMem = mDao.selectMemberById(conn, m.getUserId());
	 * 
	 * }else { rollback(conn); }
	 * 
	 * close(conn);
	 * 
	 * return updateMem; // null(정보변경실패) | 갱신된회원객체(정보변경성공)
	 * 
	 * }
	 * 
	 * public Member updateMemberPwd(Map<String, String> map) { Connection conn =
	 * getConnection(); // 1. 비밀번호 변경 (update) int result =
	 * mDao.updateMemberPwd(conn, map);
	 * 
	 * Member updateMem = null; if(result > 0) { commit(conn); // 2. 갱신된 회원 조회
	 * (select) updateMem = mDao.selectMemberById(conn, map.get("userId")); }else {
	 * rollback(conn); }
	 * 
	 * close(conn);
	 * 
	 * return updateMem; }
	 * 
	 * public int deleteMember(String userId, String userPwd) { Connection conn =
	 * getConnection(); int result = mDao.deleteMember(conn, userId, userPwd);
	 * if(result > 0) { commit(conn); }else { rollback(conn); } close(conn); return
	 * result; }
	 * 
	 * public int idCheck(String checkId) { Connection conn = getConnection(); int
	 * count = mDao.idCheck(conn, checkId); close(conn); return count; }
	 * 
	 */

}
