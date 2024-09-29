package com.mvp.semi.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.mvp.semi.ca.favorites.model.service.FavoritesService;

/**
 * Servlet implementation class AjaxMovieLikeController
 */
@WebServlet("/likeMovie.lm")
public class AjaxMovieLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMovieLikeController() {
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
        
        int alreadyLiked = fvService.checkMovieLiked(userNo, movieNo); // 중복 체크 메소드
        System.out.println("already: " + alreadyLiked);
        
        int result;
        
        if(alreadyLiked == 0) {
        	
        	 result = fvService.insertMovieLike(userNo, movieNo); // 좋아요 등록 메소드
        	
        }else {
        	
        	 result = fvService.deleteMovieLike(userNo, movieNo); // 좋아요 취소(삭제) 메소드
        }
        
        JSONObject jsonResponse = new JSONObject();
        
        jsonResponse.put("alreadyLiked", alreadyLiked);
        jsonResponse.put("result", result);

        
        response.getWriter().print(jsonResponse.toString());

        
	}
        

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
