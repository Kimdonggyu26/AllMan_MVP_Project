package com.mvp.semi.user.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class TasetOneController
 */
@WebServlet("/taste.t12")
public class TasteTwelveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TasteTwelveController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();

		//end페이지
		
		
		
        // 선택한 취향 값 받기
        String taste = request.getParameter("taste");
        System.out.println(taste);
        System.out.println("선택 완료\n\n1~4번 : " + session.getAttribute("taste1") + session.getAttribute("taste2") + session.getAttribute("taste3") + session.getAttribute("taste4"));
        System.out.println("5~8번 : " + session.getAttribute("taste5") + session.getAttribute("taste6") + session.getAttribute("taste7") + session.getAttribute("taste8"));
        System.out.println("9~12번: " + session.getAttribute("taste9") + session.getAttribute("taste10") + session.getAttribute("taste11") + session.getAttribute("taste12"));

        int[] numArray = new int[12]; // int형 배열 생성

        for (int i = 0; i < 12; i++) {
            // 세션에서 값 가져오기
            Object tasteValue = session.getAttribute("taste" + (i + 1)); // taste1부터 taste12까지 가져오기

            if (tasteValue != null) {
                try {
                    numArray[i] = Integer.parseInt(tasteValue.toString());
                } catch (NumberFormatException e) {
                    System.out.println("변환 오류 발생: " + tasteValue);
                    numArray[i] = 0; // 변환 실패 시 기본값 설정 (필요에 따라 조정)
                }
            } else {
                System.out.println("배열 작업중 오류 발생");
                numArray[i] = 0; // null인 경우 기본값 설정 (필요에 따라 조정)
            }
        }

        System.out.println("\n분석 시작");
        System.out.println("취향분석 TeastAlgorithm 호출중\n");
        String result = new TasteAlgorithm().Alorithm(numArray[0], numArray[1], numArray[2], numArray[3]
					        				  		   ,numArray[4], numArray[5], numArray[6], numArray[7]
					        				  		   ,numArray[8], numArray[9], numArray[10], numArray[11]);
        
        //result 값에 담긴 4비트로 취향 분리
        //1개 취향에 2개에 4비트
        //문자형인지 정수형인지 결정하기    결정 후 파싱 진행 여부
        //NDHE	VDSE	SPTF	BOFA	
        //ETRF	CCFE	CAES	HHAL
        switch ("0001") {//result
		case "0000":
			System.out.println("NDHE");
			//관련된 홈페이지 포워딩
			
			//user-mapper.xml
			// entry : insertUser, 숫자 20번 '?' 수정
			//Dao : '?'에 들어갈 취향 번호
			
			//사용한 세션 무효화
			break;
		case "0001":
			System.out.println("VDSE");
			 request.getRequestDispatcher("/views/taste/tasteNDHE.jsp").forward(request, response);
			break;	
		case "0010":
			System.out.println("NDHE");
			break;	
		case "0011":
			System.out.println("NDHE");
			break;	
		case "0100":
			System.out.println("NDHE");
			break;	
		case "0101":
			System.out.println("NDHE");
			break;	
		case "0110":
			System.out.println("NDHE");
			break;	
		case "1000":
			System.out.println("NDHE");
			break;	
		case "1001":
			System.out.println("NDHE");
			break;	
		case "1010":
			System.out.println("NDHE");
			break;	
		case "1011":
			System.out.println("NDHE");
			break;	
		case "1100":
			System.out.println("NDHE");
			break;	
		case "1101":
			System.out.println("NDHE");
			break;	
		case "1110":
			System.out.println("NDHE");
			break;	
		case "1111":
			System.out.println("NDHE");
			break;	
		default:

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
