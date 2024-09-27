package com.mvp.semi.ajax.controller;

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
 * Servlet implementation class AjaxMovieListController
 */
@WebServlet("/ott.mv")
public class AjaxOttMovieListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxOttMovieListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String genre = request.getParameter("genre");
		String keyword = request.getParameter("keyword");
		
        Map<String, String> searchData = new HashMap<>();
        searchData.put("startDate", startDate);
        searchData.put("endDate", endDate);
        searchData.put("genre", genre);
        searchData.put("keyword", keyword);
		
		 System.out.println("시작일 : " + startDate + "종료일 : " + endDate + "장르 : " + genre + "키워드 : " + keyword);

		// 관리자 화면(영화 관리)에서 'OTT영화' 탭 클릭시 조회되는 영화 리스트


		int listCount = new MovieService().selectAllOttMovieList(searchData);
		
		int currentPage = 1;
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		int pageLimit = 10;
		int boardLimit = 12;
		
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage -1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		List<Movie> list = new MovieService().selectPagingOttMovieList(pi, searchData);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pi", pi);
		map.put("list", list);
		
		   response.setContentType("application/json; charset=UTF-8");
		   new Gson().toJson(map, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
