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
		request.setCharacterEncoding("utf-8");

        // 폼에서 넘어온 값 받기
        String userId = request.getParameter("userid");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String userNick = request.getParameter("userNick");

        // 파일 업로드 처리
        Part filePart = request.getPart("profileImage");
        String fileName = null;
        if (filePart != null && filePart.getSize() > 0) {
            fileName = extractFileName(filePart);
            String uploadPath = getServletContext().getRealPath("/") + "upload/";
            File file = new File(uploadPath + fileName);
            filePart.write(file.getAbsolutePath());
        }

        // User 객체 생성 및 수정할 값 설정
        User user = new User();
        user.setUserId(userId);
        user.setUserNick(userNick);
        user.setEmail(email);
        user.setPhone(phone);

        // 파일이 업로드된 경우 경로 설정
        if (fileName != null) {
            user.setFilePath("upload/" + fileName);
        }

        // Service 호출하여 DB 업데이트 처리
        UserService userService = new UserService();
        int result = userService.updateUser(user);

        if (result > 0) {
            // 수정된 정보를 세션에 반영
            HttpSession session = request.getSession();
            session.setAttribute("loginUser", user);
            request.setAttribute("msg", "회원 정보가 성공적으로 수정되었습니다.");
            request.getRequestDispatcher("/views/account/modifyUser.jsp").forward(request, response);
        } else {
            request.setAttribute("msg", "회원 정보 수정에 실패하였습니다.");
            request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
        }
    }

    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String token : contentDisposition.split(";")) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return null;
    }
    


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
