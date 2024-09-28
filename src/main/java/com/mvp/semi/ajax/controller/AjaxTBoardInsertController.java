package com.mvp.semi.ajax.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvp.semi.board.model.service.FBoardService;
import com.mvp.semi.board.model.service.TBoardService;
import com.mvp.semi.board.model.vo.Board;

/**
 * Servlet implementation class AjaxTBoardInsertController
 */
@WebServlet("/tbinsert.tbo")
public class AjaxTBoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxTBoardInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		int boardType =  Integer.parseInt(request.getParameter("boardType"));
		int movieNo = Integer.parseInt(request.getParameter("movieNo"));
		
		if(boardType == 0) {
			
			Board b = new Board();
			b.setUserId(String.valueOf(userNo));
			b.setBoardTitle(boardTitle);
			b.setBoardContent(boardContent);
			b.setBoardType(boardType);
			b.setMovieTitle(String.valueOf(movieNo));
			
			int result = new FBoardService().insertFBoard(b);
			
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().print(result);
			
		}else {
			
			Board b = new Board();
			b.setUserId(String.valueOf(userNo));
			b.setBoardTitle(boardTitle);
			b.setBoardContent(boardContent);
			b.setTasteNo(boardType);
			b.setMovieTitle(String.valueOf(movieNo));
			
			int result = new TBoardService().insertTBoard(b);
			
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().print(result);
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
