package com.mvp.semi.ajax.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mvp.semi.board.model.service.FBoardService;
import com.mvp.semi.board.model.service.TBoardService;
import com.mvp.semi.board.model.vo.Board;
import com.mvp.semi.common.model.vo.PageInfo;

/**
 * Servlet implementation class AjaxNDHESearchController
 */
@WebServlet("/ndhe.mv")
public class AjaxNDHESearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxNDHESearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int searchField = Integer.parseInt(request.getParameter("searchField"));
		String searchtext = request.getParameter("searchText");
		
		System.out.println(searchField);
					
		int listCount = new TBoardService().TBoarNDHEConut(searchtext, searchField);
		// * currentPage : 사용자가 요청한 페이지 번호 (요청시 전달됨 | 전달된게 없으면 1로 간주) 
		int currentPage = 1;
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		// * pageLimit	: 페이징바의 목록 수 (몇개 단위씩 보여지게 할건지)
		int pageLimit = 10;
		// * boardLimit : 한 페이지에 보여질 게시글 수 (몇개 단위씩 보여지게 할건지)
		int boardLimit = 9;
		
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		int endPage = startPage + pageLimit -1;
		// 단, 위의 과정으로 구해진 endPage가 maxPage보다 클 경우 수정
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);	
		
		
		List<Board> list = new TBoardService().TboardSaerchNDHE(searchtext, pi, searchField);
		
		response.setContentType("application/json; charset=utf-8");
		
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("pi", pi);    // 페이지 정보
        resultMap.put("list", list);  // 댓글 목록
        
        Gson gson = new Gson();
        gson.toJson(resultMap, response.getWriter());
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
