package com.mvp.semi.movie.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvp.semi.ca.review.model.vo.Review;
import com.mvp.semi.movie.model.service.MovieService;
import com.mvp.semi.movie.model.vo.Movie;

/**
 * Servlet implementation class MovieCompareListController
 */
@WebServlet("/compare.li")
public class MovieCompareListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieCompareListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 전송된 영화 번호 리스트 가져오기
        String[] movieNos = request.getParameterValues("movieNo");
        
        // 영화 번호로 영화 정보를 조회하는 로직 (DB에서 조회)
        List<Movie> selectedMovies = new ArrayList<>();
        for (String movieNo : movieNos) {
            Movie movie = MovieService.CompareMvNo(movieNo); // 영화 서비스에서 영화 정보 조회
            selectedMovies.add(movie);
        }

        // 영화 리스트를 request에 저장
        request.setAttribute("selectedMovies", selectedMovies);

        // 비교 페이지로 이동
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/movieCompare.jsp");
        dispatcher.forward(request, response);
        List<Movie> mvlist = new ArrayList<>();
        List<Review> rlist = new ArrayList<>();
        for (String movieNo : movieNos) {
            Movie movie = new MovieService().compareList(Integer.parseInt(movieNo)); // 영화 서비스에서 영화 정보 조회
            mvlist.add(movie);
        }
        
        for(String movieNo : movieNos) {
            Review review = new MovieService().mvReview(Integer.parseInt(movieNo));
            rlist.add(review);
        }
        
        

        // 영화 리스트를 request에 저장
        request.setAttribute("list", mvlist);
        request.setAttribute("review", rlist);
        
        System.out.println(rlist);
  

        // 비교 페이지로 이동
        request.getRequestDispatcher("/views/movieMain/comparePage.jsp").forward(request, response);
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
