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
	 // 폼에서 전달된 데이터 받기
		request.setCharacterEncoding("utf-8");
		String userNick = request.getParameter("userNick");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // 현재 세션에서 사용자 아이디 가져오기 (로그인된 사용자)
        HttpSession session = request.getSession();
        String userId = ((User) session.getAttribute("loginUser")).getUserId();
	

        // Service를 통해 DAO 호출하여 DB 업데이트
        int result  = new UserService().modifyUser(userId, userNick, email, phone);
 

        if (result > 0) {
            // 업데이트 성공 시, 프로필 페이지로 리다이렉트
        	session.setAttribute("alertMsg", "성공적으로 수정했습니다.");
            response.sendRedirect(request.getContextPath());
        } else {
            // 업데이트 실패 시, 에러 메시지와 함께 다시 수정 페이지로
            request.setAttribute("alertMsg", "정보 수정에 실패했습니다. 다시 시도해주세요.");
            request.getRequestDispatcher("/.jsp").forward(request, response);
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
