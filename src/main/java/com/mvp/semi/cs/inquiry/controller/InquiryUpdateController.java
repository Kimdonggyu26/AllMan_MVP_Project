package com.mvp.semi.cs.inquiry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvp.semi.common.model.vo.Attachment;
import com.mvp.semi.common.utils.MyFileRenamePolicy;
import com.mvp.semi.cs.inquiry.model.service.InquiryService;
import com.mvp.semi.cs.inquiry.model.vo.Inquiry;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InquiryUpdateController
 */
@WebServlet("/update.iq")
public class InquiryUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// HttpServletRequest request => MultipartRequest multiRequest
		
		// 1. 전달된 파일업로드
		String savePath = request.getServletContext().getRealPath("/resources/cs_upfiles/inquiry_upfiles");
		int maxSize = 10 * 1024 * 1024;
		
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());
		
		// 2. DB에 기록
		
		// >> 공통적으로 수행 : Update Board (문의유형, 제목, 내용, 글번호)
		int inquiryNo = Integer.parseInt(multiRequest.getParameter("no"));
		String inquiryTitle = multiRequest.getParameter("title");
		String inquiryContent = multiRequest.getParameter("content");
		String inquiryType = multiRequest.getParameter("category");
		
		Inquiry i = new Inquiry();
		i.setInquiryNo(inquiryNo);
		i.setInquiryTitle(inquiryTitle);
		i.setInquirycontent(inquiryContent);
		i.setInquiryType(inquiryType);
		
		// 새로 넘어온 첨부파일이 있을 경우 => Attachment에 Insert 또는 Update
		Attachment at = null;
		if(multiRequest.getOriginalFileName("upfile") != null) {	// 새로 넘어온 첨부파일이 있을 경우
			at = new Attachment();
			at.setOriginName(multiRequest.getOriginalFileName("upfile"));
			at.setChangeName(multiRequest.getFilesystemName("upfile"));
			at.setFilePath("/resources/cs_upfiles/inquiry_upfiles");
			
			if(multiRequest.getParameter("originFileNo") != null) {	
				// 기존에 첨부파일이 있을 경우 => update
				at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
			}else {
				// 기존에 첨부파일이 없었을 경우 => insert
				at.setRefNo(inquiryNo);	
				at.setRefType("IB");
			}
		}
		
		int result = new InquiryService().updateInquiry(i,at);
		
		if(result > 0) { // 성공
			// alert와 함께 다시 상세페이지 이동
			request.getSession().setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
			response.sendRedirect(request.getContextPath() + "/detail.iq?no=" + inquiryNo);
			
		}else {
			// 에러메세지와 함께 에러페이지로 이동
			request.setAttribute("msg", "게시글 수정 실패");
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
