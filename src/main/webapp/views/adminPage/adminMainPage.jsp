<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="com.mvp.semi.user.model.vo.User" %>
<%@ page import="com.mvp.semi.movie.model.vo.Movie" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- jQuery 먼저 로드 -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    
    <!-- Popper.js 로드 -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    
    <!-- Bootstrap CSS 로드 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    
    <!-- Bootstrap JS 로드 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- 커스텀 CSS 로드 -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/views/adminPage/css/adminMainPage.css">
    
  <!-- 모달 css -->
	<style> 
	body{
	    	font-family: pretendard;
	    	font-weight: bold;
	    	width: 1280px;
	    }
	#myModal{
	    width: 760px;
	    height: 900px;
	    margin-left: 580px;
	    overflow: hidden;
	}
	#modal-body{
	    width: 708px;
	    height: 694px;
	}
	.modal-checkbox-list{
	  width: 805px;
	  height: 30px;
	  font-size: 13px;
	  display: flex;
	  gap: 26px;
	  flex-direction: row;
	  margin-left: 60px;
	}
	.modal-body-bottom{
	  width: 691px;
	  height: 434px;
	  display: flex;
	  margin-top: 20px;
	}
	.modal-body-bottom input{
		width: 200px;
		height: 20px;
	}
	.modal-body-bottom-left{
	  width: 340px;
	  height: 184px;
	  display: flex;
	  flex-direction: column;
	  gap: 20px;
	  font-size: 14px;
	  margin-top: 20px;
	}
	#bottom-left-title{
		
	}
	.modal-body-bottom-right{
	  width: 278px;
	  height: 184px;
	  display: flex;
	  flex-direction: column;
	  gap: 20px;
	  font-size: 14px;
	  margin-top: 20px;
	}
	.modal-content{
	  border: 2px solid #2F80ED;
	}
	.modal-footer{
	  margin-bottom: 30px;
	}
	.img-preview {border: 1px solid lightgray}
	.title-img {width: 150px; height:180px;}
	.content-img {width: 300px; height: 150px;}
	.movieTitle{fontsize: 20px;}
	</style>
</head>

<body>

	<%
		// web
    String contextPath = request.getContextPath();
		// alertMsg
		String alertMsg = (String)session.getAttribute("alertMsg");

		// Movie
		User loginUser = (User)session.getAttribute("loginUser");
	 %>
	<% if(alertMsg !=null) { %>
		<script>
		 alert('<%= alertMsg %>');
		</script>
	<% session.removeAttribute("alertMsg"); } %>
	
	

	    <div id="main">
	      <div id="head">
	         <div id="mvp_logo">
           	 <img src="<%=contextPath%>/assets/image/adminPage/moviepick_logo.png" style="margin-left: 366px;">
	         </div>
	         <div style="display: flex; align-items: center;">
		       	 <img src="<%=contextPath%>/assets/image/adminPage/home_logo.png" style="margin-right: 15px;">
		         <a href="<%=contextPath%>"><img src="<%=contextPath%>/assets/image/adminPage/moviepick_logo.png" style="margin-right: 50px; width: 80px;"></a>
		         <img src="<%=contextPath%>/assets/image/adminPage/logout_logo.png" style="margin-right: 15px;">
		         <span onclick="fnlogout()">로그아웃</span>
	         </div> 
	      </div> <!-- head div 끝 -->  
	      
        <div id="body">
          <div id="body-left">  
   
          </div> <!-- body-left div 끝 -->
	
         	<div id="body-right">
            <div id="body-right-title">
              <span>영화관리</span>
              <div style="width: 289px; height: 32px;">
                <img src="<%=contextPath%>/assets/image/adminPage/user_logo.png">
                <span><%=loginUser.getUserNick()%> 관리자님 환영합니다.</span>
              </div>
            </div><!-- body-right-title div 끝 -->
            
	          <hr style="border: 2px solid #959595; width: 1074px; margin: 0%;">
	          
          	<div id="body-main">
		          <table class="table table-bordered" id="search-area">
		            <tbody>
		              <tr>
		                <td class="table-title">등록날짜</td>
		                <td style="display: flex; gap: 20px; width: 902px; height: 57px;">
		                <input type="date" class="form-control" id="startDate"> <hr>
		                <input type="date" class="form-control" id="endDate"></td>
		              </tr> 
		              <tr>
		                <td class="table-title">장르</td>
		                <td style="padding: 0%;">
		                  <div class="checkbox-list" style="margin-top: 5px; margin-left: 60px;">
		                    <label style="display: flex; align-items: center;">
		                      <input type="checkbox" class="form-check-input" value="액션">액션
		                    </label>
		                    <label style="display: flex; align-items: center;">
		                      <input type="checkbox" class="form-check-input" value="범죄">범죄
		                    </label>
		                    <label style="display: flex; align-items: center;">
		                      <input type="checkbox" class="form-check-input" value="SF">SF
		                    </label>
		                    <label style="display: flex; align-items: center;">
		                      <input type="checkbox" class="form-check-input" value="코미디">코미디
		                    </label>
		                    <label style="display: flex; align-items: center;">
		                      <input type="checkbox" class="form-check-input" value="슬랩스틱">슬랩스틱
		                    </label>
		                    <label style="display: flex; align-items: center;">
		                      <input type="checkbox" class="form-check-input" value="로맨스">로맨스
		                    </label>
		                    <label style="display: flex; align-items: center;">
		                      <input type="checkbox" class="form-check-input" value="멜로">멜로
		                    </label>
		                  </div>
		                  <div class="checkbox-list" style="margin-top: 3px; margin-left: 60px;">
		                    <label style="display: flex; align-items: center;">
		                      <input type="checkbox" class="form-check-input" value="공포">공포
		                    </label>
		                    <label style="display: flex; align-items: center;">
		                      <input type="checkbox" class="form-check-input" value="스릴러">스릴러
		                    </label>
		                    <label style="display: flex; align-items: center;">
		                      <input type="checkbox" class="form-check-input" value="전쟁">전쟁
		                    </label>
		                    <label style="display: flex; align-items: center;">
		                      <input type="checkbox" class="form-check-input" value="스포츠">스포츠
		                    </label>
		                    <label style="display: flex; align-items: center;">
		                      <input type="checkbox" class="form-check-input" value="판타지">판타지
		                    </label>
		                    <label style="display: flex; align-items: center;">
		                      <input type="checkbox" class="form-check-input" value="음악">음악
		                    </label>
		                    <label style="display: flex; align-items: center;">
		                      <input type="checkbox" class="form-check-input" value="뮤지컬">뮤지컬
		                    </label>
		                  </div>
		                </td>
		              </tr>
		              <tr>
	                	<td class="table-title">검색</td> 
		                <td style="display: flex;">
		                  <input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요." style="width: 311px; height: 31px; font-size: 14px;">
		                  <button id="search">검색</button>
		                  <button id="reset" onclick="resetSearchData();">초기화</button>
		                </td>
		              </tr>
	            	</tbody>
	            </table>
	          
	          	<form action="<%=contextPath%>/movieDelete.md" method="post">
            		<div id="body-main-list">
            		
			            <div id="list-category">
			              <div class="show-movie tabActive" id="showMovieTab">상영중인 영화</div>
			              <div class="ott-movie" id="ottMovieTab">OTT 영화</div>
			              <button type="button" style="background-color: #2F80ED; margin-left: 525px;"  data-toggle="modal" data-target="#insert-movie" >+ 등록</button>
			              <button type="submit" style="background-color: #F25858; margin-left: 15px;">- 삭제</button>
			            </div>
                    
		              <div id="list-head">
		                <div style="width: 64px; height: 18px;"><input type="checkbox" id="checkAll" style="width: 18px; height: 18px; margin-left: 46px;"></div>
		                <div style="margin-left: 58px;">NO</div>
		                <div style="margin-left: 85px;">제목</div>
		                <div style="margin-left: 526px;">등급</div>
		                <div style="margin-left: 167px;">개봉일</div>
		              </div>       
              
		              <table id="movie-list">
		              </table>
		              
		            </div> <!-- body-main-list div 끝 -->
		            <ul id="paging-bar" class="pagination d-flex justify-content-center" style="margin-top: 20px; cursor: pointer;"  >
		            	
		            </ul>
            	</form> <!-- form 내의 삭제 버튼 ==> movieDelete.md -->    
            </div> <!-- body-main div 끝 -->
        	</div> <!-- body-right 끝 -->
        </div> <!-- body div 끝 -->
  		</div> <!-- main div 끝 -->
	            
	            <!-- 사용자가 현재보고있는 페이지에 따라서 다르게 보여질 페이징바 추가하기 -->
								<script>
								
								$(function(){
									$("#search").on("click", function(){ // 검색버튼 클릭시
										// 현재활성화 되어있는 탭의 function을 호출 
										if($('#showMovieTab').hasClass("tabActive")){
											showingMovieList(1);
										}else{
											ottMovieList(1);
										}
									})
									
									$("#showMovieTab").on("click", function(){
										$(this).addClass("tabActive");
										$(this).next().removeClass("tabActive");
										
										
										resetSearchData(); // 검색 데이터 초기화

										
										showingMovieList(1);
									})
									
									$("#ottMovieTab").on("click", function(){
										$(this).addClass("tabActive");
										$(this).prev().removeClass("tabActive");
										
										
										resetSearchData(); // 검색 데이터 초기화

										
										ottMovieList(1);
									})
									
								})
								
								
								
								// 클릭시 상영중인 영화 조회
									function showingMovieList(page) {
										
										let genreList = [];
										$("#search-area :checkbox").each(function(){
											if($(this).prop("checked")){
												genreList.push($(this).val())
											}
										})
									
										$.ajax({
														url : '<%=contextPath%>/showing.mv',
														data: {
															// 페이지정보
															page: page,
															// 검색데이터
															startDate: $("#startDate").val(), 
														  endDate: $("#endDate").val(),
														  genre: genreList.toString(),
														  keyword: $("#keyword").val()
														},
														success: function(res){
															console.log(res);
															// res :  {pi: {}, list: [{}, {}]}
														  // res.pi : PageInfo 객체 즉, {listCount:xx, currentPage:xx, ...}
															// res.list : List<Movie> 객체 즉, [{movieNo:xx, movieTitle:xx}, {movieNo:xx, movieTitle:xx}]
																		
																		let divEl = '';
																		
																			for(let i = 0; i < res.list.length; i++){
																				divEl += '<tr onclick="checkMovie(event);">'
																									+ '<td class="list-content">'
																										 + '<div><input type="checkbox" class="list-checkbox" style="width: 18px; height: 18px; margin-left: 46px;" name="movieNo" value="' + res.list[i].movieNo + '"></div>'
																										 + '<div class="list-num">' + res.list[i].movieNo + '</div>'
																										 + '<div class="list-title" data-toggle="modal" data-target="#modify-movie">' + res.list[i].movieTitle + '</div>'
																										 + '<div class="list-ageLv">' + res.list[i].ageLv + '</div>'
																										 + '<div class="list-date">' + res.list[i].openDate + '</div>'
																									+ '</td>'	 	 
																							 + '</tr>'; 
																	}
																			/*
																						 for(i = 0; i < 12-res.length; i++){
																			divEl += '<tr>'
																								+ '<td class="list-content">'
																									 + '<div class="list-num"></div>'
																									 + '<div class="list-title"></div>'
																									 + '<div class="list-ageLv"></div>'
																									 + '<div class="list-date"></div>'
																								+ '</td>'	 	 
																					 + '</tr>';
																						 }
																		*/
																		let liEl = '';
																    
																		liEl += '<li class="page-item ' + (res.pi.currentPage === 1 ? "disabled" : "") + '">'
																	       + '<a class="page-link" onclick="showingMovieList(' + (res.pi.currentPage - 1) + ')">&laquo;</a>'
																	       + '</li>';

																	// 페이지 번호
																	for (let i = res.pi.startPage; i <= res.pi.endPage; i++) {
																	    liEl += '<li class="page-item ' + (i === res.pi.currentPage ? "active" : "") + '">'
																	         + '<a class="page-link" onclick="showingMovieList(' + i + ')">' + i + '</a>'
																	         + '</li>';
																	}

																	// 다음 페이지로 가는 버튼
																	liEl += '<li class="page-item ' + (res.pi.currentPage === res.pi.maxPage ? "disabled" : "") + '">'
																	       + '<a class="page-link" onclick="showingMovieList(' + (res.pi.currentPage < res.pi.maxPage ? (res.pi.currentPage + 1) : res.pi.maxPage) + ')">&raquo;</a>'
																	       + '</li>';

																         
																         $('#paging-bar').html(liEl);
																    			
																		// 페이징바도 제작
																		// 페이징바 제작시 해당 페이지 클릭시 다시 showingMovieList(클릭한페이지번호);
																		
																						 
															$('#movie-list').html(divEl);
															$('#movie-list tr:odd').css('background-color', '#f0f0f0');
														},
														error: function(){
															console.log("실패");
														}
										})
									}
									
									// 클릭 시 ott 영화 조회
									function ottMovieList(page) {

										let genreList = [];
										$("#search-area :checkbox").each(function(){
											if($(this).prop("checked")){
												genreList.push($(this).val())
											}
										})
										
										$.ajax({
														url : '<%=contextPath%>/ott.mv',
														data : {
															page : page,
															/*검색관련*/
															startDate: $("#startDate").val(), 
														  endDate: $("#endDate").val(),
														  genre: genreList.toString(),
														  keyword: $("#keyword").val()
														},
														success: function(res){
														console.log(res);				
																		let divEl = '';
																		
																		for(let i = 0; i < res.list.length; i++){
																			divEl += '<tr onclick="checkMovie(event);">'
																									+ '<td class="list-content">'
																										 + '<div><input type="checkbox" class="list-checkbox" style="width: 18px; height: 18px; margin-left: 46px; name="movieNo" value="' + res.list[i].movieNo + '"></div>'
																										 + '<div class="list-num">' + res.list[i].movieNo + '</div>'
																										 + '<div class="list-title" data-toggle="modal" data-target="#modify-movie">' + res.list[i].movieTitle + '</div>'
																										 + '<div class="list-ageLv">' + res.list[i].ageLv + '</div>'
																										 + '<div class="list-date">' + res.list[i].openDate + '</div>'
																									+ '</td>'	 
																						 + '</tr>';
																		}
																		
																		
																		
																		let liEl = '';
																	    
																		liEl += '<li class="page-item ' + (res.pi.currentPage === 1 ? "disabled" : "") + '">'
																	       + '<a class="page-link" onclick="ottMovieList(' + (res.pi.currentPage - 1) + ')">&laquo;</a>'
																	       + '</li>';

																	// 페이지 번호
																	for (let i = res.pi.startPage; i <= res.pi.endPage; i++) {
																	    liEl += '<li class="page-item ' + (i === res.pi.currentPage ? "active" : "") + '">'
																	         + '<a class="page-link" onclick="ottMovieList(' + i + ')">' + i + '</a>'
																	         + '</li>';
																	}

																	// 다음 페이지로 가는 버튼
																	liEl += '<li class="page-item ' + (res.pi.currentPage === res.pi.maxPage ? "disabled" : "") + '">'
																	       + '<a class="page-link" onclick="ottMovieList(' + (res.pi.currentPage < res.pi.maxPage ? (res.pi.currentPage + 1) : res.pi.maxPage) + ')">&raquo;</a>'
																	       + '</li>';

																         
																         $('#paging-bar').html(liEl);
																		
																		
															$('#movie-list').html(divEl);
															$('#movie-list tr:odd').css('background-color', '#f0f0f0');
														},
														error: function(){
															console.log("실패");
														}
										})
									}
									
									window.addEventListener('load', function(){
										showingMovieList(1);
									});
									
									function checkMovie(event){
										$.ajax({
														url: '<%=contextPath%>/movieSelect.ms',
														data: {
																	movieNo: $(event.currentTarget).find('.list-num').text()
														},
														success: function(res){
															//console.log(res);
															
															// 수정 시 영화 번호 조회용
															$('#hiddenNo').val(res.movieNo);
															const hiddenNo = $('#hiddenNo').val();
															
															$('#movieTitle').val(res.movieTitle);
															$('#movieContent').val(res.movieContent);
															
															const genreArr = res.genre.split(',');
															
															$('.genre').each(function(){
																
														    if (genreArr.includes($(this).val())) {
														        $(this).prop('checked', true); // 체크박스 선택
														    } else {
														        $(this).prop('checked', false); // 체크박스 해제
														    }
														    
															});
															
															$('#taste-no-modify').val(res.tasteNo);
															$('#openDate').val(res.openDate);
												      $('#movie-level-modify').val(res.ageLv); 
															$('#director').val(res.director);
															$('#actor').val(res.actor);
															$('#preview').val(res.preview);
															// 메인이미지
															$('#playtime').val(res.playTime);									
															$('#country').val(res.country);
															$('#audienceCount').val(res.audienceCount);
															$('#movie-status-modify').val(res.status);
															$('#grade').val(res.grade);
															// 상세이미지 $('#img-preview').prop('src', res.contentPath);
															console.log(res.movieNo);
															console.log('히든넘버 : ' + hiddenNo);
														}
										})
									}
									
									// 동적으로 만들어진 영화 목록 tr 요소에 클릭이벤트 발생시 
									// ajax로 해당 영화정보 조회 요청 보내기 (이때 조회된 데이터를 응답데이터로 받기)
									/*
										$.ajax({
											url: ,
											data: {조회할영화번호},
											success:function(res){ // res에는 영화정보 담긴 객체가 응답데이터로 돌아와서 담김
												console.log(res);   // {key:value, ..}
												
												수정모달창에 각각의 input 요소 선택해서 value속성값으로 res의 영화 정보값을 뿌리기
												
											}
										})
										
									*/
									
										// 체크박스 전체 선택
										document.getElementById('checkAll').addEventListener('change', function(){
										
										const allChecked = this.checked;
										
										const checkboxes = document.querySelectorAll('.list-checkbox');
										
										checkboxes.forEach(function(cbox){
											cbox.checked = allChecked;
										});
									});
									
									/*
									function deleteMovie (){
										
										const checkedbox = $('.list-checkbox:checked');
										
										const checkedMovieNo = $(checkedbox).closest('tr').find('.list-num').text();
										

										location.href="<%=contextPath%>/movieDelete.md?movieNo=" + checkedMovieNo;
									}
									*/
									
									// 검색 영역의 데이터 초기화
									function resetSearchData(){
										$("#startDate").val("");
										$("#endDate").val("");
										$("#search-area :checkbox").each(function(){
											$(this).prop("checked", false);
										})
										$("#keyword").val("");
									}
								</script>


	
	
		
			
			
			<form action="<%=contextPath%>/movieInsert.mi" method="post" enctype="multipart/form-data">	
			<!-- 영화 등록 화면 (모달) -->
			<div class="modal" id="insert-movie">
	     <div class="modal-dialog modal-xl" style="width: 760px; height: 900px;">
	    
     	 	<div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <div> <hr style="width: 4px; height: 20px; background-color: #2F80ED; margin: 0%; margin-top: 5px;"> </div>
	          <div> <h4 class="modal-title" style="margin-right: 640px; font-size: 20px;">영화등록</h4> </div>  
	        </div>
	        
	        
	        <!-- Modal body -->
	        <div class="modal-body" style="width: 708px; height: 694px;">  
	          <div class="modal-body-top" style="width: 708px; height: 254px;">
	            <div style="display: flex;">
	              <p style="width: 60px; font-size: 14px;">영화제목</p>
	              <input type="text" class="form-control" name="movie-title" placeholder="영화제목을 입력하세요." style="width: 630px; height: 20px; margin-left: 20px; font-size: 10px;">
	            </div>
	            <div style="display: flex;">
	              <p style="width: 60px; font-size: 14px;">영화소개</p>
	              <input type="text" class="form-control" name="movie-content" placeholder="영화소개를 입력하세요." style="width: 630px; height: 126px; margin-left: 20px; font-size: 10px;">
	            </div>
	            <div style="display: flex; flex-direction: column;"> <!-- 장르 div 시작 -->
	              <p style="width: 60px; font-size: 14px;">장르</p>
	              <div class="modal-checkbox-list" style="margin-top: 5px;">
	                <div style="width: 55px; height: 17px;">
	                  <label style="display: flex; align-items: center;">
	                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" name="genre" value="액션">액션
	                  </label>
	                </div>
	                <div style="width: 55px; height: 17px;">
	                  <label style="display: flex; align-items: center;">
	                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" name="genre" value="범죄">범죄
	                  </label>
	                </div>
	                <div style="width: 55px; height: 17px;">
	                  <label style="display: flex; align-items: center;">
	                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" name="genre" value="SF">SF
	                  </label>
	                </div>
	                <div style="width: 55px; height: 17px;">
	                  <label style="display: flex; align-items: center;">
	                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" name="genre" value="코미디">코미디
	                  </label>
	                </div>
	                <div style="width: 55px; height: 17px;">
	                  <label style="display: flex; align-items: center;">
	                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" name="genre" value="슬랩스틱">슬랩스틱
	                  </label>
	                </div>
	                <div style="width: 55px; height: 17px;">  
	                  <label style="display: flex; align-items: center;">
	                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" name="genre" value="로맨스">로맨스
	                  </label>
	                </div>
	                <div style="width: 55px; height: 17px;">  
	                  <label style="display: flex; align-items: center;">
	                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" name="genre" value="멜로">멜로
	                  </label>
	                </div>

	                <div>
	                	<div style="width: 42px; height: 17px; margin-bottom: 5px;"><p>취향</p></div>
		                <select id="taste-no-insert" class="form-select" name="taste">
		                  <option value="10">NDHE</option>
		                  <option value="20">VDSE</option>
		                  <option value="30">SPTF</option>
		                  <option value="40">BOFA</option>
		                  <option value="50">ETRF</option>
		                  <option value="60">CCFE</option>
		                  <option value="70">CAES</option>
		                  <option value="80">HHAL</option>
		                </select>
	                </div>
              	</div>
              	
	              <div class="modal-checkbox-list" style="margin-top: 3px;">
	                <div style="width: 55px; height: 17px;">
	                  <label style="display: flex; align-items: center;">
	                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" name="genre" value="공포">공포
	                  </label>
	                </div>
	                <div style="width: 55px; height: 17px;">
	                  <label style="display: flex; align-items: center;">
	                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" name="genre" value="스릴러">스릴러
	                  </label>
	                </div>
	                <div style="width: 55px; height: 17px;">  
	                  <label style="display: flex; align-items: center;">
	                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" name="genre" value="전쟁">전쟁
	                  </label>
	                </div>
	                <div style="width: 55px; height: 17px;">  
	                  <label style="display: flex; align-items: center;">
	                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" name="genre" value="스포츠">스포츠
	                  </label>
	                </div>
	                <div style="width: 55px; height: 17px;">  
	                  <label style="display: flex; align-items: center;">
	                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" name="genre" value="판타지">판타지
	                  </label>
	                </div>
	                <div style="width: 55px; height: 17px;">  
	                  <label style="display: flex; align-items: center;">
	                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" name="genre" value="음악">음악
	                  </label>
	                </div>
	                <div style="width: 55px; height: 17px;">  
	                  <label style="display: flex; align-items: center;">
	                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" name="genre" value="뮤지컬">뮤지컬
	                  </label>
	                </div>  
	              </div> <!-- modal-checkbox-list(2) div 끝 -->
	            </div> <!-- 장르 div 끝 -->
	          </div> <!-- modal-body-top div 끝 -->
	          
	          <!-- modal-body-bottom div 시작 -->
	          <div class="modal-body-bottom">
	            <div class="modal-body-bottom-left">
	              <div style="display: flex; gap: 30px; text-align: center;">
	                <div style="width: 42px; height: 17px;"><p style="margin-bottom: 10px;">개봉일</p></div>
	                <input type="date" class="form-control" name="open-date">
	              </div>
	              <div style="display: flex; gap: 30px;">
	                <div style="width: 42px; height: 17px;"><p style="margin-bottom: 10px;">등급</p></div>
	                <select id="movie-level-insert" class="form-select" name="age-level">
	                  <option value="전체관람가">전체관람가</option>
	                  <option value="12세이상관람가">12세이상관람가</option>
	                  <option value="15세이상관람가">15세이상관람가</option>
	                  <option value="청소년관람불가">청소년관람불가</option>
	                </select>
	              </div>
	              <div style="display: flex; gap: 30px;">
	                <div style="width: 42px; height: 17px;"><p>감독</p></div>
	                <input type="text" class="form-control" name="director" placeholder="감독명">
	              </div>
	              <div style="display: flex; gap: 30px;">
	                <div style="width: 42px; height: 17px;"><p>출연진</p></div>
	                <input type="text" class="form-control" name="actor" placeholder="출연진명( ,로 구분 )">
	              </div>
	              <div style="display: flex; gap: 30px; width: 600px">
	                <div style="width: 42px; height: 17px;"><p>예고편</p></div>
	                <input type="text" class="form-control" name="preview" placeholder="링크입력">
	              </div>
	              <div style="width: 270px; height: 169px; display: flex; gap: 20px;">
	                <div style="width: 62px; height: 20px;"><p>메인이미지</p></div>
	                <img class="img-preview title-img" onclick="chooseFile(0);">
	              </div>
	            </div> <!-- modal-body-bottom-left div 끝 -->
	            
	            <div class="modal-body-bottom-right">
	              <div style="display: flex; gap: 20px;">
	                <div style="width: 60px; height: 17px;"><p>재생시간</p></div>
	                <input type="text" class="form-control" name="playtime" style="width: 200px; height: 20px;" placeholder="재생시간(분 단위)">
	              </div>
	              <div style="display: flex; gap: 20px;">
	                <div style="width: 60px; height: 17px;"><p>제작국가</p></div>
	                <input type="text" class="form-control" name="country" style="width: 200px; height: 20px;" placeholder="국가명">
	              </div>
	              <div style="display: flex; gap: 20px;">
	                <div style="width: 60px; height: 17px;"><p>관객수</p></div>
	                <input type="text" class="form-control" name="audience" style="width: 200px; height: 20px;" placeholder="관객수(만 단위)">
	              </div>
	              <div style="display: flex; gap: 30px;">
	              	<div style="width: 42px; height: 17px;"><p>상태</p></div>
	                <select id="movie-status-insert" class="form-select" name="movie-status">
	                  <option value="10">현재상영중인영화</option>
	                  <option value="20">OTT영화</option>
	                </select>
	              </div>
	              <div style="display: flex; gap: 30px;">
	              	<p style="margin: 0%">평점</p>
	              	<input type="text" class="form-control" name="grade" style="width: 200px; height: 20px;" placeholder="네이버평점(0.0)">
	              </div>
	              <div style="margin-bottom: 20px;">
	                <p style="margin-bottom: 5px">상세이미지</p>
	                <img class="img-preview content-img" onclick="chooseFile(1);">
	              </div>
	            </div> 
	          </div> <!-- modal-body-bottom div 끝 -->
	        </div> <!-- modal-body div 끝 -->
	        
	        <div style="display: none;">
	        	<input type="file" name="title-image" onchange="loadImg(0);" required> <!-- 메인이미지 -->
	        	<input type="file" name="content-image" onchange="loadImg(1);" required> <!-- 상세이미지 -->
	        </div>
	        
	        <script>
	        
	        // 첨부파일 function
	        	function chooseFile(idx){
	        			$(':File').eq(idx).click();
	        	}
	        	
	        	function loadImg(idx){
	        		const inputFile = window.event.target;
	        		
	        		if(inputFile.files.length == 1) {
	        			const reader = new FileReader();
	        			reader.readAsDataURL(inputFile.files[0]);
	        			
	        			reader.onload = function(evt) {
	        				$('.img-preview').eq(idx).prop('src', evt.target.result);
	        			}
	        		}else{ 
	          			$('.img-preview').eq(idx).prop('src', null);
	          		}
	        	}
	        	
	        	/*
	        		// sidebar에서 각 탭 선택시 해당 페이지로 이동하는 function
	        		const sidebarDivs = document.querySelectorAll('#sidebar div');
	        		
	        		sidebarDivs.forEach(div => {
	        			div.addEventListener('click', function() {
	        				
	        				const chooseSidebar = this.getAttribute('name'); // sidebar 내의 각 div의 name값 담기
	        				// console.log(chooseSidebar);
	        				
	        				window.location.href = "<%=contextPath%>/views/adminPage/" + chooseSidebar + ".jsp";
	        				this.style.backgroundColor ="#D2E5FF";
	        			})
	        		})
	        		*/
	        	
	        </script>
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <div style="display: flex; gap: 196px; margin-right: 202px;">
	            <button type="submit" class="btn btn-primary" style="width: 80px;">등록</button>
	            <button type="button" class="btn btn-secondary" data-dismiss="modal">창 닫기</button>
	          </div>
	        </div>
	        
	      </div> <!-- modal-content div 끝 -->
	     </div>
	 		</div> <!-- modal div 끝 -->
		</form>
		
						<!-- 영화 조회 및 수정 화면 (모달) -->
			<form action="<%=contextPath%>/movieModify.mm" method="post" enctype="multipart/form-data">
			<input id="hiddenNo" type="hidden" name="no">
			 <div class="modal" id="modify-movie">
			    <div class="modal-dialog modal-xl" style="width: 760px; height: 900px;">
			    
			      <div class="modal-content">
			      
			        <!-- Modal Header -->
			        <div class="modal-header">
			          <div> <hr style="width: 4px; height: 20px; background-color: #2F80ED; margin: 0%; margin-top: 5px;"> </div>
			          <div> <h4 class="modal-title" style="margin-right: 580px; font-size: 20px;">영화 조회 및 수정</h4> </div>  
			        </div>
			        
			        
			        <!-- Modal body -->
			        <div class="modal-body" style="width: 708px; height: 694px;">  
			          <div class="modal-body-top" style="width: 708px; height: 254px;">
			            <div style="display: flex;">
			              <p style="width: 60px; font-size: 14px;">영화제목</p>
			              <input type="text" class="form-control" id="movieTitle" name="movie-title" style="width: 630px; height: 20px; margin-left: 20px;">
			            </div>
			            <div style="display: flex;">
			              <p style="width: 60px; font-size: 14px;">영화소개</p>
			              <input type="text" class="form-control" id="movieContent" name="movie-content" style="width: 630px; height: 126px; margin-left: 20px;">
			            </div>
			            <div style="display: flex; flex-direction: column;"> <!-- 장르 div 시작 -->
			              <p style="width: 60px; font-size: 14px;">장르</p>
			              <div class="modal-checkbox-list" style="margin-top: 5px;">
			                <div style="width: 55px; height: 17px;">
			                  <label style="display: flex; align-items: center;">
			                    <input type="checkbox" class="form-check-input genre" style="width: 18px; height: 18px;" name="genre" value="액션">액션
			                  </label>
			                </div>
			                <div style="width: 55px; height: 17px;">
			                  <label style="display: flex; align-items: center;">
			                    <input type="checkbox" class="form-check-input genre" style="width: 18px; height: 18px;" name="genre" value="범죄">범죄
			                  </label>
			                </div>
			                <div style="width: 55px; height: 17px;">
			                  <label style="display: flex; align-items: center;">
			                    <input type="checkbox" class="form-check-input genre" style="width: 18px; height: 18px;" name="genre" value="SF">SF
			                  </label>
			                </div>
			                <div style="width: 55px; height: 17px;">
			                  <label style="display: flex; align-items: center;">
			                    <input type="checkbox" class="form-check-input genre" style="width: 18px; height: 18px;" name="genre" value="코미디">코미디
			                  </label>
			                </div>
			                <div style="width: 55px; height: 17px;">
			                  <label style="display: flex; align-items: center;">
			                    <input type="checkbox" class="form-check-input genre" style="width: 18px; height: 18px;" name="genre" value="슬랩스틱">슬랩스틱
			                  </label>
			                </div>
			                <div style="width: 55px; height: 17px;">  
			                  <label style="display: flex; align-items: center;">
			                    <input type="checkbox" class="form-check-input genre" style="width: 18px; height: 18px;" name="genre" value="로맨스">로맨스
			                  </label>
			                </div>
			                <div style="width: 55px; height: 17px;">  
			                  <label style="display: flex; align-items: center;">
			                    <input type="checkbox" class="form-check-input genre" style="width: 18px; height: 18px;" name="genre" value="멜로">멜로
			                  </label>
			                </div>
			                <div>
			                	<div style="width: 42px; height: 17px; margin-bottom: 5px;"><p>취향</p></div>
					                <select id="taste-no-modify" class="form-select" name="taste">
					                  <option value="10">NDHE</option>
					                  <option value="20">VDSE</option>
					                  <option value="30">SPTF</option>
					                  <option value="40">BOFA</option>
					                  <option value="50">ETRF</option>
					                  <option value="60">CCFE</option>
					                  <option value="70">CAES</option>
					                  <option value="80">HHAL</option>
					                </select>
			                	</div>
			              </div>
			              <div class="modal-checkbox-list" style="margin-top: 3px;">
			                <div style="width: 55px; height: 17px;">
			                  <label style="display: flex; align-items: center;">
			                    <input type="checkbox" class="form-check-input genre" style="width: 18px; height: 18px;" name="genre" value="공포">공포
			                  </label>
			                </div>
			                <div style="width: 55px; height: 17px;">
			                  <label style="display: flex; align-items: center;">
			                    <input type="checkbox" class="form-check-input genre" style="width: 18px; height: 18px;" name="genre" value="스릴러">스릴러
			                  </label>
			                </div>
			                <div style="width: 55px; height: 17px;">  
			                  <label style="display: flex; align-items: center;">
			                    <input type="checkbox" class="form-check-input genre" style="width: 18px; height: 18px;" name="genre" value="전쟁">전쟁
			                  </label>
			                </div>
			                <div style="width: 55px; height: 17px;">  
			                  <label style="display: flex; align-items: center;">
			                    <input type="checkbox" class="form-check-input genre" style="width: 18px; height: 18px;" name="genre" value="스포츠">스포츠
			                  </label>
			                </div>
			                <div style="width: 55px; height: 17px;">  
			                  <label style="display: flex; align-items: center;">
			                    <input type="checkbox" class="form-check-input genre" style="width: 18px; height: 18px;" name="genre" value="판타지">판타지
			                  </label>
			                </div>
			                <div style="width: 55px; height: 17px;">  
			                  <label style="display: flex; align-items: center;">
			                    <input type="checkbox" class="form-check-input genre" style="width: 18px; height: 18px;" name="genre" value="음악">음악
			                  </label>
			                </div>
			                <div style="width: 55px; height: 17px;">  
			                  <label style="display: flex; align-items: center;">
			                    <input type="checkbox" class="form-check-input genre" style="width: 18px; height: 18px;" name="genre" value="뮤지컬">뮤지컬
			                  </label>
			                </div>  
			              </div>
			            </div> <!-- 장르 div 끝 -->
			          </div> <!-- modal-body-top div 끝 -->
			          
			          <!-- modal-body-bottom div 시작 -->
			          <div class="modal-body-bottom">
			            <div class="modal-body-bottom-left">
			              <div style="display: flex; gap: 30px; text-align: center;">
			                <div style="width: 42px; height: 17px;"><p style="margin-bottom: 10px;">개봉일</p></div>
			                <input type="date" id="openDate" class="form-control" name="open-date">
			              </div>
			              <div style="display: flex; gap: 30px;">
			                <div style="width: 42px; height: 17px;"><p style="margin-bottom: 10px;">등급</p></div>
			                <select class="form-select" name="age-level" id="movie-level-modify">
			                  <option value="전체관람가">전체관람가</option>
			                  <option value="12세이상관람가">12세이상관람가</option>
			                  <option value="15세이상관람가">15세이상관람가</option>
			                  <option value="청소년관람불가">청소년관람불가</option>
			                </select>
			              </div>
			              <div style="display: flex; gap: 30px;">
			                <div style="width: 42px; height: 17px;"><p>감독</p></div>
			                <input type="text" id="director" class="form-control" name="director">
			              </div>
			              <div style="display: flex; gap: 30px;">
			                <div style="width: 42px; height: 17px;"><p>출연진</p></div>
			                <input type="text" id="actor" class="form-control" name="actor">
			              </div>
			              <div style="display: flex; gap: 30px; width: 600px">
			                <div style="width: 42px; height: 17px;"><p>예고편</p></div>
			                <input type="text" id="preview" class="form-control" name="preview">
			              </div>
			              <div style="width: 270px; height: 169px; display: flex; gap: 20px;">
			                <div style="width: 62px; height: 20px;"><p>메인이미지</p></div>
			                <img class="img-preview title-img" onclick="chooseFile(0);">
			              </div>
			            </div> <!-- modal-body-bottom-left div 끝 -->
			            
			            <div class="modal-body-bottom-right">
			              <div style="display: flex; gap: 20px;">
			                <div style="width: 60px; height: 17px;"><p>재생시간</p></div>
			                <input type="text" id="playtime" class="form-control" name="playtime" style="width: 200px; height: 20px;">
			              </div>
			              <div style="display: flex; gap: 20px;">
			                <div style="width: 60px; height: 17px;"><p>제작국가</p></div>
			                <input type="text" id="country" class="form-control" name="country" style="width: 200px; height: 20px;">
			              </div>
			              <div style="display: flex; gap: 20px;">
			                <div style="width: 60px; height: 17px;"><p>관객수</p></div>
			                <input type="text" id="audienceCount" class="form-control" name="audience" style="width: 200px; height: 20px;">
			              </div>
			              <div style="display: flex; gap: 30px;">
			              	<div style="width: 42px; height: 17px;"><p>상태</p></div>
			                <select id="movie-status-modify" class="form-select" name="movie-status">
			                  <option value="10">현재상영중인영화</option>
			                  <option value="20">OTT영화</option>
			                </select>
			              </div>
			              <div style="display: flex; gap: 30px;">
			              	<p style="margin: 0%">평점</p>
			              	<input type="text" id="grade" class="form-control" name="grade" style="width: 200px; height: 20px;">
			              </div>
			              <div style="margin-bottom: 20px;">
			                <p style="margin-bottom: 5px">상세이미지</p>
			                <img class="img-preview content-img" onclick="chooseFile(1);">
			              </div>
			            </div>  <!-- modal-body-bottom-right div 끝 -->
			          </div> <!-- modal-body-bottom div 끝 -->
			        </div> <!-- modal-body div 끝 -->
			       
			        
			        <script>
			        // 이미지 미리보기 함수
				        	function chooseFile(idx){
			        			$(':File').eq(idx).click();
			        	}
			        	
			        	function loadImg(idx){
			        		const inputFile = window.event.target;
			        		
			        		if(inputFile.files.length == 1) {
			        			const reader = new FileReader();
			        			reader.readAsDataURL(inputFile.files[0]);
			        			
			        			reader.onload = function(evt) {
			        				$('.img-preview').eq(idx).prop('src', evt.target.result);
			        			}
			        		}else{ 
			          			$('.img-preview').eq(idx).prop('src', null);
			          		}
			        	}
			        	
			        	function fnlogout() {
			        	    window.location.href = '<%=contextPath%>/logout.us';
			        	}
			        	
		        	</script>
			        <!-- Modal footer -->
			        <div class="modal-footer">
			          <div style="display: flex; gap: 196px; margin-right: 202px;">
			            <button type="submit" class="btn btn-primary" style="width: 80px;">수정</button>
			            <button type="button" class="btn btn-secondary" data-dismiss="modal">창 닫기</button>
			          </div>
			        </div>
			        
			      </div> <!-- modal-content div 끝 -->
			    </div>
			 </div> <!-- modal div 끝 -->
			</form>
	
</body>
</html>