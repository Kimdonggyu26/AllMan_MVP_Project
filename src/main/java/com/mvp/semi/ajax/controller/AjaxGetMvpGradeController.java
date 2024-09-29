package com.mvp.semi.ajax.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvp.semi.ca.review.model.service.ReviewService;

/**
 * Servlet implementation class AjaxGetMvpGradeController
 */
@WebServlet("/mvpGrade.mg")
public class AjaxGetMvpGradeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxGetMvpGradeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        request.setCharacterEncoding("UTF-8");

		int movieNo = Integer.parseInt(request.getParameter("movieNo"));
		
		ReviewService rvService = new ReviewService();
		
		double mvpGrade = rvService.mvpGrade(movieNo);
		
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");

	    // JSON 형태로 mvpGrade 값을 응답으로 보냄
	    response.getWriter().write("{\"mvpGrade\": " + mvpGrade + "}");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
