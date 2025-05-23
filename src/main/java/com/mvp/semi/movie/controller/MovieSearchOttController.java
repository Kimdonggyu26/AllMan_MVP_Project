package com.mvp.semi.movie.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mvp.semi.common.model.vo.PageInfo;
import com.mvp.semi.movie.model.service.MovieService;
import com.mvp.semi.movie.model.vo.Movie;

/**
 * Servlet implementation class MovieMainPageController
 */
@WebServlet("/ottSearch.ms")
public class MovieSearchOttController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MovieSearchOttController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String searchData = request.getParameter("search");// 타입: String

		System.out.println("OTT " + searchData);
		
		int listCount = new MovieService().selectOttMovieList(searchData);
		System.out.println("OTT Count : " + listCount);
		int currentPage = 1;

		if (request.getParameter("ottPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("ottPage"));
		}

		int pageLimit = 10;

		int boardLimit = 10;

		int maxPage = (int) Math.ceil((double) listCount / boardLimit);

		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

		int endPage = startPage + pageLimit - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

		List<Movie> list = new MovieService().selectOttMovieList(pi, searchData);
		
		Map<String, Object> responseData = new HashMap<>();
		
		responseData.put("ottPageInfo", pi);
		responseData.put("ottMovieList", list);
		
		

		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(responseData, response.getWriter());
		
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
