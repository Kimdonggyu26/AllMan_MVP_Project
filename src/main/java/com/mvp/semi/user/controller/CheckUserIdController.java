package com.mvp.semi.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvp.semi.user.model.dao.UserDao;

/**
 * Servlet implementation class CheckUserIdController
 */
@WebServlet("/idcheck.us")
public class CheckUserIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckUserIdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String userId = request.getParameter("userId");
		
        UserDao userDAO = new UserDao();
        boolean isDuplicate = userDAO.isUserIdDuplicate(userId);
		
        // 응답 설정
        response.setContentType("text/html; charset=UTF-8 " );
        response.setCharacterEncoding("UTF-8");

        if (isDuplicate) {
            // 중복인 경우 'duplicate' 전송
            response.getWriter().write("duplicate");
        } else {
            // 중복이 아닌 경우 'available' 전송
        	response.getWriter().write("available");
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
