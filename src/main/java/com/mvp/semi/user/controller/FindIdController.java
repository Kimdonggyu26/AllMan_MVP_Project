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
 * Servlet implementation class FindIdController
 */
@WebServlet("/findid.us")
public class FindIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");
	      String email = request.getParameter("email");

	      User result = new UserService().finduserId(email);
	      HttpSession session = request.getSession();
	      if(result.getUserId() == null) {
	    	  System.out.println("실패");
	          session.setAttribute("alertMsg", "검색결과가 없습니다.");
	          response.sendRedirect(request.getContextPath());
	          }else {
	        	  System.out.println("성공");
	          session.setAttribute("userId", result);
	          request.getRequestDispatcher("/views/JM/findIdSuc.jsp").forward(request, response);}


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
