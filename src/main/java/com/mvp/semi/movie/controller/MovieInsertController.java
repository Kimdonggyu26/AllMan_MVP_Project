package com.mvp.semi.movie.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvp.semi.common.model.vo.Attachment;
import com.mvp.semi.common.utils.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MovieInsertController
 */
@WebServlet("/movieInsert.mi")
public class MovieInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String savePath = request.getServletContext().getRealPath("/resources/movie_upfiles/");
		
		int maxSize = 10 * 1024 * 1024;	
		
		MultipartRequest multiRequest 
		= new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		
		
		// 영화 번호 (시퀀스)
		String movieTitle = multiRequest.getParameter("movie-title");
		String movieContent = multiRequest.getParameter("movie-content");
		// 장르
//		int playTime = Integer.parseInt(multiRequest.getParameter("playtime"));
		String country = multiRequest.getParameter("country");
		String ageLv = multiRequest.getParameter("age-level");
		String openDate = multiRequest.getParameter("open-date");
		String director = multiRequest.getParameter("director");
//		int audienceCount = Integer.parseInt(multiRequest.getParameter("audience"));
		String actor = multiRequest.getParameter("actor");
		String preview = multiRequest.getParameter("preview");
		String status = multiRequest.getParameter("movie-status");
		String titlePath = multiRequest.getFilesystemName("title-image");
		String contentPath = multiRequest.getFilesystemName("content-image");
//		int grade = Integer.parseInt(multiRequest.getParameter("grade"));
		String taste = multiRequest.getParameter("taste");
		
		
		System.out.println(movieTitle + movieContent +  country + ageLv + openDate + director +  actor + preview + status + titlePath + contentPath + taste);
		
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
