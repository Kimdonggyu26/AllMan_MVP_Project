package com.mvp.semi.ajax.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mvp.semi.movie.model.service.MovieService;
import com.mvp.semi.movie.model.vo.Movie;

//	관리자 페이지의 영화 리스트에서 하나 클릭 시 해당 영화의 정보를 보여주는 컨트롤러


/**
 * Servlet implementation class AjaxMovieSelectController
 */
@WebServlet("/movieSelect.ms")
public class AjaxMovieSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMovieSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 관리자 화면 - 영화 리스트 중 하나 클릭 시 해당 영화의 번호를 토대로 정보를 조회 해오는 기능
		
		int movieNo = Integer.parseInt(request.getParameter("movieNo"));
		
		System.out.println(movieNo);
		
		MovieService mvService = new MovieService();
		
		Movie mv = mvService.selectMovieByNo(movieNo);
		
		System.out.println(mv);
		System.out.println(mv.getMovieTitle());
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(mv, response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
