package com.mvp.semi.ajax.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mvp.semi.ca.review.model.service.ReviewService;

/**
 * Servlet implementation class AjaxInsertReviewController
 */
@WebServlet("/insertReview.ir")
public class AjaxInsertReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxInsertReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        request.setCharacterEncoding("UTF-8");
        
        //int userNo =Integer.parseInt(request.getParameter("userNo"));
        
        int movieNo = Integer.parseInt(request.getParameter("movieNo"));
        int userNo = 1; // 임의로 부여
        String reviewContent = request.getParameter("review");
        int rate = Integer.parseInt(request.getParameter("rate"));
	
        ReviewService rvService = new ReviewService();
        
        int result = rvService.insertReview(userNo, reviewContent, rate, movieNo);
        

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
