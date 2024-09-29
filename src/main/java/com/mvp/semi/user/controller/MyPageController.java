package com.mvp.semi.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.mvp.semi.board.model.service.FBoardService;
import com.mvp.semi.board.model.service.TBoardService;
import com.mvp.semi.board.model.vo.Board;
import com.mvp.semi.common.model.vo.PageInfo;
import com.mvp.semi.cs.inquiry.model.service.InquiryService;
import com.mvp.semi.cs.inquiry.model.vo.Inquiry;
import com.mvp.semi.movie.model.service.MovieService;
import com.mvp.semi.movie.model.vo.Movie;
import com.mvp.semi.user.model.vo.User;

/**
 * Servlet implementation class MyPageController
 */
@WebServlet("/mypage.us")
public class MyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 메뉴바에 있는 메뉴 클릭시    /list.bo						=> 1번 페이지 요청
		// 목록페이지의 페이징바 클릭시 /list.bo?page=클릭한페이지번호  => 클릭한 페이지 요청
		
		// ------------- 페이징 처리 -------------
		// * listCount 	 : 현재 게시글 총 갯수 (db로부터 조회)
		int listCount = new TBoardService().selectTBoardListCount();
		// * currentPage : 사용자가 요청한 페이지 번호 (요청시 전달됨|전달된게 없으면 1로 간주)
		int currentPage = 1;
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		// * pageLimit   : 페이징바의 목록 수 (몇개 단위씩 보여지게 할건지)
		int pageLimit = 5;
		// * boardLimit  : 한 페이지에 보여질 게시글 수 (몇개 단위씩 보여지게 할건지)
		int boardLimit = 5;
		
		

		int maxPage = (int)Math.ceil( (double)listCount / boardLimit );
		
		/*
	
		 */
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		/*

		 */
		int endPage = startPage + pageLimit - 1;
	
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		int ottPage = 1;
		 if (request.getParameter("ottPage") != null) {
	            ottPage = Integer.parseInt(request.getParameter("ottPage"));
	        }

	        int itemsPerPage = 4;  // 페이지당 영화 4개씩 표시
	        MovieService movieService = new MovieService();
	        List<Movie> ottMovies = movieService.getOttMoviesByPage(ottPage, itemsPerPage);

	        response.setContentType("application/json");
	        PrintWriter out = response.getWriter();
	        out.print(new Gson().toJson(ottMovies));
	        out.flush();
	        HttpSession session = request.getSession();
	        User loginUser = (User) session.getAttribute("loginUser");
		// * 페이징바를 제작하기 위한 데이터 => PageInfo vo 객체
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		String userId = loginUser.getUserId();
		// * 사용자가 요청한 페이지상에 필요한 게시글 데이터 조회
		List<Board> list = new TBoardService().selectTBoardList(pi);
		InquiryService inquiryService = new InquiryService();
	    List<Inquiry> inquiries = inquiryService.getUserInquiries(userId);

	        request.setAttribute("list", list);
	        request.setAttribute("inquiries", inquiries);
		// 응답페이지 : 일반게시글 목록페이지 (/views/board/boardList.jsp)
		// 응답데이터 : 페이징바 제작할 데이터, 게시글 데이터 
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
	    request.setAttribute("ottMovies", ottMovies);  // OTT 영화 리스트 추가
        if (request.getParameter("page") != null) {
            currentPage = Integer.parseInt(request.getParameter("page"));
        }



		
		/*
		 * request.getRequestDispatcher("/views/board/boardList.jsp").forward(request,
		 * response);
		 */

	        // JSP로 포워딩
	        request.getRequestDispatcher("/views/account/MyPage.jsp").forward(request, response);
	    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	    }	



