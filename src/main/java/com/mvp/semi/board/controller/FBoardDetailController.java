package com.mvp.semi.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvp.semi.board.model.service.FBoardService;
import com.mvp.semi.board.model.vo.Board;

/**
 * Servlet implementation class FBoardDetailController
 */
@WebServlet("/detail.fbo")
public class FBoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FBoardDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int fBoardNo = Integer.parseInt(request.getParameter("no"));
		
		Board b =new FBoardService().selectFBoardByNo(fBoardNo);
		
		if(b == null ) {
			request.setAttribute("msg", "존재하지 않는 게시글이거나 삭제된게시글입니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}else {
			// 응답페이지 : 상세페이지 (/views/board/boardDetail.jsp)
			// 응답데이터 : 조회할 게시글 데이터, 첨부파일 데이터 (db로 부터 조회)
			request.setAttribute("b", b);
			request.getRequestDispatcher("/views/GW/board/fBoardDetail.jsp").forward(request, response);
			
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
