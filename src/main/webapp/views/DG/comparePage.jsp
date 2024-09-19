<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/비교페이지.css">
</head>
<body>
		
		<!-- Header, Nav start -->
    <%--  <%@ include file="/views/common/header.jsp" %> --%>
    <!-- Header, Nav end -->
		
		
		<!-- body부 시작 -->
		
		<div id="main">

    <div id="result-text"> <!-- result-text div 시작 -->
      <p>
      신차원! 짱구는 못말려 더 무비... 평점이 더 좋아요!
      user01님 취향과 일치하는 영화입니다🥳
      </p>
    </div> <!-- result-text div 끝 -->

      <div id="compare-list">
      <div id="compare-list-movie">
        <img src="../DG/assets/image/logo/delete_logo.png" style="margin-top: 10px; float: right; margin-right: 10px;">
        <img src="../DG/assets/image/movie_image/movie_image_3.png" id="movie-mainimage">
        <hr style="border: 1px solid #ffffff30; width: 270px;">
        <p id="movie-title">신차원! 짱구는 못말려 더 무비..</p>
        

        <div id="movie-content"> <!-- movie-content div 시작 -->   
          <div id="movie-content-top"> <!-- movie-content-top div 시작 -->
            <div>
              <p class="p-title">감독</p>
              <p class="p-content">감독명</p>
            </div>
            <div>
              <p class="p-title">배우</p>
              <p class="p-content">배우명</p>
            </div>
            <div>
              <p class="p-title">장르</p>
              <p class="p-content">장르명</p>
            </div>
            <div>
              <p class="p-title">재생시간</p>
              <p class="p-content">000분</p>
            </div>
            <div>
              <p class="p-title">연령등급</p>
              <p class="p-content">전체관람가</p>
            </div>
            <div>
              <p class="p-title">제작국가</p>
              <p class="p-content">국가명</p>
            </div>
            <div>
              <p class="p-title">개봉일</p>
              <p class="p-content">YYYY.MM.DD</p>
            </div>
            <div>
              <p class="p-title">관객수</p>
              <p class="p-content">00만명</p>
            </div>
          </div> <!-- movie-content-top div 끝 -->

          <div id="movie-content-bottom"> <!-- movie-content-bottom div 시작 -->
            <div id="rating">
              <p style="margin-bottom: 4px;">평점</p>

              <div id="rating-list">
                <div class="mvp-rating">
                  <div style="width: 92px; height: 49px; background-color: #131313; border-radius: 10px;">
                    <div style="height: 24px; text-align: center;"><span>무비픽 평점</span></div>
                      <div>
                        <img src="assets/image/logo/star_logo.png" style="margin-left: 13px;">
                        <span>0.00</span>
                      </div>
                  </div>
                </div>
                <div class="naver-rating">
                  <div style="width: 92px; height: 49px; background-color: #131313; border-radius: 10px;">
                    <div style="text-align: center;"><span style="color: #33F833;">네이버</span>&nbsp;<span>평점</span></div>
                    <div>
                      <img src="assets/image/logo/star_logo.png" style="margin-left: 13px;">
                      <span>0.00</span>
                    </div>
                  </div>
                </div>
              </div> <!-- rating-list div 끝 -->
            </div> <!-- rating div 끝 -->

            <div id="mvp-review">
              <span style="font-size: 22px;">무비픽 관련 리뷰</span>
                <div class="review-list">
                  <div style="margin-top: 8px;">너 덕분에 나 이만큼 컸어. 정말 고마워 짱구야.</div>
                  <div>짱구가 위로해줘서 울면서 나옴</div>
                  <div>짱구 너무 귀엽게 잘뽑힘생각보다 풍자적이고 현실적이지만 흔한 메세지 어린이보단 20대가 보기 나을듯</div>
                  <a href="#" style="color: #E7F33F; margin-bottom: 33px;">더보기</a>
                </div>
            </div>

            <div id="introduce">
              <span style="font-size: 25px;">소개</span>
              <div style="margin-top: 8px;">최초의 3D CG! 제작 기간 7년 최고의 웃음과 감동! 최강의 스케일 옷까지 갈아입은 볼록 짱구 등장! 어느 날, 우주에서 날아온 검은 빛과 하얀 빛이 떡잎마을을 향해 떨어진다. 평소처럼 저녁밥을 손꼽아 기다리던 짱구는 하얀 빛에 정통으로 맞게 되고 그러자 온몸에 넘치는 신비한 힘! 힘에 몸을 맡긴 채 엉덩이에 의식을 집중하자 장난감들이 붕붕 떠오른다. "엉덩이... 엉덩이가 뜨거워...!? 뭔지 몰라도 엄청난 힘을 손에 넣은 것 같아." 한편, 검은 빛을 통해 초능력을 손에 넣은 또 다른 남자는 이 세상의 파멸을 바라며 폭주하기 시작하는데, 위기에 처한 세상을 구하기 위한 유일한 희망이 바로 짱구...!?</div>
            </div>
          </div> <!-- movie-content-bottom div 끝 -->
        </div> <!-- movie-content div 끝 -->   
      </div>
      <div id="compare-list-movie">
          <img src="../DG/assets/image/logo/delete_logo.png" style="margin-top: 10px; float: right; margin-right: 10px;">
          <img src="../DG/assets/image/movie_image/movie_image_3.png" id="movie-mainimage">
          <hr style="border: 1px solid #ffffff30; width: 270px;">
          <p id="movie-title">신차원! 짱구는 못말려 더 무비..</p>
          
  
          <div id="movie-content"> <!-- movie-content div 시작 -->   
            <div id="movie-content-top"> <!-- movie-content-top div 시작 -->
              <div>
                <p class="p-title">감독</p>
                <p class="p-content">감독명</p>
              </div>
              <div>
                <p class="p-title">배우</p>
                <p class="p-content">배우명</p>
              </div>
              <div>
                <p class="p-title">장르</p>
                <p class="p-content">장르명</p>
              </div>
              <div>
                <p class="p-title">재생시간</p>
                <p class="p-content">000분</p>
              </div>
              <div>
                <p class="p-title">연령등급</p>
                <p class="p-content">전체관람가</p>
              </div>
              <div>
                <p class="p-title">제작국가</p>
                <p class="p-content">국가명</p>
              </div>
              <div>
                <p class="p-title">개봉일</p>
                <p class="p-content">YYYY.MM.DD</p>
              </div>
              <div>
                <p class="p-title">관객수</p>
                <p class="p-content">00만명</p>
              </div>
            </div> <!-- movie-content-top div 끝 -->
  
            <div id="movie-content-bottom"> <!-- movie-content-bottom div 시작 -->
              <div id="rating">
                <p style="margin-bottom: 4px;">평점</p>
  
                <div id="rating-list">
                  <div class="mvp-rating">
                    <div style="width: 92px; height: 49px; background-color: #131313; border-radius: 10px;">
                      <div style="height: 24px; text-align: center;"><span>무비픽 평점</span></div>
                        <div>
                          <img src="assets/image/logo/star_logo.png" style="margin-left: 13px;">
                          <span>0.00</span>
                        </div>
                    </div>
                  </div>
                  <div class="naver-rating">
                    <div style="width: 92px; height: 49px; background-color: #131313; border-radius: 10px;">
                      <div style="text-align: center;"><span style="color: #33F833;">네이버</span>&nbsp;<span>평점</span></div>
                      <div>
                        <img src="assets/image/logo/star_logo.png" style="margin-left: 13px;">
                        <span>0.00</span>
                      </div>
                    </div>
                  </div>
                </div> <!-- rating-list div 끝 -->
              </div> <!-- rating div 끝 -->
  
              <div id="mvp-review">
                <span style="font-size: 25px;">무비픽 관련 리뷰</span>
                  <div class="review-list">
                    <div style="margin-top: 8px;">너 덕분에 나 이만큼 컸어. 정말 고마워 짱구야.</div>
                    <div>짱구가 위로해줘서 울면서 나옴</div>
                    <div>짱구 너무 귀엽게 잘뽑힘생각보다 풍자적이고 현실적이지만 흔한 메세지 어린이보단 20대가 보기 나을듯</div>
                    <a href="#" style="color: #E7F33F; margin-bottom: 33px;">더보기</a>
                  </div>
              </div>
  
              <div id="introduce">
                <span style="font-size: 25px;">소개</span>
                <div style="margin-top: 8px;">최초의 3D CG! 제작 기간 7년 최고의 웃음과 감동! 최강의 스케일 옷까지 갈아입은 볼록 짱구 등장! 어느 날, 우주에서 날아온 검은 빛과 하얀 빛이 떡잎마을을 향해 떨어진다. 평소처럼 저녁밥을 손꼽아 기다리던 짱구는 하얀 빛에 정통으로 맞게 되고 그러자 온몸에 넘치는 신비한 힘! 힘에 몸을 맡긴 채 엉덩이에 의식을 집중하자 장난감들이 붕붕 떠오른다. "엉덩이... 엉덩이가 뜨거워...!? 뭔지 몰라도 엄청난 힘을 손에 넣은 것 같아." 한편, 검은 빛을 통해 초능력을 손에 넣은 또 다른 남자는 이 세상의 파멸을 바라며 폭주하기 시작하는데, 위기에 처한 세상을 구하기 위한 유일한 희망이 바로 짱구...!?</div>
              </div>
            </div> <!-- movie-content-bottom div 끝 -->
          </div> <!-- movie-content div 끝 -->   
        </div>
      
      <div id="compare-list-movie">
          <img src="../DG/assets/image/logo/delete_logo.png" style="margin-top: 10px; float: right; margin-right: 10px;">
          <img src="../DG/assets/image/movie_image/movie_image_3.png" id="movie-mainimage">
          <hr style="border: 1px solid #ffffff30; width: 270px;">
          <p id="movie-title">신차원! 짱구는 못말려 더 무비..</p>
          
  
          <div id="movie-content"> <!-- movie-content div 시작 -->   
            <div id="movie-content-top"> <!-- movie-content-top div 시작 -->
              <div>
                <p class="p-title">감독</p>
                <p class="p-content">감독명</p>
              </div>
              <div>
                <p class="p-title">배우</p>
                <p class="p-content">배우명</p>
              </div>
              <div>
                <p class="p-title">장르</p>
                <p class="p-content">장르명</p>
              </div>
              <div>
                <p class="p-title">재생시간</p>
                <p class="p-content">000분</p>
              </div>
              <div>
                <p class="p-title">연령등급</p>
                <p class="p-content">전체관람가</p>
              </div>
              <div>
                <p class="p-title">제작국가</p>
                <p class="p-content">국가명</p>
              </div>
              <div>
                <p class="p-title">개봉일</p>
                <p class="p-content">YYYY.MM.DD</p>
              </div>
              <div>
                <p class="p-title">관객수</p>
                <p class="p-content">00만명</p>
              </div>
            </div> <!-- movie-content-top div 끝 -->
  
            <div id="movie-content-bottom"> <!-- movie-content-bottom div 시작 -->
              <div id="rating">
                <p style="margin-bottom: 4px;">평점</p>
  
                <div id="rating-list">
                  <div class="mvp-rating">
                    <div style="width: 92px; height: 49px; background-color: #131313; border-radius: 10px;">
                      <div style="height: 24px; text-align: center;"><span>무비픽 평점</span></div>
                        <div>
                          <img src="assets/image/logo/star_logo.png" style="margin-left: 13px;">
                          <span>0.00</span>
                        </div>
                    </div>
                  </div>
                  <div class="naver-rating">
                    <div style="width: 92px; height: 49px; background-color: #131313; border-radius: 10px;">
                      <div style="text-align: center;"><span style="color: #33F833;">네이버</span>&nbsp;<span>평점</span></div>
                      <div>
                        <img src="assets/image/logo/star_logo.png" style="margin-left: 13px;">
                        <span>0.00</span>
                      </div>
                    </div>
                  </div>
                </div> <!-- rating-list div 끝 -->
              </div> <!-- rating div 끝 -->
  
              <div id="mvp-review">
                <span style="font-size: 25px;">무비픽 관련 리뷰</span>
                  <div class="review-list">
                    <div style="margin-top: 8px;">너 덕분에 나 이만큼 컸어. 정말 고마워 짱구야.</div>
                    <div>짱구가 위로해줘서 울면서 나옴</div>
                    <div>짱구 너무 귀엽게 잘뽑힘생각보다 풍자적이고 현실적이지만 흔한 메세지 어린이보단 20대가 보기 나을듯</div>
                    <a href="#" style="color: #E7F33F; margin-bottom: 33px;">더보기</a>
                  </div>
              </div>
  
              <div id="introduce">
                <span style="font-size: 25px;">소개</span>
                <div style="margin-top: 8px;">최초의 3D CG! 제작 기간 7년 최고의 웃음과 감동! 최강의 스케일 옷까지 갈아입은 볼록 짱구 등장! 어느 날, 우주에서 날아온 검은 빛과 하얀 빛이 떡잎마을을 향해 떨어진다. 평소처럼 저녁밥을 손꼽아 기다리던 짱구는 하얀 빛에 정통으로 맞게 되고 그러자 온몸에 넘치는 신비한 힘! 힘에 몸을 맡긴 채 엉덩이에 의식을 집중하자 장난감들이 붕붕 떠오른다. "엉덩이... 엉덩이가 뜨거워...!? 뭔지 몰라도 엄청난 힘을 손에 넣은 것 같아." 한편, 검은 빛을 통해 초능력을 손에 넣은 또 다른 남자는 이 세상의 파멸을 바라며 폭주하기 시작하는데, 위기에 처한 세상을 구하기 위한 유일한 희망이 바로 짱구...!?</div>
              </div>
            </div> <!-- movie-content-bottom div 끝 -->
          </div> <!-- movie-content div 끝 -->   
        </div>
      </div>
    </div> <!-- coampare-list div 끝 -->

  </div> <!-- main div 끝 -->
  
  	<!-- body부 종료 -->
  	
 			 <!-- Footer start -->
  		 <%--  <%@ include file="/views/common/footer.jsp" %> --%>
 			 <!-- Footer end -->
  	
</body>
</html>