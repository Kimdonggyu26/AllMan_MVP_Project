package com.mvp.semi.ajax.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvp.semi.ca.favorites.model.service.FavoritesService;

/**
 * Servlet implementation class AjaxCheckedMovieLikeController
 */
@WebServlet("/checkLike.cl")
public class AjaxCheckedMovieLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCheckedMovieLikeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=utf-8");    
        
        int userNo = Integer.parseInt(request.getParameter("userNo"));
        int movieNo = Integer.parseInt(request.getParameter("movieNo"));
        
        
        FavoritesService fvService = new FavoritesService();
        
        int alreadyLiked = fvService.checkMovieLiked(userNo, movieNo); // 
		
        response.getWriter().print(alreadyLiked);
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
