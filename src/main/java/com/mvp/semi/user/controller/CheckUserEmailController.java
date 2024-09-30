package com.mvp.semi.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvp.semi.user.model.service.UserService;

/**
 * Servlet implementation class CheckUserEmailController
 */
@WebServlet("/emailcheck.us")
public class CheckUserEmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckUserEmailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String checkEmail = request.getParameter("checkEmail");

        // 이메일 중복 확인
        int count = new UserService().emailCheck(checkEmail);
        
        response.setContentType("text/html; charset=UTF-8");
        if(count > 0) {
        	response.getWriter().print("NNNNN");
        }else {
        	response.getWriter().print("NNNNY");
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
