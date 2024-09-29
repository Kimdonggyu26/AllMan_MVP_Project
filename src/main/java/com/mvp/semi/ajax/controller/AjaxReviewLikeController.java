package com.mvp.semi.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
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
        
        int userNo = 1; // 임의로 부여
        //Integer userNo = (Integer)session.getAttribute("userNo");
        int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
        

        LikesService lService = new LikesService();
        
        int result = lService.insertLike(userNo, reviewNo);
        
        int likeCount = lService.likeCount(reviewNo);
        
        response.setContentType("application/json; charset=utf-8");
        PrintWriter out = response.getWriter();
        
        // JSON 객체 생성
		response.setContentType("application/json; charset=UTF-8");
		// Gson객체.toJson(응답할데이터(자바객체), 스트림객체);
		new Gson().toJson(likeCount, response.getWriter());
	} 

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
