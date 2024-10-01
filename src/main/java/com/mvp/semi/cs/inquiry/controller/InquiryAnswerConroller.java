package com.mvp.semi.cs.inquiry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvp.semi.cs.inquiry.model.service.InquiryService;
import com.mvp.semi.cs.inquiry.model.vo.Inquiry;
import com.mvp.semi.user.model.vo.User;

/**
 * Servlet implementation class InquiryAnswerConroller
 */
@WebServlet("/inquiry.as")
public class InquiryAnswerConroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryAnswerConroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String inquiryContent = request.getParameter("replyContent");
		int inquiryNo = Integer.parseInt(request.getParameter("inquiryNo"));
		
		HttpSession session = request.getSession();
		String inquiryWriter = ((User)session.getAttribute("loginUser")).getUserNick();
		
		Inquiry i = new Inquiry();	
		i.setInquiryNo(inquiryNo);
		i.setReplyContent(inquiryContent);
		i.setUserNickname(inquiryWriter);
		
		int result = new InquiryService().answerInquiry(i);
		
		// 2. 응답
		if(result > 0) {	// 성공
			// 응답페이지 : 다시 목록페이지
			// 응답데이터 : "성공적으로 추가" alert 메세지
			session.setAttribute("alertMsg", "성공적으로 답변이 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/detail.iq?no=" + inquiryNo);
			
		}else {	// 실패
			// 응답페이지 : 에러페이지
			// 응답데이터 : "실패" 메세지
			request.setAttribute("msg", "공지사항 등록 실패");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
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
