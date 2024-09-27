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
		/*
		 * request.setCharacterEncoding("utf-8");
		 * 
		 * // 세션에서 사용자 정보 가져오기 HttpSession session = request.getSession(); String userId
		 * = request.getParameter("userId"); String userNick =
		 * request.getParameter("usernick");
		 * 
		 * // 파일 업로드를 위한 경로 설정 String savePath =
		 * request.getServletContext().getRealPath("/resources/user_upfiles"); int
		 * maxSize = 10 * 1024 * 1024; // 최대 10MB 파일 사이즈
		 * 
		 * // 파일 업로드 처리 MultipartRequest multiRequest = new MultipartRequest( request,
		 * savePath, maxSize, "utf-8", new MyFileRenamePolicy() );
		 * 
		 * // 업로드된 파일 이름과 경로 가져오기 String fileName =
		 * multiRequest.getFilesystemName("profileImage"); String filePath = savePath +
		 * File.separator + fileName;
		 * 
		 * // 사용자 객체 생성 User u = new User(); u.setUserId(userId);
		 * u.setUserNick(userNick); u.setFilePath("/resources/user_upfiles/" +
		 * fileName); // 프로필 이미지 경로 설정
		 * 
		 * // 닉네임 및 프로필 이미지 업데이트 처리 int result = new UserService().updateUserProfile(u);
		 * 
		 * // 결과 처리 if (result > 0) { // 성공하면 세션에 업데이트된 사용자 정보 저장
		 * session.setAttribute("loginUser", u); session.setAttribute("alertMsg",
		 * "성공적으로 회원정보가 변경되었습니다."); response.sendRedirect(request.getContextPath() +
		 * "/views/DG/mainPage.jsp"); } else { request.setAttribute("msg",
		 * "닉네임 또는 프로필 이미지 변경 실패");
		 * request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request,
		 * response); }
		 */
		/*
		 * request.setCharacterEncoding("utf-8");
		 * 
		 * // 세션에서 사용자 정보 가져오기 HttpSession session = request.getSession(); String userId
		 * = request.getParameter("userId"); String userNick =
		 * request.getParameter("usernick"); String userNick =
		 * request.getParameter("usernick"); if (userNick == null || userNick.isEmpty())
		 * { System.out.println("닉네임이 전달되지 않음"); } else { System.out.println("전달된 닉네임: "
		 * + userNick); } // 파일 업로드를 위한 경로 설정 String savePath =
		 * request.getServletContext().getRealPath("/resources/user_upfiles"); int
		 * maxSize = 10 * 1024 * 1024; // 최대 10MB 파일 사이즈
		 * 
		 * // 파일 업로드 처리 MultipartRequest multiRequest = new MultipartRequest( request,
		 * savePath, maxSize, "utf-8", new MyFileRenamePolicy() );
		 * 
		 * // 업로드된 파일 이름과 경로 가져오기 String fileName =
		 * multiRequest.getFilesystemName("profileImage"); String fileName =
		 * multiRequest.getFilesystemName("profileImage"); if (fileName == null ||
		 * fileName.isEmpty()) { System.out.println("업로드된 파일 없음"); } else {
		 * System.out.println("업로드된 파일 이름: " + fileName); } String filePath =
		 * "/resources/user_upfiles/" + fileName; // 상대 경로
		 * 
		 * // 사용자 객체 생성 User u = new User(); u.setUserId(userId);
		 * u.setUserNick(userNick); u.setFilePath(filePath); // 프로필 이미지 경로 설정
		 * 
		 * // 닉네임 및 프로필 이미지 업데이트 처리 int result = new UserService().updateUserProfile(u);
		 * 
		 * // 결과 처리 if (result > 0) { // 성공하면 세션에 업데이트된 사용자 정보 저장
		 * session.setAttribute("loginUser", u); session.setAttribute("alertMsg",
		 * "성공적으로 회원정보가 변경되었습니다."); // 메시지를 세션에 저장하고 리다이렉트하여 GET 요청으로 변경
		 * response.sendRedirect(request.getContextPath() + "/views/DG/mainPage.jsp"); }
		 * else { // 실패 시 요청 속성에 실패 메시지 저장하고 포워딩 request.setAttribute("msg",
		 * "닉네임 또는 프로필 이미지 변경 실패");
		 * request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request,
		 * response); }
		 */
		/*
		 * request.setCharacterEncoding("utf-8");
		 * 
		 * String userId = request.getParameter("userId");
		 * 
		 * String userNick = request.getParameter("usernick"); HttpSession session =
		 * request.getSession();
		 * 
		 * 
		 * 
		 * System.out.println(userNick);
		 * 
		 * User u = new User(); u.setUserId(userId); u.setUserNick(userNick);
		 * 
		 * int result = new UserService().updatenick(u);
		 * 
		 * 
		 * 
		 * if(result < 0) { request.setAttribute("msg","닉네임 변경 실패");
		 * request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request,
		 * response); }else { HttpSession session = request.getSession();
		 * session.setAttribute("loginUser", userNick);
		 * 
		 * 
		 * session.setAttribute("alerMsg", "성공적으로 회원정보를 변경되었습니다");
		 * 
		 * response.sendRedirect(request.getContextPath() + "/views/DG/mainPage.jsp"); }
		 * 
		 * String savePath =
		 * request.getServletContext().getRealPath("/resources/user_upfiles");
		 * 
		 * 
		 * int maxSize = 10 * 1024 * 1024;
		 * 
		 * MultipartRequest multiRequest = new MultipartRequest(request, savePath,
		 * maxSize, "utf-8", new MyFileRenamePolicy());
		 * 
		 * String userprofile = multiRequest.getParameter("profile");
		 * u.setUserprofile(userprofile);
		 */
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
            session.setAttribute("alertMsg", "성공적으로 회원정보가 변경되었습니다.");
            request.getRequestDispatcher("/views/account/modifyUser.jsp").forward(request, response);
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
