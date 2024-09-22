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
 * Servlet implementation class FaQUpdateController
 */
@WebServlet("/update.faq")
public class FaQUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaQUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		FaQ f = new FaQ();
		f.setFaqTitle(request.getParameter("title"));
		f.setFaqContent(request.getParameter("content"));
		f.setFaqNo(Integer.parseInt(request.getParameter("no")));
		
		int result = new FaQService().updateFaQ(f);
		
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "성공적으로 공지사항이 수정되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.faq");
			
			
		}else {
			request.setAttribute("msg", "공지사항 변경 실패");
			request.getRequestDispatcher("/view.common/errorPage.jsp").forward(request, response);
			
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
