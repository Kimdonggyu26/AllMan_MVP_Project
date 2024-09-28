package com.mvp.semi.user.controller;

public class TasteAlgorithm {
	public String Alorithm(int n1, int n2, int n3, int n4, int n5, int n6, int n7, int n8, int n9, int n10, int n11,int n12) {

		// 사용자 취향 분석 알고리즘

		// 2진수 4비트로 나올 수 있는 경우의 수 16개
		// 비슷한 취향을 2개씩 묶어서 취향 결정

		// 예시
		// A취향 -> 0000, 1111
		// B취향 -> 0001, 1000
		// C취향 -> ....
		// .
		// .
		// .
		// .
		// 해당 알고리즘으로 활용하여 기능 구현
		int[] answers1to4 = { n1, n2, n3, n4 }; // 1~4번 질문의 답변 / 취향 1, 5, 9
		int[] answers5to8 = { n5, n6, n7, n8 }; // 5~8번 질문의 답변 / ...
		int[] answers9to12 = { n9, n10, n11, n12 }; // 9~12번 질문의 답변 / ...

		// 최종 확정된 답변을 저장할 StringBuilder
		StringBuilder finalResult = new StringBuilder();

		// 각 질문에 대해 세로로 다수결로 답변 확정
		for (int i = 0; i < 4; i++) {
			// 각 질문(세로)을 비교하여 다수결로 확정
			int majorityResult = determineMajority(answers1to4[i], answers5to8[i], answers9to12[i]);
			finalResult.append(majorityResult); // 결과를 StringBuilder에 추가
		}

		// 결과 출력 -> 이진수 4비트 형식으로
		System.out.println("취향 분석 결과: " + finalResult.toString());

		return finalResult.toString(); // 최종 결과를 문자열로 반환
	}

	// 다수로 0 또는 1을 결정함
	public int determineMajority(int answer1, int answer2, int answer3) {
		int count1 = 0;
		int count0 = 0;

		// 각 매개변수에 맞게 1이면 count1을 증가, 0이면 count0을 증가
		if (answer1 == 1)
			count1++;
		else
			count0++;

		if (answer2 == 1)
			count1++;
		else
			count0++;

		if (answer3 == 1)
			count1++;
		else
			count0++;

		// 1이 더 많으면 1을 반환, 0이 더 많으면 0을 반환
		return (count1 > count0) ? 1 : 0;
	}
}
