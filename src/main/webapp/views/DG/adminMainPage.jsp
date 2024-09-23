<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String contextPath = request.getContextPath(); %>
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
    <link rel="stylesheet" href="css/관리자메인페이지.css">
    
    <style>
				body{
				    	font-family: pretendard;
				    	font-weight: bold;
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
				.content-bottom{
				  width: 691px;
				  height: 434px;
				  display: flex;
				  margin-top: 20px;
				}
				.content-bottom-left{
				  width: 340px;
				  height: 184px;
				  display: flex;
				  flex-direction: column;
				  gap: 20px;
				  font-size: 14px;
				}
				.content-bottom-right{
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
    </style>
</head>
<body>

<div class="container">
    <div id="main">
        <div id="head">
            <div id="mvp_logo">
                <img src="" style="margin-left: 366px;">
            </div>
            <div style="display: flex; align-items: center;">
                <img src="../assets/image/home_logo.png" style="margin-right: 15px;">
                <img src="../assets/image/moviepick_logo.png" style="margin-right: 50px; width: 80px;">
                <img src="../assets/image/logout_logo.png" style="margin-right: 15px;">
                <span>로그아웃</span>
            </div> 
        </div> <!-- head div 끝 -->
        <div id="body">
          <div id="body-left">  
            <div id="sidebar">
              <div style="background-color: #D2E5FF;"><img src="../assets/image/tv_icon.png">&nbsp;영화 관리</div> <!-- 기본 페이지이기 때문에 색 입혀놓음 -->
              <div><img src="../assets/image/people_icon.png">&nbsp;계정 관리</div>
              <div><img src="../assets/image/board_icon.png">&nbsp;게시판 관리</div>
              <div><img src="../assets/image/reply_icon.png">&nbsp;리뷰 관리</div>
              <div><img src="../assets/image/question_icon.png">&nbsp;고객 지원</div>
            </div>
          </div>

          <div id="body-right">
            <div id="body-title">
              <span>영화관리</span>
              <div style="width: 280px; height: 32px;">
                <img src="../assets/image/user_logo.png">
                <span>000관리자님 환영합니다.</span>
              </div>
            </div><!-- body-title div 끝 -->
          <hr style="border: 2px solid #959595; width: 1074px; margin: 0%;">
            <div id="body-main">
              <table class="table table-bordered">
                <tbody>
                  <tr>
                    <td class="table-title">등록날짜</td>
                    <td style="display: flex; gap: 20px; width: 902px; height: 57px;"><input type="date" class="form-control"> <hr> <input type="date" class="form-control"></td>
                  </tr> 
                  <tr>
                    <td class="table-title">장르</td>
                    <td style="padding: 0%;">
                      <div class="checkbox-list" style="margin-top: 5px; margin-left: 60px;">
                        <label style="display: flex; align-items: center;">
                          <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;">액션
                        </label>
                        <label style="display: flex; align-items: center;">
                          <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;">범죄
                        </label>
                        <label style="display: flex; align-items: center;">
                          <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;">SF
                        </label>
                        <label style="display: flex; align-items: center;">
                          <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;">코미디
                        </label>
                        <label style="display: flex; align-items: center;">
                          <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;">슬랩스틱
                        </label>
                        <label style="display: flex; align-items: center;">
                          <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;">로맨스
                        </label>
                        <label style="display: flex; align-items: center;">
                          <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;">멜로
                        </label>
                      </div>
                      <div class="checkbox-list" style="margin-top: 3px; margin-left: 60px;">
                        <label style="display: flex; align-items: center;">
                          <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;">공포
                        </label>
                        <label style="display: flex; align-items: center;">
                          <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;">스릴러
                        </label>
                        <label style="display: flex; align-items: center;">
                          <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;">전쟁
                        </label>
                        <label style="display: flex; align-items: center;">
                          <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;">스포츠
                        </label>
                        <label style="display: flex; align-items: center;">
                          <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;">판타지
                        </label>
                        <label style="display: flex; align-items: center;">
                          <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;">음악
                        </label>
                        <label style="display: flex; align-items: center;">
                          <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;">뮤지컬
                        </label>
                      </div>
                    </td>
                  </tr>
                  <tr>
                      <td class="table-title">검색</td> 
                      <td style="display: flex;">
                        <input type="text" class="form-control" placeholder="검색어를 입력하세요." style="width: 311px; height: 31px; font-size: 14px;">
                        <button id="search">검색</button>
                        <button id="reset">초기화</button>
                      </td>
                    </tr>
                </tbody>
                </table>
                <div id="body-main-list">
                  <div id="list-category">
                    <div class="show-movie">상영중인 영화</div>
                    <div class="ott-movie">OTT 영화</div>
                    
                    <button type="button" style="background-color: #2F80ED; margin-left: 525px;"  data-toggle="modal" data-target="#insert-movie" >+ 등록</button>
                    <button type="button" style="background-color: #F25858; margin-left: 15px;">- 삭제</button>
                    
                  </div>
                  <div id="list">
                    <table>
                      <tr>
                        <td class="list-head">
                          <input type="checkbox" style="width: 18px; height: 18px; margin-left: 45px;"></input>
                          <div style="margin-left: 58px;">NO</div>
                          <div style="margin-left: 85px;">제목</div>
                          <div style="margin-left: 526px;">담당자</div>
                          <div style="margin-left: 167px;">등록일</div>
                        </td>
                      <tr>
                        <td class="list-content">
                          <div>
                            <input type="checkbox" style="width: 18px; height: 18px; margin-left: 46px;"></input>
                          </div>
                          <div class="list-num">영화번호</div>
                          <div class="list-title">영화제목or게시글제목등등</div>
                          <div class="list-admin">담당자명</div>
                          <div class="list-date">등록날짜</div>
                        </td>
                      </tr>
                      <tr>
                        <td class="list-content" style="background-color: #F0F0F0a1;">
                          <div>
                            <input type="checkbox" style="width: 18px; height: 18px; margin-left: 46px;"></input>
                          </div>
                          <div class="list-num">영화번호</div>
                          <div class="list-title">영화제목or게시글제목등등</div>
                          <div class="list-admin">담당자명</div>
                          <div class="list-date">등록날짜</div>
                        </td>
                      </tr>
                      <tr>
                        <td class="list-content">
                          <div>
                            <input type="checkbox" style="width: 18px; height: 18px; margin-left: 46px;"></input>
                          </div>
                          <div class="list-num">영화번호</div>
                          <div class="list-title">영화제목or게시글제목등등</div>
                          <div class="list-admin">담당자명</div>
                          <div class="list-date">등록날짜</div>
                        </td>
                      </tr>
                      <tr>
                        <td class="list-content" style="background-color: #F0F0F0a1;">
                          <div>
                            <input type="checkbox" style="width: 18px; height: 18px; margin-left: 46px;"></input>
                          </div>
                          <div class="list-num">영화번호</div>
                          <div class="list-title">영화제목or게시글제목등등</div>
                          <div class="list-admin">담당자명</div>
                          <div class="list-date">등록날짜</div>
                        </td>
                      </tr>
                      <tr>
                        <td class="list-content">
                          <div>
                            <input type="checkbox" style="width: 18px; height: 18px; margin-left: 46px;"></input>
                          </div>
                          <div class="list-num">영화번호</div>
                          <div class="list-title">영화제목or게시글제목등등</div>
                          <div class="list-admin">담당자명</div>
                          <div class="list-date">등록날짜</div>
                        </td>
                      </tr>
                      <tr>
                        <td class="list-content" style="background-color: #F0F0F0a1;">
                          <div>
                            <input type="checkbox" style="width: 18px; height: 18px; margin-left: 46px;"></input>
                          </div>
                          <div class="list-num">영화번호</div>
                          <div class="list-title">영화제목or게시글제목등등</div>
                          <div class="list-admin">담당자명</div>
                          <div class="list-date">등록날짜</div>
                        </td>
                      </tr>
                      <tr>
                        <td class="list-content">
                          <div>
                            <input type="checkbox" style="width: 18px; height: 18px; margin-left: 46px;"></input>
                          </div>
                          <div class="list-num">영화번호</div>
                          <div class="list-title">영화제목or게시글제목등등</div>
                          <div class="list-admin">담당자명</div>
                          <div class="list-date">등록날짜</div>
                        </td>
                      </tr>
                      <tr>
                        <td class="list-content" style="background-color: #F0F0F0a1;">
                          <div>
                            <input type="checkbox" style="width: 18px; height: 18px; margin-left: 46px;"></input>
                          </div>
                          <div class="list-num">영화번호</div>
                          <div class="list-title">영화제목or게시글제목등등</div>
                          <div class="list-admin">담당자명</div>
                          <div class="list-date">등록날짜</div>
                        </td>
                      </tr>
                      <tr>
                        <td class="list-content">
                          <div>
                            <input type="checkbox" style="width: 18px; height: 18px; margin-left: 46px;"></input>
                          </div>
                          <div class="list-num">영화번호</div>
                          <div class="list-title">영화제목or게시글제목등등</div>
                          <div class="list-admin">담당자명</div>
                          <div class="list-date">등록날짜</div>
                        </td>
                      </tr>
                      <tr>
                        <td class="list-content" style="background-color: #F0F0F0a1;">
                          <div>
                            <input type="checkbox" style="width: 18px; height: 18px; margin-left: 46px;"></input>
                          </div>
                          <div class="list-num">영화번호</div>
                          <div class="list-title">영화제목or게시글제목등등</div>
                          <div class="list-admin">담당자명</div>
                          <div class="list-date">등록날짜</div>
                        </td>
                      </tr>
                      <tr>
                        <td class="list-content">
                          <div>
                            <input type="checkbox" style="width: 18px; height: 18px; margin-left: 46px;"></input>
                          </div>
                          <div class="list-num">영화번호</div>
                          <div class="list-title">영화제목or게시글제목등등</div>
                          <div class="list-admin">담당자명</div>
                          <div class="list-date">등록날짜</div>
                        </td>
                      </tr>
                      <tr>
                        <td class="list-content" style="background-color: #f0f0f0a1;">
                          <div>
                            <input type="checkbox" style="width: 18px; height: 18px; margin-left: 46px;"></input>
                          </div>
                          <div class="list-num">영화번호</div>
                          <div class="list-title">영화제목or게시글제목등등</div>
                          <div class="list-admin">담당자명</div>
                          <div class="list-date">등록날짜</div>
                        </td>
                      </tr>
                    </table>
                  </div>
                </div>
              </div>
            </div> <!-- body-right div 끝 -->
            
            <!-- 사용자가 현재보고있는 페이지에 따라서 다르게 보여질 페이징바 추가하기 -->

        </div> <!-- body div 끝 -->
    </div> <!-- main div 끝 -->



	
		
		
		<form action="<%=contextPath%>/movieInsert.mi" method="post" enctype="multipart/form-data">
		
		<!-- 영화 등록 화면 (모달) -->
		  <div class="modal" id="insert-movie">
		    <div class="modal-dialog modal-xl" style="width: 760px; height: 900px;">
		    
		      <div class="modal-content">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <div>
		            <hr style="width: 4px; height: 16px; background-color: #2F80ED; margin: 0%; margin-top: 5px;">
		          </div>
		          <div> 
		            <h4 class="modal-title" style="margin-right: 640px; font-size: 20px;">영화등록</h4>
		          </div>  
		        </div>
		        
		        <!-- Modal body -->
		        <div class="modal-body" style="width: 708px; height: 694px;">
		          <div class="content-top" style="width: 708px; height: 254px;">
		            <div style="display: flex;">
		              <p style="width: 60px; font-size: 14px;">영화제목</p>
		              <input type="text" class="form-control" name="movie-title" placeholder="영화제목을 입력하세요." style="width: 630px; height: 20px; margin-left: 20px; font-size: 10px;">
		            </div>
		            <div style="display: flex;">
		              <p style="width: 60px; font-size: 14px;">영화소개</p>
		              <input type="text" class="form-control" name="movie-content" placeholder="영화소개를 입력하세요." style="width: 630px; height: 126px; margin-left: 20px; font-size: 10px;">
		            </div>
		            <div style="display: flex; flex-direction: column;">
		              <p style="width: 60px; font-size: 14px;">장르</p>
		              <div class="modal-checkbox-list" style="margin-top: 5px;">
		                <div style="width: 55px; height: 17px;">
		                  <label style="display: flex; align-items: center;">
		                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" value="액션">액션
		                  </label>
		                </div>
		                <div style="width: 55px; height: 17px;">
		                  <label style="display: flex; align-items: center;">
		                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" value="범죄">범죄
		                  </label>
		                </div>
		                <div style="width: 55px; height: 17px;">
		                  <label style="display: flex; align-items: center;">
		                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" value="SF">SF
		                  </label>
		                </div>
		                <div style="width: 55px; height: 17px;">
		                  <label style="display: flex; align-items: center;">
		                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" value="코미디">코미디
		                  </label>
		                </div>
		                <div style="width: 55px; height: 17px;">
		                  <label style="display: flex; align-items: center;">
		                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" value="슬랩스틱">슬랩스틱
		                  </label>
		                </div>
		                <div style="width: 55px; height: 17px;">  
		                  <label style="display: flex; align-items: center;">
		                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" value="로맨스">로맨스
		                  </label>
		                </div>
		                <div style="width: 55px; height: 17px;">  
		                  <label style="display: flex; align-items: center;">
		                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" value="멜로">멜로
		                  </label>
		                </div>
		                <div>
		                	<div style="width: 42px; height: 17px; margin-bottom: 5px;"><p>취향</p></div>
		                <select id="movie-level" class="form-select" name="taste">
		                  <option value="NDHE">NDHE</option>
		                  <option value="VDSE">VDSE</option>
		                  <option value="SPTF">SPTF</option>
		                  <option value="BOFA">BOFA</option>
		                  <option value="ETRF">ETRF</option>
		                  <option value="CCFE">CCFE</option>
		                  <option value="CAES">CAES</option>
		                  <option value="HHAL">HHAL</option>
		                </select>
		                </div>
		              </div>
		              <div class="modal-checkbox-list" style="margin-top: 3px;">
		                <div style="width: 55px; height: 17px;">
		                  <label style="display: flex; align-items: center;">
		                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" value="공포">공포
		                  </label>
		                </div>
		                <div style="width: 55px; height: 17px;">
		                  <label style="display: flex; align-items: center;">
		                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" value="스릴러">스릴러
		                  </label>
		                </div>
		                <div style="width: 55px; height: 17px;">  
		                  <label style="display: flex; align-items: center;">
		                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" value="전쟁">전쟁
		                  </label>
		                </div>
		                <div style="width: 55px; height: 17px;">  
		                  <label style="display: flex; align-items: center;">
		                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" value="스포츠">스포츠
		                  </label>
		                </div>
		                <div style="width: 55px; height: 17px;">  
		                  <label style="display: flex; align-items: center;">
		                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" value="판타지">판타지
		                  </label>
		                </div>
		                <div style="width: 55px; height: 17px;">  
		                  <label style="display: flex; align-items: center;">
		                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" value="음악">음악
		                  </label>
		                </div>
		                <div style="width: 55px; height: 17px;">  
		                  <label style="display: flex; align-items: center;">
		                    <input type="checkbox" class="form-check-input" style="width: 18px; height: 18px;" value="뮤지컬">뮤지컬
		                  </label>
		                </div>  
		              </div>
		            </div>
		          </div>
		          <div class="content-bottom">
		            <div class="content-bottom-left" style="margin-top: 20px;">
		              <div style="display: flex; gap: 30px; text-align: center;">
		                <div style="width: 42px; height: 17px;"><p style="margin-bottom: 10px;">개봉일</p></div>
		                <input type="date" class="form-control" name="open-date" style="width: 200px; height: 20px;">
		              </div>
		              <div style="display: flex; gap: 30px;">
		                <div style="width: 42px; height: 17px;"><p style="margin-bottom: 10px;">등급</p></div>
		                <select id="movie-level" class="form-select" name="age-level">
		                  <option value="all">전체관람가</option>
		                  <option value="12+">12세이상관람가</option>
		                  <option value="15+">15세이상관람가</option>
		                  <option value="19+">청소년관람불가(19+)</option>
		                </select>
		              </div>
		              <div style="display: flex; gap: 30px;">
		                <div style="width: 42px; height: 17px;"><p>감독</p></div>
		                <input type="text" class="form-control" style="width: 200px; height: 20px;" name="director" placeholder="감독명">
		              </div>
		              <div style="display: flex; gap: 30px;">
		                <div style="width: 42px; height: 17px;"><p>출연진</p></div>
		                <input type="text" class="form-control" style="width: 200px; height: 20px;" name="actor" placeholder="출연진명( ,로 구분 )">
		              </div>
		              <div style="display: flex; gap: 30px; width: 600px">
		                <div style="width: 42px; height: 17px;"><p>예고편</p></div>
		                <input type="text" class="form-control" name="preview" style="width: 200px; height: 20px;" placeholder="링크입력">
		              </div>
		   
		              <div style="width: 270px; height: 169px; display: flex; gap: 20px;">
		                <div style="width: 62px; height: 20px;"><p>메인이미지</p></div>
		                <img class="img-preview title-img" onclick="chooseFile(0);">
		              </div>
		            </div>
		            <div class="content-bottom-right">
		              <div style="display: flex; gap: 20px;">
		                <div style="width: 60px; height: 17px;"><p>재생시간</p></div>
		                <input type="text" class="form-control" name="" style="width: 200px; height: 20px;" placeholder="재생시간(분 단위)">
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
		                <select id="movie-status" class="form-select" name="movie-status">
		                  <option value="showing">현재상영중인영화</option>
		                  <option value="ott">OTT영화</option>
		                </select>
		              </div>
		              <div style="display: flex; gap: 30px;">
		                	<p style="margin: 0%">평점</p>
		                	<input type="text" class="form-control" name="preview" style="width: 200px; height: 20px;" placeholder="네이버평점(0.0)">
		                </div>
		              <div style="margin-bottom: 20px;">
		                <p style="margin-bottom: 5px">상세이미지</p>
		                <img class="img-preview content-img" onclick="chooseFile(1);">
		              </div>
		            </div>
		          </div> <!-- content-bottom div 끝 -->
		        </div> <!-- modal body div 끝 -->
		        
		        <div style="display: none;">
		        	<input type="file" name="title-image" onchange="loadImg(0);" required>
		        	<input type="file" name="content-image" onchange="loadImg(1);" required>
		        </div>
		        
		        <script>
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
		        	
		        </script>
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <div style="display: flex; gap: 196px; margin-right: 202px;">
		            <button type="submit" class="btn btn-primary" style="width: 80px;">등록</button>
		            <button type="button" class="btn btn-secondary" data-dismiss="modal">창 닫기</button>
		          </div>
		        </div>
		        
		      </div>
		    </div>
		  </div>
		  
		  </form>
		</div>
	





</body>
</html>