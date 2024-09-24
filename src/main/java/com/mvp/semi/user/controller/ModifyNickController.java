package com.mvp.semi.user.controller;

import java.io.IOException;
import java.io.File;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvp.semi.common.utils.MyFileRenamePolicy;
import com.mvp.semi.user.model.service.UserService;
import com.mvp.semi.user.model.vo.User;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ModifyNickController
 */
@WebServlet("/modifynick.us")
public class ModifyNickController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyNickController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("userId");
				
		String userNick = request.getParameter("usernick");
		HttpSession session = request.getSession();
		
		
		
		System.out.println(userNick);
		
		User u  = new User();
		u.setUserId(userId);
		u.setUserNick(userNick);
		
		int result = new UserService().updatenick(u);
		
		
		
		if(result < 0) {
			request.setAttribute("msg","닉네임 변경 실패");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}else {
			session.setAttribute("loginUser", userNick);
			
			
			session.setAttribute("alerMsg", "성공적으로 회원정보를 변경되었습니다");
		
			response.sendRedirect(request.getContextPath() + "/views/DG/mainPage.jsp");
		}
		
		String savePath = request.getServletContext().getRealPath("/resources/user_upfiles");
		
		
		int maxSize = 10 * 1024 * 1024;
		
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());
		
		String userprofile = multiRequest.getParameter("profile");
		u.setUserprofile(userprofile);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
