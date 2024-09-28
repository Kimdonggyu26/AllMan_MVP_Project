package com.mvp.semi.ajax.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvp.semi.ca.likes.model.service.LikesService;

/**
 * Servlet implementation class AjaxReviewLikeController
 */
@WebServlet("/likeReview.lr")
public class AjaxReviewLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReviewLikeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        
        Integer userNo = (Integer)session.getAttribute("userNo");
        int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
        
        if (userNo == null) {
        	session.setAttribute("alertMsg", "로그인 후 이용 가능합니다. 로그인 화면으로 이동합니다.");
        	response.sendRedirect(request.getContextPath() + "/views/account/login.jsp");
        }

        LikesService lService = new LikesService();
        
        int result = lService.insertLike(userNo, reviewNo);
        
	} 

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
