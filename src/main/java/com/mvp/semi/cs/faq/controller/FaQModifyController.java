package com.mvp.semi.cs.faq.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvp.semi.cs.faq.model.service.FaQService;
import com.mvp.semi.cs.faq.model.vo.FaQ;


/**
 * Servlet implementation class FaQModifyController
 */
@WebServlet("/modify.faq")
public class FaQModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaQModifyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int faqNo = Integer.parseInt(request.getParameter("no")); // 수정할 글 번호
		FaQ n = new FaQService().selectFaQByNo(faqNo);
		
		request.setAttribute("n", n);
		request.getRequestDispatcher("/views/GW/cs/faq/faqModify.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
