package com.mvp.semi.cs.inquiry.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvp.semi.common.model.vo.Attachment;
import com.mvp.semi.common.utils.MyFileRenamePolicy;
import com.mvp.semi.cs.inquiry.model.service.InquiryService;
import com.mvp.semi.cs.inquiry.model.vo.Inquiry;
import com.mvp.semi.user.model.vo.User;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InquiryInsertController
 */
@WebServlet("/insert.iq")
public class InquiryInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String savePath = request.getServletContext().getRealPath("/resources/cs_upfiles/inquiry_upfiles");
		
		
		int maxSize = 10 * 1024 * 1024;
		
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());
		
		String inquiryTitle = multiRequest.getParameter("title");
		String inquiryContent = multiRequest.getParameter("content");
		String inquiryType = multiRequest.getParameter("category");
		
		HttpSession session = request.getSession();
//		int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
		
		Inquiry i = new Inquiry();
		i.setInquiryTitle(inquiryTitle);
		i.setInquirycontent(inquiryContent);
		i.setInquiryType(inquiryType);
		i.setUserNo(String.valueOf(10001));
		
		// 첨부파일 데이터 => Attechment담기
		Attachment at = null; // 넘어온 첨부파일이 있을 경우 => 생성
		
		// * multiRequest.getOriginalFileName("키") : 첨부파일이 있었을 경우 "원본명" | 없을 경우 null
		if(multiRequest.getOriginalFileName("upfile") != null) {
			at = new Attachment();
			at.setOriginName(multiRequest.getOriginalFileName("upfile"));
			at.setChangeName(multiRequest.getFilesystemName("upfile"));
			at.setFilePath("//resources/cs_upfiles/inquiry_upfiles");
			at.setRefType("IB");
		}
		
		// 서비스 요청
		int result = new InquiryService().insertInquiry(i,at);
		
		// 3. 응답
		if(result > 0) {	// 성공 => 다시목록페이지 => alert메세지
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.iq");
			
		}else {	// 실패 => 에러페이지 => 에러메세지
			
			// 첨부파일이 있었을 경우 
			// 이미 업로드된 파일 => 더이상 쓸모없음 => 파일제거
			if(at != null) {
				new File(savePath + at.getChangeName()).delete();
			}
			
			request.setAttribute("msg", "게시글 등록 실패");
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
