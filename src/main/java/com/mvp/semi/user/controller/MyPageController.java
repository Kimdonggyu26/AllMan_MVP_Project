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
		HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");
		// * 페이징바를 제작하기 위한 데이터 => PageInfo vo 객체
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		String userId = loginUser.getUserId();
		// * 사용자가 요청한 페이지상에 필요한 게시글 데이터 조회
		InquiryService inquiryService = new InquiryService();
	    List<Inquiry> inquiries = inquiryService.getUserInquiries(userId);
	    // userId가 잘 들어왔는지 확인하기 위한 출력
        System.out.println("User ID: " + userId);  // 로그 확인
	    request.setAttribute("inquiries", inquiries);
		// 응답페이지 : 일반게시글 목록페이지 (/views/board/boardList.jsp)
		// 응답데이터 : 페이징바 제작할 데이터, 게시글 데이터 
		request.setAttribute("pi", pi);
		
		System.out.println(inquiries);

		// JSP로 포워딩
		request.getRequestDispatcher("/views/account/mypage.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	    }	



