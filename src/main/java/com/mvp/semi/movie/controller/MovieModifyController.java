package com.mvp.semi.movie.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvp.semi.common.utils.MyFileRenamePolicy;
import com.mvp.semi.movie.model.service.MovieService;
import com.mvp.semi.movie.model.vo.Movie;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MovieModify
 */
@WebServlet("/movieModify.mm")
public class MovieModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieModifyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 영화 수정
		String savePath = request.getServletContext().getRealPath("/resources/movie_upfiles");
		
		int maxSize = 10 * 1024 * 1024;	
		
		MultipartRequest multiRequest 
		= new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		int movieNo = Integer.parseInt(multiRequest.getParameter("no"));
		
		request.setCharacterEncoding("utf-8");
		
		
		
		HttpSession session = request.getSession();	
		
		String movieTitle = multiRequest.getParameter("movie-title");
		String movieContent = multiRequest.getParameter("movie-content");
		String[] genreArr = multiRequest.getParameterValues("genre"); // ["액션", "SF"]
		String genre = String.join(",", genreArr); // "액션,SF"
		
		int playTime = Integer.parseInt(multiRequest.getParameter("playtime"));
		String country = multiRequest.getParameter("country");
		String ageLv = multiRequest.getParameter("age-level");
		String openDate = multiRequest.getParameter("open-date");
		String director = multiRequest.getParameter("director");
		int audienceCount = Integer.parseInt(multiRequest.getParameter("audience"));
		String actor = multiRequest.getParameter("actor");
		String preview = multiRequest.getParameter("preview");
		String status = multiRequest.getParameter("movie-status");
		String titlePath = "/resources/movie_upfiles/" + multiRequest.getFilesystemName("title-image");
		String contentPath = "/resources/movie_upfiles/" +  multiRequest.getFilesystemName("content-image");
		double grade = Double.parseDouble(multiRequest.getParameter("grade"));
		int tasteNo = Integer.parseInt(multiRequest.getParameter("taste"));
		
		Movie m = new Movie();
		m.setMovieTitle(movieTitle);
		m.setMovieContent(movieContent);
		m.setGenre(genre);
		m.setPlayTime(playTime);
		m.setCountry(country);
		m.setAgeLv(ageLv);
		m.setOpenDate(openDate);
		m.setDirector(director);
		m.setAudienceCount(audienceCount);
		m.setActor(actor);
		m.setPreview(preview);
		m.setStatus(status);
		m.setTitlePath(titlePath);
		m.setContentPath(contentPath);
		m.setGrade(grade);
		m.setTasteNo(tasteNo);
		
		int result = new MovieService().modifyMovie(m, movieNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "수정 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/views/adminPage/adminMainPage.jsp");
		}else {
			session.setAttribute("alertMsg", "영화 수정에 실패하였습니다. 다시 시도해주세요.");
			response.sendRedirect(request.getContextPath() + "/views/adminPage/adminMainPage.jsp");
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
