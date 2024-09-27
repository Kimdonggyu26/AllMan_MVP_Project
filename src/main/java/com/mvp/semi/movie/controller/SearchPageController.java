package com.mvp.semi.movie.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchPageController
 */
@WebServlet("/searchPage.mv")
public class SearchPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//천예찬
		//header.jsp에 있는 검색 요청시 searchPage.jsp로 데이터 전송
		String searchData = "";
		searchData = request.getParameter("search");//타입: String
		
		
		System.out.println("#" + searchData);
		
		request.setAttribute("searchData", searchData);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("views/movieMain/searchPage.jsp");
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
