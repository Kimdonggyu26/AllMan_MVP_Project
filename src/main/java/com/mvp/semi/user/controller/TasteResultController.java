package com.mvp.semi.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvp.semi.user.model.service.UserService;
import com.mvp.semi.user.model.vo.User;

/**
 * Servlet implementation class TasteResultController
 */
@WebServlet("/tasteResult.tr")
public class TasteResultController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TasteResultController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();

		System.out.println("선택 완료\n\n1~4번 : " + session.getAttribute("taste1") + session.getAttribute("taste2")
												   + session.getAttribute("taste3") + session.getAttribute("taste4"));
		
		System.out.println("5~8번 : " + session.getAttribute("taste5") + session.getAttribute("taste6")
									  + session.getAttribute("taste7") + session.getAttribute("taste8"));
		
		System.out.println("9~12번: " + session.getAttribute("taste9") + session.getAttribute("taste10")
									  + session.getAttribute("taste11") + session.getAttribute("taste12"));

		int[] numArray = new int[12]; // int형 배열 생성

		for (int i = 0; i < 12; i++) {
			// 세션에서 값 가져오기
			Object tasteValue1 = session.getAttribute("taste" + (i + 1)); // taste1부터 taste12까지 가져오기

			if (tasteValue1 != null) {
				try {
					numArray[i] = Integer.parseInt(tasteValue1.toString());
				} catch (NumberFormatException e) {
					System.out.println("변환 오류 발생: " + tasteValue1);
					numArray[i] = 0; // 변환 실패 시 기본값 설정 (필요에 따라 조정)
				}
			} else {
				System.out.println("배열 작업중 오류 발생");
				numArray[i] = 0;
			}
		}

		System.out.println("\n분석 시작");
		System.out.println("취향분석 TeastAlgorithm 호출중\n");
		String result = new TasteAlgorithm().Alorithm(numArray[0], numArray[1], numArray[2], numArray[3], numArray[4],numArray[5], numArray[6]
													, numArray[7], numArray[8], numArray[9], numArray[10], numArray[11]);

		// result 값에 담긴 4비트로 취향 분리
		// 1개 취향에 2개에 4비트
		// 문자형인지 정수형인지 결정하기 결정 후 파싱 진행 여부
		// NDHE10 VDSE20 SPTF30 BOFA40
		// ETRF50 CCFE60 CAES70 HHAL80

		int tasteResult = 0;
		User u = (User) session.getAttribute("loginUser");
		switch (result) {// result
		case "0000":
		case "1111":
			System.out.println("NDHE");
			// 관련된 홈페이지 포워딩
			System.out.println("아이디 : " + u);
			System.out.println("취향 update 진행");

			// user-mapper.xml
//  			10으로 취향번호 저장
			tasteResult = new UserService().updateTaste(10, u.getUserId());
			
			if (tasteResult > 0) {
				System.out.println("취향 등록 성공");
				session.setAttribute("loginUser", u);
				request.getRequestDispatcher("/views/taste/tasteNDHE.jsp").forward(request, response);
			} else {
				System.out.println("취향 등록 실패, 임시 값 20으로 다시 취향 분석 1번으로 재진행");
				request.setAttribute("alerMsg", "분석실패, 다시 진행해주세요.");
				request.getRequestDispatcher("/taste.t0").forward(request, response);
			}
			break;
		case "0001":
		case "1110":
			System.out.println("VDSE");
			// 관련된 홈페이지 포워딩
			System.out.println("아이디 : " + u);
			System.out.println("취향 update 진행");

			tasteResult = new UserService().updateTaste(20, u.getUserId());

			if (tasteResult > 0) {
				System.out.println("취향 등록 성공");
				session.setAttribute("loginUser", u);
				request.getRequestDispatcher("/views/taste/tasteVDSE.jsp").forward(request, response);
			} else {
				System.out.println("취향 등록 실패, 임시 값 20으로 다시 취향 분석 1번으로 재진행");
				request.setAttribute("alerMsg", "분석실패, 다시 진행해주세요.");
				request.getRequestDispatcher("/taste.t0").forward(request, response);
			}
			break;
		case "0010":
		case "1101":
			System.out.println("SPTF");
			// 관련된 홈페이지 포워딩
			System.out.println("아이디 : " + u);
			System.out.println("취향 update 진행");

			tasteResult = new UserService().updateTaste(30, u.getUserId());

			if (tasteResult > 0) {
				System.out.println("취향 등록 성공");
				session.setAttribute("loginUser", u);
				request.getRequestDispatcher("/views/taste/tasteSPTF.jsp").forward(request, response);
			} else {
				System.out.println("취향 등록 실패, 임시 값 20으로 다시 취향 분석 1번으로 재진행");
				request.setAttribute("alerMsg", "분석실패, 다시 진행해주세요.");
				request.getRequestDispatcher("/taste.t0").forward(request, response);
			}
			break;
		case "0011":
		case "1100":
			System.out.println("BOFA");
			// 관련된 홈페이지 포워딩
			System.out.println("아이디 : " + u);
			System.out.println("취향 update 진행");

			tasteResult = new UserService().updateTaste(40, u.getUserId());

			if (tasteResult > 0) {
				System.out.println("취향 등록 성공");
				session.setAttribute("loginUser", u);
				request.getRequestDispatcher("/views/taste/tasteBOFA.jsp").forward(request, response);
			} else {
				System.out.println("취향 등록 실패, 임시 값 20으로 다시 취향 분석 1번으로 재진행");
				request.setAttribute("alerMsg", "분석실패, 다시 진행해주세요.");
				request.getRequestDispatcher("/taste.t0").forward(request, response);
			}
			break;
		case "0100":
		case "1011":
			System.out.println("ETRF");
			// 관련된 홈페이지 포워딩
			System.out.println("아이디 : " + u);
			System.out.println("취향 update 진행");

			tasteResult = new UserService().updateTaste(50, u.getUserId());

			if (tasteResult > 0) {
				System.out.println("취향 등록 성공");
				session.setAttribute("loginUser", u);
				request.getRequestDispatcher("/views/taste/tasteETRF.jsp").forward(request, response);
			} else {
				System.out.println("취향 등록 실패, 임시 값 20으로 다시 취향 분석 1번으로 재진행");
				request.setAttribute("alerMsg", "분석실패, 다시 진행해주세요.");
				request.getRequestDispatcher("/taste.t0").forward(request, response);
			}
			break;
		case "0101":
		case "1010":
			System.out.println("CCFE");
			// 관련된 홈페이지 포워딩
			System.out.println("아이디 : " + u);
			System.out.println("취향 update 진행");

			// user-mapper.xml
//  			10으로 취향번호 저장
			tasteResult = new UserService().updateTaste(60, u.getUserId());

			if (tasteResult > 0) {
				System.out.println("취향 등록 성공");
				session.setAttribute("loginUser", u);
				request.getRequestDispatcher("/views/taste/tasteCCFE.jsp").forward(request, response);
			} else {
				System.out.println("취향 등록 실패, 임시 값 20으로 다시 취향 분석 1번으로 재진행");
				request.setAttribute("alerMsg", "분석실패, 다시 진행해주세요.");
				request.getRequestDispatcher("/taste.t0").forward(request, response);
			}
			break;
		case "0110":
		case "1001":
			System.out.println("CAES");
			// 관련된 홈페이지 포워딩
			System.out.println("아이디 : " + u);
			System.out.println("취향 update 진행");

			tasteResult = new UserService().updateTaste(70, u.getUserId());

			if (tasteResult > 0) {
				System.out.println("취향 등록 성공");
				session.setAttribute("loginUser", u);
				request.getRequestDispatcher("/views/taste/tasteCAES.jsp").forward(request, response);
			} else {
				System.out.println("취향 등록 실패, 임시 값 20으로 다시 취향 분석 1번으로 재진행");
				request.setAttribute("alerMsg", "분석실패, 다시 진행해주세요.");
				request.getRequestDispatcher("/taste.t0").forward(request, response);
			}
			break;
		case "0111":
		case "1000":
			System.out.println("HHAL");
			// 관련된 홈페이지 포워딩
			System.out.println("아이디 : " + u);
			System.out.println("취향 update 진행");

			tasteResult = new UserService().updateTaste(80, u.getUserId());

			if (tasteResult > 0) {
				System.out.println("취향 등록 성공");
				session.setAttribute("loginUser", u);
				request.getRequestDispatcher("/views/taste/tasteHHAL.jsp").forward(request, response);
			} else {
				System.out.println("취향 등록 실패, 임시 값 20으로 다시 취향 분석 1번으로 재진행");
				request.setAttribute("alerMsg", "분석실패, 다시 진행해주세요.");
				request.getRequestDispatcher("/taste.t0").forward(request, response);
			}
			break;
		default:
			System.out.println("취향번호를 찾을 수 없음");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
