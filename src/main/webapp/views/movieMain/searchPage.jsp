<%@page import="java.util.Map"%>
<%@page import="com.mvp.semi.movie.model.vo.Movie"%>
<%@page import="java.util.List"%>
<%@page import="com.mvp.semi.common.model.vo.PageInfo"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		String searchData = (String) request.getAttribute("searchData"); //Ajax를 위한 데이터
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- Header, Nav start -->
	<%@ include file="/views/common/header.jsp"%>
	<!-- Header, Nav end -->

	<link rel="stylesheet"href="<%=contextPath%>/views/movieMain/css/mainPage.css">

	<!-- body부 시작 -->

	<div id="main">
				<div id="genre">
					<div class="genre-top">
						<button type="button" class="btn btn-secondary main-hashtag"value="액션">액션</button>
						<button type="button" class="btn btn-secondary main-hashtag"value="crime">범죄</button>
						<button type="button" class="btn btn-secondary main-hashtag"value="sf">SF</button>
						<button type="button" class="btn btn-secondary main-hashtag"value="comedy">코미디</button>
						<button type="button" class="btn btn-secondary main-hashtag"value="slapstick">슬랩스틱</button>
						<button type="button" class="btn btn-secondary main-hashtag"value="romance">로맨스</button>
						<button type="button" class="btn btn-secondary main-hashtag"value="musical">뮤지컬</button>
					</div>
					<div class="genre-bottom">
						<button type="button" class="btn btn-secondary main-hashtag"value="thriller">스릴러</button>
						<button type="button" class="btn btn-secondary main-hashtag"value="horror">공포</button>
						<button type="button" class="btn btn-secondary main-hashtag"value="war">전쟁</button>
						<button type="button" class="btn btn-secondary main-hashtag"value="sports">스포츠</button>
						<button type="button" class="btn btn-secondary main-hashtag"value="fantasy">판타지</button>
						<button type="button" class="btn btn-secondary main-hashtag"value="music">음악</button>
						<button type="button" class="btn btn-secondary main-hashtag"value="melo">멜로</button>
					</div>
				</div>
				<!-- genre div 끝 -->

<!-- sidebar div 시작 -->
		<div style="width: 310px; height: 2361px; float: left;">
			<div id="sidebar">
				<%@ include file="/views/common/basket.jsp"%>
			</div>
			<!-- sidebar div 끝 -->
		</div>
<!-- sidebar div 끝 -->

			<!-- 상단 검색 결과 섹션 -->					
			<div id="printShowMovieList"></div>
				<!-- 검색결과 없음 출력 -->
			<div id="ShwoNoSearch"></div>
			
			<div id="printOTTMovieList"></div>
			<div id="OTTNoSearch"></div>
	</div><!-- main div 끝-->		 


<!-- body부 종료 -->
</body>
	
<script>
	//장르 선택 값
	var result = "";	
	  document.querySelectorAll('.main-hashtag').forEach(button => {
	      button.addEventListener('click', function() {
	        result = this.value;
	        console.log(result);  // 클릭한 버튼의 value 값 출력
	        window.location.href = "<%=contextPath%>/searchPage.mv?search=" + result;
	      });
	  });
	  

	  $(function(){
			fnAjaxShowSearch(1);
			fnAjaxOttSearch(1);
		})
			
			
		//상영 리스트
		function fnAjaxShowSearch(showPage) { 
			$searchData = "<%=searchData%>"; //검색
			
			$.ajax({
				url: '<%=contextPath%>/showSearch.ms',
				data: {
					search: $searchData,
					showPage: showPage,
				},
				success: function(res){
					// {ottList:[{}, {}], ottPi:{}}  
					// 응답받아야되는 정보 : ott영화list, ott영화pi
					// res.showList => 상영영화list
					// res.ottList => ott영화list
					console.log(res);
					
					let h1El = ""; //검색결과 없음 담기 위한 변수 
					let divEl = "";//영화 리스트를 담기 위한 변수
					
					var r = res.movieList; // 영화 데이터 
					var p = res.pageInfo; // 페이징
					
					let count = 0;
			
					if(r.length == 0){// 추후에 OTT 작업후  && res.ottList.length == 0 추가
						// 검색결과 없음보여지는 요소작업  - id값 noSearch
						console.log('검색결과 없음');
					
						h1El += '<div style="width: 1561px; float: right; margin-top: 34px;">'//전체 div
						    +   		'<div id="text">'
						    +       	'<p>상영 영화</p>'
						    +   		'</div>'
							
								+				'<div style="display: flex; height: 500px; align-items: center; width: 1260px; justify-content: center;">'
							  +					'<h1>일치하는 검색결과가 없어요.</h1>'
							  +  			'</div>'
							  +		'</div>';
					}else {
						 if(r.length != 0){
							 // 상영영화 목록 요소 작업
							divEl  += '<div style="width: 1561px; float: right; margin-top: 34px;">'//전체 div
									    +   '<div id="text"  style="display: flex; flex-direction: row;">'
									    +       '<p>상영 영화</p>'
											+			    '<ul style="margin-left: 55%; font-size: 2rem; display: flex; list-style-type: none;">'
											+			          '<li>'
											+			         		 '<a onclick="fnAjaxShowSearch(' + (p.currentPage == 1 ? p.maxPage : (p.currentPage - 1)) + ')">'
											+			            	  		'<i id="left-arrow" class="fa-solid fa-circle-chevron-left" style="cursor: pointer;"></i>' 
											+			          		'</a>'
											+			          '</li>'
											+				          '<li>'
											+				        		'<a onclick="fnAjaxShowSearch(' + (p.currentPage == p.maxPage ? 1 : (p.currentPage + 1)) +')">' 
											+				          		    '<i id="right-arrow" class="fa-solid fa-circle-chevron-left" style="transform: scaleX(-1); cursor: pointer;"></i>'
											+				         		'</a>' 
											+				          '</li>' 
											+						'</ul>'
									    +   	'</div>'
									    +   '<div id="movie1">';//전체 movie1
									    for (let i = 0; i < r.length; i++) {
									        if (count === 0) {
									            divEl += '<div id="movie1-top">'; // movie1-top 시작
									        }
										    divEl += '<div class="movie1-list">' +  // movie1-list 시작
										    '    <div class="movie-image">' +
										    '        <img src="/mvp'+r[i].titlePath+'">' +  // contextPath에 r[i].titlePath 추가  
										    '    </div>' +
										    '    <div class="movie-info">' +  // movie-info 시작
										    '        <div style="display: flex; align-items: center;">' +  // a 시작
										    '            <table style="margin-left: 12px; margin-bottom: 7px; margin-top: 7px; width:130px; table-layout: fixed;">' +
										    '                <tr>' +
										    '                    <td style="color: white; font-weight: 900; font-size: 13px;">'+ r[i].movieTitle +'</td>' +
										    '                </tr>' +
										    '                <tr>' +
										    '                    <td>'+ r[i].openDate +'</td>' +
										    '                </tr>' +
										    '                <tr>' +
										    '                    <td>장르 : '+ r[i].genre +'</td>' +
										    '                </tr>' +
										    '                <tr>' +
										    '                    <td>감독 : '+ r[i].director +'</td>' +
										    '                </tr>' +
										    '            </table>' +
										    '            <i class="fa-regular fa-heart" id="heart" style=""></i>' +  // heart 아이콘
										    '        </div>' +  // a 닫기
										    '        <div style="display: flex;">' +  // b 시작
										    '            <button type="button" class="btn btn-secondary" id="info' + r[i].movieNo + '">영화정보</button>' +
										    '            <button type="button" class="btn btn-danger" id="compare">' +  // c 시작
										    '                <img src="assets/image/mainPage/download_logo.png" style="width: 14px; height: 14px; margin-right: 5px; margin-bottom: 4px;">비교하기' +
										    '            </button>' +  // c 닫기
										    '        </div>' +  // b 닫기
										    '    </div>' +  // movie-info 닫기
										    '</div>';  // movie1-list 닫기
										    
							

									        
										    count++; // count 증가

										    // movie1-top을 닫는 부분
										    if (count === 5) { // 5개 후 movie1-top 닫기
										        divEl += '</div>'; // movie1-top 닫기
										    }

										    // movie1-bottom을 시작
										    if (count === 5) { // 5개 후
										        divEl += '<div id="movie1-bottom">'; // movie1-bottom 시작
										    }

										    // movie1-bottom을 닫는 부분
										    if (count === 10) { // 8개 후 movie1-bottom 닫기
										        divEl += '</div>'; // movie1-bottom 닫기
										        count = 0; // count 리셋
										    }
										}
							    divEl += '</div>'; // movie1 닫기
								divEl += '</div>'; // 전체 div 닫기
								
						}
					}
					$('#ShwoNoSearch').html(h1El);
					$('#printShowMovieList').html(divEl);
					
		            for (let i = 0; i < r.length; i++) {
		                $('#info' + r[i].movieNo).on('click', function() {
		                    var movieNo = r[i].movieNo; // 현재 영화 번호
		                    
		                    $.ajax({
		                        type: "POST",
		                        url: "<%=contextPath%>/showDetail.sd", // 서블릿 URL
		                        data: { movieNo: movieNo }, // 영화 번호를 데이터로 전송
		                        success: function(response) {
		                            // 성공적으로 요청이 처리된 후, 페이지 이동
		                            window.location.href = "<%=contextPath%>/views/movieMain/detailPage.jsp";
		                        },
		                        error: function(error) {
		                            console.error("Error:", error);
		                        }
		                    });
		                });
		            }
				},
				error: function(){
					console.log('영화 검색 ajax 통신 실패');
				}
			});	
			
			
		}
	
		
		//OTT 리스트
		function fnAjaxOttSearch(ottPage) {
		    const $searchData = "<%=searchData%>"; // 검색
		    
		    $.ajax({
		        url: '<%=contextPath%>/ottSearch.ms',
		        data: {
		            search: $searchData,
		            ottPage: ottPage
		        },
		        success: function(res){
		            console.log(res);
		            
		            let h1El = ""; // 검색결과 없음 담기 위한 변수 
		            let divEl = ""; // 영화 리스트를 담기 위한 변수
		            
		            var r = res.ottMovieList; // 영화 데이터 
		            var p = res.ottPageInfo; // 페이징 정보
		            
		            let count = 0;
		
		            if(r.length == 0) {
		                // 검색결과 없음
		                console.log('검색결과 없음');
		                
		                h1El += '<div style="width: 1561px; float: right; margin-top: 34px;">'
		                     +  '<div id="text">'
		                     +  '<p>OTT 영화</p>'
		                     +  '</div>'
		                     +  '<div style="display: flex; height: 500px; align-items: center; width: 1260px; justify-content: center;">'
		                     +  '<h1>일치하는 검색결과가 없어요.</h1>'
		                     +  '</div>'
		                     +  '</div>';
		            } else {
		                if(r.length != 0) {
		                    divEl += '<div style="width: 1561px; float: right; margin-top: 100px;">'
		                          +  '<div id="text" style="display: flex; flex-direction: row;">'
		                          +  '<p>OTT 영화</p>'
		                          +  '<ul style="margin-left: 55%; font-size: 2rem; display: flex; list-style-type: none;">'
		                          +  '<li>'
		                          +  '<a onclick="fnAjaxOttSearch(' + (p.currentPage == 1 ? p.maxPage : (p.currentPage - 1)) + ')">'
		                          +  '<i id="left-arrow" class="fa-solid fa-circle-chevron-left" style="cursor: pointer;"></i>' 
		                          +  '</a>'
		                          +  '</li>'
		                          +  '<li>'
		                          +  '<a onclick="fnAjaxOttSearch(' + (p.currentPage == p.maxPage ? 1 : (p.currentPage + 1)) +')">' 
		                          +  '<i id="right-arrow" class="fa-solid fa-circle-chevron-left" style="transform: scaleX(-1); cursor: pointer;"></i>'
		                          +  '</a>'
		                          +  '</li>'
		                          +  '</ul>'
		                          +  '</div>'
		                          +  '<div id="movie1">';
		
		                    for (let i = 0; i < r.length; i++) {
		                        if (count === 0) {
		                            divEl += '<div id="movie1-top">';
		                        }
		                        
		                        divEl += '<div class="movie1-list">'
		                              +  '<div class="movie-image">'
		                              +  '<img src="/mvp'+r[i].titlePath+'">'  // r[i].titlePath 추가해야 함
		                              +  '</div>'
		                              +  '<div class="movie-info">'
		                              +  '<div style="display: flex; align-items: center;">'
		                              +  '<table style="margin-left: 12px; margin-bottom: 7px; margin-top: 7px; width:130px; table-layout: fixed;">'
		                              +  '<tr>'
		                              +  '<td style="color: white; font-weight: 900; font-size: 13px;">'+ r[i].movieTitle +'</td>'
		                              +  '</tr>'
		                              +  '<tr>'
		                              +  '<td>'+ r[i].openDate +'</td>'
		                              +  '</tr>'
		                              +  '<tr>'
		                              +  '<td>장르 : '+ r[i].genre +'</td>'
		                              +  '</tr>'
		                              +  '<tr>'
		                              +  '<td>감독 : '+ r[i].director +'</td>'
		                              +  '</tr>'
		                              +  '</table>'
		                              +  '<i class="fa-regular fa-heart" id="heart"></i>'
		                              +  '</div>'
		                              +  '<div style="display: flex;">'
		                              +  '<button type="button" class="btn btn-secondary" id="info' + r[i].movieNo + '">영화정보</button>'
		                              +  '<button type="button" class="btn btn-danger" id="compare">'
		                              +  '<img src="assets/image/mainPage/download_logo.png" style="width: 14px; height: 14px; margin-right: 5px; margin-bottom: 4px;">비교하기'
		                              +  '</button>'
		                              +  '</div>'
		                              +  '</div>'
		                              +  '</div>';
		                        
		                        count++;
		                        
		                        if (count === 5) {
		                            divEl += '</div>'; // movie1-top 닫기
		                        }
		                        
		                        if (count === 5) {
		                            divEl += '<div id="movie1-bottom">';
		                        }
		                        
		                        if (count === 10) {
		                            divEl += '</div>'; // movie1-bottom 닫기
		                            count = 0;
		                        }
		                    }
		                    divEl += '</div>'; // movie1 닫기
		                    divEl += '</div>'; // 전체 div 닫기
		                }
		            }
		
		            // 결과를 페이지에 반영
		            $('#OTTNoSearch').html(h1El);
		            $('#printOTTMovieList').html(divEl);
					
		            for (let i = 0; i < r.length; i++) {
		                $('#info' + r[i].movieNo).on('click', function() {
		                	
	                    var movieNo = r[i].movieNo; // 현재 영화 번호
	                    console.log('영화정보 버튼이 클릭되었습니다. 영화번호:', movieNo);

				                    $.ajax({
				                        url: "<%=contextPath%>/showDetail.sd", // 서블릿 URL
				                        data: { movieNo: movieNo }, // 영화 번호를 데이터로 전송
				                        success: function(res) {
				                            // 성공적으로 요청이 처리된 후, 페이지 이동
				                            console.log(res);
				                            if(res){
				                                window.location.href = "<%=contextPath%>/showDetail.sd?movieNo=" + movieNo;
				                            }else{
				                            	alert('영화 정보를 불러오는데 실패했습니다.');
				                            }
				                        		
				                        }		
	                        
	                        
	                    });
	                    
	        				});
		            }
		        },
		        error: function() {
		            console.log('영화 검색 ajax 통신 실패');
		        }
		    });
		}
		

					
							

</script>
	<!-- Footer start -->
	<%@ include file="/views/common/footer.jsp"%>
	<!-- Footer end -->
</html>