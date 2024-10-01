package com.mvp.semi.user.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mvp.semi.user.model.service.UserService;
import com.mvp.semi.user.model.vo.User;

/**
 * Servlet implementation class ModifyUserController
 */
@WebServlet("/modifyuser.us")


public class ModifyUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyUserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  // Multipart 처리 설정
        request.setCharacterEncoding("utf-8");


        // 나머지 파라미터 처리 (닉네임, 이메일 등)
        String userNick = request.getParameter("userNick");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String filepath = request.getParameter("filepath");
        // 사용자 정보 업데이트 로직
        User user = new User();
        user.setUserNick(userNick);
        user.setEmail(email);
        user.setPhone(phone);

        // DB 업데이트 로직
        UserService userService = new UserService();
        int result = userService.updateUser(user);

        if (result > 0) {
            HttpSession session = request.getSession();
            session.setAttribute("loginUser", user);
            response.sendRedirect(request.getContextPath() + "/views/account/modifyUser.jsp");
        } else {
            request.setAttribute("msg", "회원 정보 수정 실패");
            request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
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
