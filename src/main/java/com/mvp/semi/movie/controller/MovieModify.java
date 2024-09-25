package com.mvp.semi.movie.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvp.semi.movie.model.service.MovieService;

/**
 * Servlet implementation class MovieModify
 */
@WebServlet("/movieModify.mm")
public class MovieModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieModify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int movieNo = Integer.parseInt(request.getParameter("movieNo"));
		MovieService mvService = new MovieService();
		
//		Map <String, Object> map = mvService.selectMovieByNo(movieNo);
//		
//		if(map.get("mv") == null) {
//			request.setAttribute("alertMsg", "실패");
//			
//		} else {
//			request.setAttribute("map", map);
//			request.getRequestDispatcher("/views/DG/adminMainPage.jsp");
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
