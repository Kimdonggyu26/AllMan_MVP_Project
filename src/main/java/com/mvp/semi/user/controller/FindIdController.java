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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");

		User result = new UserService().finduserId(email);
		HttpSession session = request.getSession();
		
		if (result.getUserId() == null) {
			System.out.println("실패");
			session.setAttribute("alertMsg", "검색결과가 없습니다.");
			request.getRequestDispatcher("/views/account/findIdFail.jsp").forward(request, response);;
		} else {
			System.out.println("성공");
			session.setAttribute("email", result);
			
			
			// ID의 마지막 3자리를 별로 처리
            String userId = result.getUserId();
            String maskedId = maskLastThreeCharacters(userId);
            
            // 세션에 마스킹된 ID 저장
            session.setAttribute("maskedUserId", maskedId);
            session.setAttribute("email", result);
			
			
			request.getRequestDispatcher("/views/account/findIdSuc.jsp").forward(request, response);
		}

	}
	
	private String maskLastThreeCharacters(String userId) {
        if (userId.length() <= 3) {
            return "***"; // ID가 3자리 이하인 경우 모든 문자를 별로 처리
        }
        // 마지막 3자리를 별로 대체
        return userId.substring(0, userId.length() - 3) + "***";
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
