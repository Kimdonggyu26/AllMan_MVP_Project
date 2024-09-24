package com.mvp.semi.movie.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvp.semi.movie.model.service.MovieService;
import com.mvp.semi.movie.model.vo.Movie;


/**
 * Servlet implementation class MovieSearch
 */
@WebServlet("/movieSearch.ms")
public class MovieSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//검색에 영화, 감독, 배우, 장르
		
		String searchData = request.getParameter("movieSearchData");
		
		// 넘겨받아야되는 데이터
		// 1. 사용자가 입력했던 검색ㄷ어
		// 2. 상영영화중 몇번페이지 요청인지 페이지번호
		// 3. ott영화중 몇번페이지 요청인지 페이지번호 
		
		
		
		
		// 응답해야되는 데이터
		// 1. 요청한 상영영화 페이지의 목록리스트, 상영영화용 PageInfo 객체
		// 2. 요청한 ott영화 페이지의 목록리스트, ott영화용 PageInfo 객체
		 
		Map<String, Object> map = new MovieService().searchMovieList(searchData);
		
		System.out.println(map.get("mv"));
//		ajax
		if(map.get("mv") == null) {
			//응답페이지 : 에러페이지
			//파일이 없으면 메인페이지에 "검색 결과 없다고 text만 출력"
			request.getRequestDispatcher("/views/common/errorPage.jsp");
		}else {
			request.setAttribute("map", map);
			request.getRequestDispatcher("/views/movieMain/mainPage.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
