package com.mvp.semi.cs.inquiry.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvp.semi.cs.inquiry.model.service.InquiryService;


/**
 * Servlet implementation class InquiryModifyController
 */
@WebServlet("/modify.iq")
public class InquiryModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryModifyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int iqNo = Integer.parseInt(request.getParameter("no")); // 수정할 글 번호
		InquiryService iService = new InquiryService();
		
		// 게시글데이터, 첨부파일데이터
		Map<String, Object> map = iService.selectInquiryByNo(iqNo);
		
		// 응답페이지 : 수정페이지 (/views/board/boardModify.jsp)
		// 응답데이터 : 카테고리목록, 게시글데이터, 첨부파일데이터
		if(map.get("i") == null) {
			request.setAttribute("msg", "존재하지 않는 게시글이거나 삭제된 게시글입니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}else {
			request.setAttribute("map", map);
			request.getRequestDispatcher("/views/GW/cs/inquiry/inquiryModify.jsp").forward(request, response);
			
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
