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
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 1,  // 1 MB
	    maxFileSize = 1024 * 1024 * 10,      // 10 MB
	    maxRequestSize = 1024 * 1024 * 50    // 50 MB
	)
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

	        HttpSession session = request.getSession();
	        User loginUser = (User) session.getAttribute("loginUser");

	        if (loginUser == null) {
	            response.sendRedirect("login.jsp");
	            return;
	        }

	        String userId = request.getParameter("userid");
	        String userNick = request.getParameter("userNick");
	        String email = request.getParameter("email");
	        String phone = request.getParameter("phone");

	        Part filePart = request.getPart("profileImage");
	        String filePath = loginUser.getFilePath();  // 기존 프로필 이미지 경로

	        if (filePart != null && filePart.getSize() > 0) {
	            String fileName = filePart.getSubmittedFileName();
	            String uploadPath = getServletContext().getRealPath("/") + "resources/profileImages/" + fileName;
	            filePart.write(uploadPath);
	            filePath = "resources/profileImages/" + fileName;
	        }

	        User updatedUser = new User();
	        updatedUser.setUserId(userId);
	        updatedUser.setUserNick(userNick);
	        updatedUser.setEmail(email);
	        updatedUser.setPhone(phone);
	        updatedUser.setFilePath(filePath);

	        UserService userService = new UserService();
	        int result = userService.updateUser(updatedUser);

	        if (result > 0) {
	            session.setAttribute("loginUser", updatedUser);  // 세션에 수정된 정보 반영
	            response.setStatus(HttpServletResponse.SC_OK);   // 성공 응답
	        } else {
	            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);  // 실패 응답
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
