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
@WebServlet("/modifyProfile.us")
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

        // 요청 인코딩 설정
        request.setCharacterEncoding("utf-8");

        // 세션 객체 생성
        HttpSession session = request.getSession();

        // 파일 업로드를 위한 경로 설정
        String savePath = request.getServletContext().getRealPath("/resources/user_upfiles");
        int maxSize = 10 * 1024 * 1024;  // 최대 10MB 파일 사이즈

        // 파일 업로드 처리 및 MultipartRequest 객체 생성
        MultipartRequest multiRequest = new MultipartRequest(
            request, savePath, maxSize, "utf-8", new MyFileRenamePolicy()
        );
        
        // MultipartRequest를 통해 닉네임과 파일 파라미터 값을 가져옴
        String userNick = multiRequest.getParameter("usernick");
        String fileName = multiRequest.getFilesystemName("profileImage");

        // 사용자 객체 생성 및 업데이트 처리
        //String userId = (String) session.getAttribute("userId"); 세션에 담지않고 request.에 담아서 request.getAttribute로 가져와야함
        String userId =  multiRequest.getParameter("userId");
        User u = new User();
        u.setUserId(userId);
        u.setUserNick(userNick);
        u.setFilePath("/resources/user_upfiles/" + fileName); // 프로필 이미지 경로 설정
        
        // 닉네임 및 프로필 이미지 업데이트
        System.out.println(userNick);
		 
		
		  

        int result = new UserService().updateUserProfile(u); 
// 결과 처리
        if (result > 0) { // result 값에 아이디값이 있으면 1로 바뀌어서 > 가 맞음
            // 회원 정보 변경 성공 시 성공 메시지를 세션에 저장하고 리다이렉트
            session.setAttribute("alertMsg", "성공적으로 회원정보가 저장되었습니다.");
            session.setAttribute("loginUser", u);
            request.getRequestDispatcher("/views/taste/taste1_1.jsp").forward(request, response);
        } else {
            // 회원 정보 변경 실패 시 실패 메시지를 request에 저장하고 포워딩
            request.setAttribute("msg", "닉네임 또는 프로필 이미지 변경 실패");
            request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
        }
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
