package com.mvp.semi.user.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
		   request.setCharacterEncoding("UTF-8");

	        // 1. 폼에서 넘어온 값 받기
	        String userId = request.getParameter("userid");
	        String userNick = request.getParameter("userNick");
	        String email = request.getParameter("email");
	        String phone = request.getParameter("phone");
	        String filePath = request.getParameter("filePath");  // 파일 경로가 있으면 받아오기
	       
	        // 2. User 객체 생성 및 수정할 값 설정
	        User user = new User();
	        user.setUserId(userId);
	        user.setUserNick(userNick);
	        user.setEmail(email);
	        user.setPhone(phone);
	        user.setFilePath(filePath);  // 프로필 이미지 경로 업데이트
	        System.out.println(user);
	        // 3. Service 호출
	        UserService userService = new UserService();
	        int result = userService.updateUser(user);
	        System.out.println(result);
	        // 4. 결과에 따라 페이지 이동 처리
	        HttpSession session = request.getSession();
	        if (result > 0) {
	            // 수정 성공 시 사용자 정보를 세션에 업데이트
	            session.setAttribute("loginUser", user);
	            session.setAttribute("msg", "회원 정보가 성공적으로 수정되었습니다.");
	            response.sendRedirect(request.getContextPath() + "/mypage.us");  // 마이페이지로 리다이렉트
	        } else {
	            // 수정 실패 시 에러 페이지로 포워딩
	            request.setAttribute("msg", "회원 정보 수정에 실패했습니다.");
	            request.getRequestDispatcher("views/account/modifyUser.jsp").forward(request, response);
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
