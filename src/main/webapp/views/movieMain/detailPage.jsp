<%@ page import="com.mvp.semi.movie.model.vo.Movie"%>
<%@ page import="com.mvp.semi.user.model.vo.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath(); // "/web"

	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="icon" href="./assets/image/titleIcon.png"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
		
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="<%=contextPath%>/views/movieMain/css/detailPage.css">
</head>
<body>

	<%
		Movie mv = (Movie) request.getAttribute("movie");	
		String[] genreArr = mv.getGenre().split(",");
		 StringBuilder genres = new StringBuilder(); 

		    for (int i = 0; i < genreArr.length; i++) {
		        genres.append(genreArr[i].trim()); 
		        if (i < genreArr.length - 1) {
		            genres.append(", ");
		        }
		    }
	%>
  <!--상세 이미지 영역-->
    <div id="main_img_div">
      <img src="<%=mv.getContentPath()%>" id="main_img">
      <div id="gradient_overlay"></div>

      <i id="back" class="fa-solid fa-x"></i>
      
      <!-- 텍스트와 버튼을 이미지 위에 배치 -->
      <div id="img_text" style="text-align: center;">
        <h1><%= mv.getMovieTitle() %></h1>
        <p id="head_P_Tag">진짜 나를 만날 시간</p>
        <div id="img_btn_style">
          <button style=" width: 110px; margin-right: 20px;" type="button" onclick="location.href='<%=mv.getPreview()%>'"><i class="fa-solid fa-play">&nbsp;&nbsp;</i>예고편</button>
          <button style="background: #131313; width: 56px;">
            <svg id="like" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z"/></svg>
          </button>
        </div>
      </div>
    </div>
    <div>
      <div id="mian_content_1">
        <!--왼쪽 영화 정보-->
        <div id="left_contents">
          <div class="left_contents_line1">
            <h6 style="font-weight: bold;">소개</h6>
            <p style="font-weight: bold; margin-top: 11px;">
              <%= mv.getMovieContent() %>
            </p>
          </div>

          <div class="left_contents_line1">
            <h6 style="font-weight: bold;">출연진</h6>
            <p style="font-weight: bold; margin-top: 11px;">
              <%=mv.getActor()%>
            </p>
          </div>
          <div class="left_contents_line1">
            <h6 style="font-weight: bold;">시청하기</h6>
            <div id="ott">
              <!--넷플릭스 양쪽 및 하단 공백, 이미지 교체 필요-->
              <a href="#"><img src="./assets/image/icon/넷플릭스.png" alt=""></a>
              <a href="#"><img src="./assets/image/icon/웨이브.png" alt=""></a>
              <a href="#"><img src="./assets/image/icon/쿠팡.png" alt=""></a>
              <a href="#"><img src="./assets/image/icon/티빙.png" alt=""></a>
              <a href="#"><img src="./assets/image/icon/왓챠.png" alt=""></a>
            </div>
          </div>

          <div class="left_contents_line1" style="display: flex; flex-direction: column;">
            
            <div id="rating_title">
              <p>별점을 선택해주세요.</p>
            </div>

            <div style="display: flex; flex-direction: row; align-items: center;">
              <div style="display: flex; flex-direction: row;">
                <div id="rating_chekc_star">
                  <p>스포일러</p> <input type="checkbox">
                </div>
              </div>
              
              
              <div class="star-rating">
                <input type="radio" class="star" value="1">
                <input type="radio" class="star" value="2">
                <input type="radio" class="star" value="3">
                <input type="radio" class="star" value="4">
                <input type="radio" class="star" value="5">
              </div>
            </div>
            <div id="searchInput" class="input-group">
              <input type="text" id="form-control" class="form-control" placeholder="리뷰를 등록해두세요." autocomplete="off">
              <div id="searchButton" class="input-group-append">
                <button class="btn btn-danger p" type="button">등록</button>
              </div>
            </div>
          </div>

              <!--review-->
            <div id="review">
              <div id="review_menu">
                <div style="display: flex; flex-direction: row;">

                  <div id="review_list" style="margin: 14px;">
                    <!-- 여기에 리뷰리스트 -->
                  <div style="margin-left: 27px; border: 1px solid red;">
                    <div class="review_title" style="margin: 14px;">
                      <p>최신</p>
                    </div>
                    <div>
                      <div>최신 빵통조림</div>
                      <div>최신 스포일러</div>
                    </div>
                  </div>

                </div>
              </div>
            </div>
        </div>
        
        <!--오른쪽 영화 정보-->
        <div id="right_contents" style="color: #ffffff;">
          <!--개봉일 비교하기 라인-->
          <div id="right_content_line1" class="right_contents_margin">
            <div>
              <p class="right_title" style="width: 90px;">개봉일</p>
              <p class="right_content"><%=mv.getOpenDate()%></p>
            </div>
            <button><img src="<%=contextPath%>/assets/image/mainPage/download_logo.png">비교하기</button>
          </div>
          <div id="right_content_line2" class="right_contents_margin">
            <p class="right_title">평점</p>
            <div style="display: flex; flex-direction: row;">
              <div class="AVG_STAR">
                <p>무비픽 평점</p>
                <div class="AVG_STAR_img_p_tag">
                  <img src="<%=contextPath%>/assets/image/comparePage/star_logo.png" alt="">
                  <p>4.48</p>
                </div>
              </div>
              
              <div style="margin-left: 20px;" class="AVG_STAR">
                <p><span style="color: #33F833;">네이버</span>평점</p>
                <div class="AVG_STAR_img_p_tag">
                  <img src="<%=contextPath%>/assets/image/comparePage/star_logo.png" alt="">
                  <p><%=mv.getGrade()%></p>
                </div>
              </div>
            </div>
          </div>
          <div id="right_content_line3" class="right_contents_margin">
            <p class="right_title">장르</p>
            <div class="right_content"><%=genres%></div>
            <div class="right_line"></div>
          </div>

          <div id="right_content_line4" class="right_contents_margin">
            <p class="right_title">재생시간</p>
            <div class="right_content"><%=mv.getPlayTime() + "분"%></div>
            <div class="right_line"></div>
          </div>
          <div id="right_content_line5" class="right_contents_margin">
            <p class="right_title">연령 등급</p>
            <div class="right_content"><%=mv.getAgeLv()%></div>
            <div class="right_line"></div>
          </div>
          <div id="right_content_line6" class="right_contents_margin">
            <p class="right_title">제작국가</p>
            <div class="right_content"><%=mv.getCountry()%></div>
            <div class="right_line"></div>
          </div>
          <div id="right_content_line7" class="right_contents_margin">
            <p class="right_title">관객수</p>
            <div class="right_content"><%=mv.getAudienceCount() + "만명"%></div>
            <div class="right_line"></div>
          </div>
        </div>
      </div>
    </div>




  <!--즐겨찾기 버튼 색상 스크립트-->
  <script>
    var btn = document.getElementById("like")
  
    btn.addEventListener('click',function(){
              btn.classList.toggle('active')
      })
      
      function reviewListByDate(rvMovieNo){
    	
    	$.ajax({
    					url :'<%=contextPath%>/listByDate.rv',
    					data: {movieNo: rvMovieNo},
    					success: function(res){
    						console.log(res[1]);
    						
    						let divEl = '';
   					    	if (res && res.length > 0) {	
   					    		divEl += '<div class="review_title"><p>최신</p></div>'
    							for(let i = 0; i < res.length; i++){
    								 
    								divEl +=	'<div class="top_review">'
    			                    + '<div class="user_header">'
    			                     + '<img src="./assets/image/icon/웨이브.png" alt="">'
    												 + '<div> <div>'
    												 + res[i].userNickname + '</div>'
    												 + '<p>' + res[i].reviewDate + '</p>'
    												 + '</div>' 
    												+ '<div class="review_str">'
    												 + '<img src="<%=contextPath%>/assets/image/comparePage/star_logo.png">'
    												 + '<p>' + res[i].grade + '</p>'
    												 + '</div>'
    												+'</div>'
    												+'<div class="review_body">'
    												 +'<div class="right_line" style="width: 100%; margin: 15px 0px;"></div>'
    		                     +'<div class="review_body_content">' + res[i].reviewContent + '</div>'
    							           +'<div class="right_line" style="width: 100%; margin: 10px 0px "></div>'
    							           +'<div class="review_thumb_up">'
    							           	+'<img src="<%=contextPath%>/assets/image/mainPage/thumb_up.png"	'
    							           	+ 'onclick="likeReview(' + res[i].reviewNo + ')">'
    							           	+'<P>33</P>'
    							           +'</div>'
    				                 + '<div class="right_line" style="width: 100%; margin: 10px 0px "></div>'
    				                 + '<div style="display: flex; flex-direction: row;">'
	   		                     + '<p style="color: #ffffff; font-size: 18px; margin-right: 289px;">좋아요</p>'
	   		                     +   '<i class="fa-solid fa-ellipsis" style="color: #ffffff; width: 18px; height: 4px; margin-top: 5px;"></i>'
	   		                     +'</div></div></div>';
    							}
    						}else{
    							divEl = '리뷰가 없습니다.';
    						}
    					$('#review_list').html(divEl);
    					},
    					error: function(){
    						console.log("리뷰목록조회실패");
    					}
    					
    					
    	})		
    }
    // 페이지가 로드될때 최신순 리뷰 목록 생성식 실행
      window.addEventListener('load', function(){
    	  reviewListByDate(<%=mv.getMovieNo()%>)
      })
      
      function likeReview(userNo, reviewNo){
    	
    	$.ajax({
    					url: '<%=contextPath%>/likeReview.lr',
    					data: {
    							userNo: userNo,
    							reviewNo: reviewNo
    					},
    					success: function(res){
    						console.log(res);
    					}
    					
    	})
    }


  </script>

</body>
</html>