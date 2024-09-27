package com.mvp.semi.movie.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvp.semi.movie.model.service.MovieService;

/**
 * Servlet implementation class MovieDeleteController
 */
@WebServlet("/movieDelete.md")
public class MovieDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();	
		
		String[] deleteNumArr = request.getParameterValues("movieNo");
		String allNum = String.join(",", deleteNumArr);
		System.out.println(allNum);
		int result = new MovieService().deleteMovie(allNum);
		
		if(result == deleteNumArr.length) {
			
			session.setAttribute("alertMsg", "선택하신" + result + "개의 영화가 모두 삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/views/adminPage/adminMainPage.jsp");
			
		}else if(result > 0 && deleteNumArr.length > result) {
			
			session.setAttribute("alertMsg", "선택하신 영화 중" + result + "개의 영화가 삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/views/adminPage/adminMainPage.jsp");
			
		}else {
			session.setAttribute("alertMsg", "삭제에 실패하였습니다. 다시 시도해주세요.");
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
