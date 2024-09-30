<%@ page import="com.mvp.semi.movie.model.vo.Movie"%>
<%@ page import="com.mvp.semi.user.model.vo.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String contextPath = request.getContextPath(); // "/web"
    User loginUser = (User) session.getAttribute("loginUser");
		String alertMsg = (String)session.getAttribute("alertMsg");
    Integer movieNo = (Integer) session.getAttribute("movieNo");
	int userNo = -1;
	if(loginUser != null){
		userNo = loginUser.getUserNo();	
	}
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
		Movie mv = (Movie) session.getAttribute("movie");	
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
      <img src="/mvp<%=mv.getContentPath()%>" id="main_img">
      <div id="gradient_overlay"></div>

      <i id="back" class="fa-solid fa-arrow-left"></i>
      
      <!-- 텍스트와 버튼을 이미지 위에 배치 -->
      <div id="img_text" style="text-align: center;">
        <h1><%= mv.getMovieTitle() %></h1>
        <p id="head_P_Tag"></p>
        <div id="img_btn_style">
          <button style=" width: 110px; margin-right: 20px;" type="button" onclick="window.open('<%=mv.getPreview()%>', '_blank');"><i class="fa-solid fa-play">&nbsp;&nbsp;</i>예고편</button>
          <button style="background: #131313; width: 56px;">
            <svg id="movieLike" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" onclick="likeMovie(<%=userNo%>, <%=mv.getMovieNo()%>);">
            <path d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z"/></svg>
          </button>
        </div>
      </div>
    </div>
    
      <div id="main_content_1">
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
          

          <div class="left_contents_line1" style="display: flex; flex-direction: column;">
            
            <div id="rating_title">
              <p>별점을 선택해주세요.</p>
            </div>

            <div style="display: flex; flex-direction: row; align-items: center;">
              <div style="display: flex; flex-direction: row;">

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
                <button class="btn btn-danger p" type="submit" onclick="insertReview(<%=mv.getMovieNo()%>);">등록</button>
              </div>
            </div>
          </div>
          
          <div id="review">
              <div id="review_menu">
                <div style="display: flex; flex-direction: row; background-color: #171717;">

                  <div id="review_list_left" style="margin: 14px;">
                  
                    <!-- 여기에 최신순 리뷰리스트 -->
                  </div>
                  <div id="review_list_right" style="margin: 14px;">
                    
                    <!-- 여기에 인기순 리뷰리스트 -->
                  
                  </div>
                </div>
              </div>
            </div>
        </div>
                  <div id="right_contents" style="color: #ffffff;">
          <!--개봉일 비교하기 라인-->
          <div id="right_content_line1" class="right_contents_margin">
            <div>
              <p class="right_title" style="width: 90px;">개봉일</p>
              <p class="right_content"><%=mv.getOpenDate()%></p>
            </div>
          </div>
          <div id="right_content_line2" class="right_contents_margin">
            <p class="right_title">평점</p>
            <div style="display: flex; flex-direction: row;">
              <div class="AVG_STAR">
                <p>무비픽 평점</p>
                <div class="AVG_STAR_img_p_tag">
                  <img src="<%=contextPath%>/assets/image/comparePage/star_logo.png" alt="">
                  <p id="mvp_grade"></p>
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
                <!--오른쪽 영화 정보-->
                
       </div>
 
        


        
      </div> <!-- main_content div 끝 -->




  <!--즐겨찾기 버튼 색상 스크립트-->
    				 

  <script>
  
		  document.getElementById("back").addEventListener("click", function() {
			    window.history.back(); // 이전 페이지로 돌아가기
			});
      
      // 영화 좋아요를 눌렀을 때
      function likeMovie(userNo, movieNo){
    	
    	  var btn = document.getElementById("movieLike")
    	$.ajax({
    					url: '<%=contextPath%>/likeMovie.lm',
    					data: {
    								userNo: userNo,
    								movieNo: movieNo
    								},
    			 success: function(res){
				    				 if(res.alreadyLiked == 0 && res.result == 1) {
				    					 btn.classList.toggle('active'); // 좋아요 추가 시 버튼 색 변경
				    				 }else{
				    					 btn.classList.toggle('active');
				    				 }
    			 },
    			 error: function(){
    				 console.log("실패");
    			 }
    	})
    	
    	}
      
      // 리뷰 좋아요을 눌렀을때
      function likeReview(userNo, reviewNo){
      	
    	  var btn = document.getElementById("reviewLike")
    	$.ajax({
    					url: '<%=contextPath%>/likeReview.lr',
    					data: {
    								userNo: userNo,
    								reviewNo: reviewNo
    								},
    			 success: function(res){
    				 
    				 		console.log(res);
    				 		$('.likeCount' + reviewNo).html(res);
        				    
        				reviewListByLike(<%=mv.getMovieNo()%>) // 인기순 정렬 (좋아요 수가 역전될경우 바로 반영)
    				 		
    			 },
    			 error: function(){
    				 console.log("실패");
    			 }
    	})
    	
    	}
      
      // 무비픽 평점 계산해서 출력
      function mvpGrade(movieNo){
    	  
    	  $.ajax({
    		  			url: '<%=contextPath%>/mvpGrade.mg',
    		  			data: {
    		  				movieNo: movieNo
    		  						},
    		  	 success: function(res){
    		  		 
    		  		 		let result = res.mvpGrade;
    		  		 		
    		  		 		$('#mvp_grade').html(result);		// p태그 안에 무비픽 평점 출력
        					
    		  	 },
    		  	 error: function(){
    		  		 console.log("ajax실패");
    		  	 }
    	  })		
    	      	 	 
      }
      
      function reviewListByDate(rvMovieNo){
    	
    	$.ajax({
    					url :'<%=contextPath%>/listByDate.rv',
    					data: {movieNo: rvMovieNo},
    					success: function(res){
    						let divEl = '';
   					    		divEl += '<div class="review_title"><p>최신순</p></div>'
   					    	if (res && res.length > 0) {	
    							for(let i = 0; i < 5; i++){  // 임의로 5개로 설정 숫자만 바꾸면 돼서 회의 후 결정
    								 
    								divEl +=	'<div class="top_review">'
    			                    + '<div class="user_header">'
    			                    + '<img src="' + '<%=contextPath%>' + res[i].userFilePath + '" alt="">'
    												 	 + '<div>'
    												 	  + '<div>' + '<%=loginUser.getUserNick()%>' + '</div>'
    												 	  + '<p style="width: 110px;">' + res[i].reviewDate + '</p>'
    												   + '</div>' 
    													+ '<div class="review_str">'
    												 	 + '<img src="<%=contextPath%>/assets/image/comparePage/star_logo.png">'
    												   + '<p>' + res[i].grade + '</p>'
    												  + '</div>'
    												+'</div>' // user_header div 끝
    												+'<div class="review_body">'
    												 	+'<div class="right_line" style="width: 100%; margin: 15px 0px;"></div>'
    		                     	+'<div class="review_body_content">' + res[i].reviewContent + '</div>'
    							           	+'<div class="right_line" style="width: 100%; margin: 10px 0px "></div>'
    							          	 +'<div class="review_thumb_up">'
    							           		+'<img src="<%=contextPath%>/assets/image/mainPage/thumb_up.png" class="like_btn" style="cursor: pointer; margin-right: 7px;"'
    							           		+ 'onclick="likeReview(' + <%=userNo%> + ',' + res[i].reviewNo + ')">'
    							           		+'<P class="likeCount' + res[i].reviewNo + '">' + res[i].likeCount + '</P>'
    							          	 +'</div>'
    				                 	+ '<div class="right_line" style="width: 100%; margin: 10px 0px "></div>'
    				                 	+ '<div style="display: flex; flex-direction: row;">'
	   		                     		+ '<p style="color: #ffffff; font-size: 18px; margin-right: 289px;">좋아요</p>'
	   		                     	+ '</div></div></div>';
    							}
    						}else{
    							// 리뷰가 없을때
								divEl +=	'<div class="top_review">'
			                    + '<div class="user_header">'
													+ '</div>' // user_header div 끝
												+ '<div class="review_body">'
												 	+'<div class="right_line" style="width: 100%; margin: 15px 0px;"></div>'
		                     	+'<div class="review_body_content">' + ' 등록된 리뷰가 없어요. <br> 별점과 함께 리뷰를 등록해 보세요!' + '</div>'
							           	+'<div class="right_line" style="width: 100%; margin: 10px 0px "></div>'
												+ '</div>'

   		                    + '</div></div>';
    						}
    					$('#review_list_left').html(divEl);
    					
    							
    					},
    					error: function(){
    						console.log("리뷰목록조회실패");
    					}
    					
    					
    	})		
    }
    
      // 리뷰목록 출력(좋아요가 많은 순서)
    function reviewListByLike(rvMovieNo){
    	
    	$.ajax({
    					url :'<%=contextPath%>/listByLike.rv',
    					data: {movieNo: rvMovieNo},
    					success: function(res){
    							console.log(res);
    						let divEl = '';
   					    		divEl += '<div class="review_title"><p>인기순</p></div>'
   					    	if (res && res.length > 0) {	
    							for(let i = 0; i < res.length; i++){
    								 
    								divEl +=	'<div class="top_review">'
    			                    + '<div class="user_header">'
    			                    + '<img src="' + '<%=contextPath%>' + res[i].userFilePath + '" alt="">'
    												 	 + '<div>'
    												 + '<div>' + '<%=loginUser.getUserNick()%>' + '</div>'
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
    							           	+'<img src="<%=contextPath%>/assets/image/mainPage/thumb_up.png" class="like_btn" style="cursor: pointer; margin-right: 7px;"'
    							           	+ 'onclick="likeReview(' + <%=userNo%> + ',' + res[i].reviewNo + ')">'
    							           	+'<P class="likeCount' + res[i].reviewNo + '">' + res[i].likeCount + '</P>'
    							           +'</div>'
    				                 + '<div class="right_line" style="width: 100%; margin: 10px 0px "></div>'
    				                 + '<div style="display: flex; flex-direction: row;">'
	   		                     + '<p style="color: #ffffff; font-size: 18px; margin-right: 289px;">좋아요</p>'
	   		                     +'</div></div></div>';
    							}
    						}else{
    							// 리뷰가 없을때
								divEl +=	'<div class="top_review">'
			                    + '<div class="user_header">'
													+ '</div>' // user_header div 끝
												+ '<div class="review_body">'
												 	+'<div class="right_line" style="width: 100%; margin: 15px 0px;"></div>'
		                     	+'<div class="review_body_content">' + ' 등록된 리뷰가 없어요. <br> 별점과 함께 리뷰를 등록해 보세요!' + '</div>'
							           	+'<div class="right_line" style="width: 100%; margin: 10px 0px "></div>'
												+ '</div>'

   		                    + '</div></div>';
    						}
    					$('#review_list_right').html(divEl);
    					},
    					error: function(){
    						console.log("리뷰목록조회실패");
    					}
    					
    					
    	})	
    	
    }
    
    // 페이지가 로드될때 리뷰 목록 생성식 실행
      window.addEventListener('load', function(){
    	  reviewListByDate(<%=mv.getMovieNo()%>) // 최신순
    	  reviewListByLike(<%=mv.getMovieNo()%>) // 인기순
      	checkedMovieLike(<%=userNo%>, <%=mv.getMovieNo()%>) // 좋아요 상태 조회
      	mvpGrade(<%=mv.getMovieNo()%>)
      	checkedReviewLike(<%=userNo%>, <%=mv.getMovieNo()%>)
    	  																						 
    	  
      })
      // 페이지 로드시 해당 영화 좋아요 등록 되어있으면 하트 빨간색 처리
      function checkedMovieLike(userNo, movieNo){
    	
    	  var btn = document.getElementById("movieLike")

    	$.ajax({
    					url: '<%=contextPath%>/checkLike.cl',
    					data: {
    							userNo: userNo,
    							movieNo: movieNo
    					},
    					success: function(res) {
    										console.log(res);
    										if(res == 1){
    											btn.classList.toggle('active');
    										}
    									},
    						 error: function(){
    							 console.log("체크실패");
    						 }
    										
    					
    	})	
    }
    // 리뷰 좋아요 되어있으면 빨간색 처리 (페이지 로드할때 사용)
      function checkedReviewLike(userNo, movieNo){
      	
    	var btn = document.getElementById("reviewLike")
    	  
    	$.ajax({
    					url: '<%=contextPath%>/checkReviewLike.cr',
    					data: {
    							userNo: userNo,
    							movieNo: movieNo
    					},
    					success: function(res) {
    										console.log(res);
    										
    									},
    						 error: function(){
    							 console.log("체크실패");
    						 }
    										
    					
    	})	
    }
    	
    
    	
    // 리뷰 작성
    	function insertReview(movieNo){
    		
    		 
    		
    		 var reviewText = $('#form-control').val();
    		 var starRating = $('input[class="star"]:checked').val();
    		 
    	        // 입력 값이 비어 있는지 확인 (리뷰내용)
    	        if(!reviewText && !starRating){
    	        	alert('별점과 리뷰내용을 입력해주세요.');
    	        	return;
    	        } else if (!reviewText) {
    	            alert('리뷰내용을 입력해주세요.'); 
    	            return;
    	        } else if (!starRating){
    	        	alert('최소 1개의 별점을 입력해주세요.');
    	        	return;
    	        }
    	        
    	        $.ajax({
    	        				url: '<%=contextPath%>/insertReview.ir',
    	        				method: 'post',
    	        				data: {
    	        					userNo: <%=userNo%>,
    	        				  movieNo: movieNo,
    	        					review: reviewText,
    	        					rate: starRating
    	        				},
    	        				success: function(res) {
    	        		            // 성공 시 리뷰 목록 갱신
    	        		            
    	        		            
    	        		            reviewListByDate(movieNo); // movieNo를 넘겨서 리뷰 목록 갱신
    	        		            
    	        		            $('#form-control').val(''); // 입력 필드 초기화
    	        		            $('.star').prop('checked', false); // 별점 초기화
    	        		        },
    	        				error: function(){
    	        					console.log("실패");
    	        				}
    	        })
    	}


  </script>

</body>
</html>