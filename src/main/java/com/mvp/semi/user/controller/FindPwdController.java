package com.mvp.semi.user.controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvp.semi.user.model.service.UserService;
import com.mvp.semi.user.model.vo.User;

/**
 * Servlet implementation class FindPwdController
 */
@WebServlet("/findpwd.us")
public class FindPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		System.out.println("이메일 변경 요청 : " + userId);
		
		User result = new UserService().finduserPwd(userId);
		
		HttpSession serSession = request.getSession();
		
		if (result.getUserPwd() == null) {
			System.out.println("유저 정보 확인 불가");
			request.getRequestDispatcher("/views/account/findPwdFail.jsp").forward(request, response);
		} else {
			//랜덤 PWD 생성
			Random random = new Random();
	        
	        // 사용할 문자들 (대문자와 숫자)
	        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	        
	        int length = 6;
	        StringBuilder randomString = new StringBuilder();
	        
	        for (int i = 0; i < length; i++) {
	            // 50% 확률로 문자 또는 숫자 생성
	            if (random.nextBoolean()) {
	                // 랜덤 문자 추가
	                char randomChar = characters.charAt(random.nextInt(characters.length()));
	                randomString.append(randomChar);
	            } else {
	                // 랜덤 숫자 추가
	                int randomDigit = random.nextInt(10);  // 0부터 9까지 숫자
	                randomString.append(randomDigit);
	            }
	            
	        }
	        System.out.println("만들어진 비밀번호 : "+randomString);
	        String resetPwd = randomString.toString();
	        
			//PWD 변경
			int updateResult = new UserService().userPwdEdit(userId, resetPwd);
			if(updateResult > 0) {
				System.out.println("비밀번호 변경 성공");
				System.out.println("@#@#@#@#@" + result.toString());
				serSession.setAttribute("userId", result);
				serSession.setAttribute("reSetPwd", resetPwd);
				request.getRequestDispatcher("/smtpTest.do").forward(request, response);
			}else {
				System.out.println("변경실패");
				request.getRequestDispatcher("/views/account/findPwdFail.jsp").forward(request, response);
			}
			//유저 정보 가져오기
			//STMP로 이메일 전송 요청하기
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
