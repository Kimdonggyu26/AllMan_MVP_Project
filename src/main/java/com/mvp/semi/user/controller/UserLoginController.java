package com.mvp.semi.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvp.semi.user.model.service.UserService;
import com.mvp.semi.user.model.vo.User;

/**
 * Servlet implementation class UserLoginController
 */
@WebServlet("/login.us")
public class UserLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserLoginController() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		

		User loginUser = new UserService().loginUser(userId, userPwd);
		System.out.println("로그인유저값 " + loginUser);


		if (loginUser == null) {
			request.setAttribute("alerMsg", "로그인실패");
			request.getRequestDispatcher("views/account/login.jsp").forward(request, response);
			
			// 만약 로그인 페이지로 작동 x
			// 다시 로그인 페이지 경로 잡아주기
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);

			/* response.sendRedirect(request.getContextPath()); */
			if(loginUser.getStatus().equals("A")) {
				request.getRequestDispatcher("views/adminPage/adminMainPage.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("views/movieMain/mainPage.jsp").forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}
}