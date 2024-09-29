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

	public User loginUser(String userId, String userPwd) {
		Connection conn = getConnection();
		User result = uDao.loginUser(conn, userId, userPwd);

		close(conn);
		return result;
	}

	public int insertUser(User u) {
		Connection conn = getConnection();
		int result = uDao.insertUser(conn, u);// 이름 변경해주시고 , 매개변수 conn, u_Id만 들어가는 쿼리문 (0 or 1)

		if (result > 0) {
			commit(conn);
		} else {
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


	public int deleteUser(String userId, String userPwd) {
		Connection conn = getConnection();
		int result = uDao.deleteUser(conn, userId, userPwd);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public User finduserId(String email) {
		Connection conn = getConnection();

		User uId = new UserDao().finduserId(conn, email);
		close(conn);
		return uId;

	}

	public User finduserPwd(String userId) {
		Connection conn = getConnection();

		User uPwd = new UserDao().finduserPwd(conn, userId);
		close(conn);
		return uPwd;
	}

	public int modifyUser(String userId, String userNick, String email, String phone) {
		Connection conn = getConnection();
		
		int result = uDao.modifyUser(conn,userId,userNick,email,phone);
		close(conn);
		return result;
	}
	
	
	public int updatenick(User u) {
		Connection conn = getConnection();
		User updatenick = null;
		int count = uDao.selectUserByNick(conn, u.getUserNick());
		int result2 = 0;
		
		if (count == 0) {
			result2 = uDao.updatenick(conn, u);
			
			if (result2 > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		}
		
		close(conn);
		
		return result2;
		
	}
	

	public int updateUserProfile(User u) {
		  Connection conn = getConnection();
		    int result = 0;

		    // 1. 닉네임 중복 체크
		    int nickCount = uDao.selectUserByNick(conn, u.getUserNick());

		    if (nickCount == 0) {
		        // 2. 닉네임 중복이 없으면 닉네임 및 프로필 업데이트
		        result = uDao.updateUserProfile(conn, u);

		        if (result > 0) {
		            // 3. 업데이트 성공 시 커밋
		            commit(conn);
		        } else {
		            // 4. 업데이트 실패 시 롤백
		            rollback(conn);
		        }
		    } else {
		        // 닉네임 중복 시, result 값으로 실패 처리 (ex: -1)
		        result = -1;
		    }

		    // 5. 연결 종료
		    close(conn);

		    return result;
		
	}

	public int updateTaste(int i, String u) {
		//취향분석 업데이트
		//매개변수 10, 20 .. 80
		Connection conn = getConnection();
		int result = uDao.updateUserTaste(conn, i, u);
		
		//트랜젝션 처리
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}

	


