package com.mvp.semi.movie.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mvp.semi.board.model.service.FBoardService;
import com.mvp.semi.common.model.vo.PageInfo;
import com.mvp.semi.movie.model.service.MovieService;
import com.mvp.semi.movie.model.vo.Movie;


/**
 * Servlet implementation class MovieSearch
 */
@WebServlet("/movieSearch.ms")
public class MovieListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//앞에서 상영영화인지 OTT인지 비교하는 구문 필요할듯? 그럼 뒤에 서비스 DB는 똑같으니깐
//		if ("showing".equals(category)) {
//		    listCount = new MovieService().selectShowingMovieList();
//		} else if ("ott".equals(category)) {
//		    listCount = new MovieService().selectOTTMovieList();
//		}
		
		String searchData = request.getParameter("search");//타입: String
		
		int listCount = new MovieService().selectShowingMovieList();
		
		int currentPage = 1;
		
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		int pageLimit = 10;
		
		int boardLimit = 10;
		
		
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		int endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		List<Movie> list = new MovieService().selectMovieList(pi, searchData);
		
		
		System.out.println("list값 : " + list);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/movieMain/searchPage.jsp").forward(request, response);
		
//		response.setContentType("application/json; charset=UTF-8");
//		new Gson().toJson(list, response.getWriter());
//		String searchData = request.getParameter("movieSearchData");
//		
//		// 넘겨받아야되는 데이터
//		// 1. 사용자가 입력했던 검색ㄷ어
//		// 2. 상영영화중 몇번페이지 요청인지 페이지번호
//		// 3. ott영화중 몇번페이지 요청인지 페이지번호 
//		
//		
//		
//		
//		// 응답해야되는 데이터
//		// 1. 요청한 상영영화 페이지의 목록리스트, 상영영화용 PageInfo 객체
//		// 2. 요청한 ott영화 페이지의 목록리스트, ott영화용 PageInfo 객체
//
//		System.out.println(searchData);
//		
//		List<Movie> map = new MovieService().searchMovieList(searchData);
//		
////		ajax
//		if(map.get("mv") == null) {
//			//응답페이지 : 에러페이지
//			//파일이 없으면 메인페이지에 "검색 결과 없다고 text만 출력"
//			request.getRequestDispatcher("/views/common/errorPage.jsp");
//		}else {
//			request.setAttribute("map", map);
//			request.getRequestDispatcher("/views/movieMain/mainPage.jsp").forward(request, response);
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
