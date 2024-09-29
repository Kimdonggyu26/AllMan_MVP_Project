package com.mvp.semi.movie.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvp.semi.movie.model.service.MovieService;
import com.mvp.semi.movie.model.vo.Movie;

/**
 * Servlet implementation class ShowDetail
 */
@WebServlet("/showDetail.sd")
public class ShowDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int movieNo = Integer.parseInt(request.getParameter("movieNo"));
			    
		
		MovieService mvService = new MovieService();
		Movie mv = mvService.showDetail(movieNo);
		
		//System.out.println(mv.getMovieTitle());
		
		if(mv == null) {
			request.setAttribute("alertMsg", "존재하지 않거나 삭제된 영화입니다.");
			request.getRequestDispatcher("/views/commmon/errorPage.jsp").forward(request, response);
		}else {
			
			HttpSession session = request.getSession();   
			session.setAttribute("movie", mv);
	    	request.getRequestDispatcher("views/movieMain/detailPage.jsp").forward(request, response);
	    	
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
