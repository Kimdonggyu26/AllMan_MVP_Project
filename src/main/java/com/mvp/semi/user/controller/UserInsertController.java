package com.mvp.semi.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvp.semi.user.model.service.UserService;
import com.mvp.semi.user.model.vo.User;

/**
 * Servlet implementation class UserInsertController
 */
@WebServlet("/insert.us")
public class UserInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String userId = request.getParameter("userId"); // "user03"
		String userPwd = request.getParameter("userPwd"); // "pass03"
		String confirmPwd = request.getParameter("confirmPwd"); // "pass03"
		String phone = request.getParameter("phone"); // "010-1111-2222" | ""
		String email = request.getParameter("email"); // "ssss@sss.com" | ""
		

        if (userPwd.equals(confirmPwd)) {
         
        
		
			User u = new User(userId, userPwd, phone,email);
		
		
		// 서비스 호출 (쿼리실행)
		int result = new UserService().insertUser(u);
		
		
		// 2. 응답
		if(result > 0) {
			/*
			 * * 회원가입 성공
			 *   ㄴ 응답페이지 : 메인페이지
			 *   ㄴ 응답데이터 : "성공적으로 회원가입 되었습니다." alert 메세지
			 */
			System.out.println("121314123");
			request.getSession().setAttribute("alertMsg", "성공적으로 회원가입 되었습니다.");
			response.sendRedirect(request.getContextPath());
		}else {
			/*
			 * * 회원가입 실패
			 *   ㄴ 응답페이지 : 에러페이지 
			 *   ㄴ 응답데이터 : "회원가입 실패" 메세지 (해당 응답페이지에서만 필요)
			 */
			
			request.setAttribute("msg", "회원가입 실패");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
			
		}	
		
        }else {
        	System.out.println("시발");
        	request.setAttribute("msg", "비밀번호가 일치하지않습니다.");
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
