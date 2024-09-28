<%@ page import="java.util.List" %>
<%@ page import="com.mvp.semi.board.model.vo.Board" %>
<%@ page import="com.mvp.semi.common.model.vo.PageInfo" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	List<Board> list = (List<Board>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body id="main">

   <!-- Header, Nav start -->
   <%@ include file="/views/common/header.jsp" %>
   <!-- Header, Nav end -->

    <!-- Section start -->

    <section>
      <div class="btn-taste mt-5 mb-3" style="color: white; text-align: center;">
				<h1>자유게시판</h1>
      </div>


      <div class="container" id="bt1">
      
				<% if(loginUser != null){ %>
        <div class="d-flex justify-content-end mb-3">
           <a href="<%= contextPath %>/write.fbo" class="btn btn-secondary btn-sm">글쓰기</a>
        </div>
         <% } %>
        
        <% if(list.isEmpty()) { %>
        <div>
          <div style="text-align:center; color: white;">존재하는 게시글이 없습니다.</div>
        </div>
        <% }else { %>
        
        

        <div class="row justify-content-center">
          <!-- 첫 번째 카드 -->
          <% for(Board b : list){ %>
          <div class="col-4 mb-4" id="c-box">
            <div class="card" data-no="<%=b.getBoardNo()%>">
              <img class="card-img-top" src="<%=contextPath + b.getTitlePath() %>" alt="영화 이미지" width="300px" height="230px">
              <div class="card-body">

                    <div><%=b.getMovieTitle()%></div>

                    <div id="mv-content"><%=b.getMovieContent()%></div>

                    <div><%=b.getMovieOpenDate()%></div>

              </div>
              <div class="card-footer">
                <table>
                  <tr>
                    <td><img src="<%=b.getProfilePath()%>" style="width: 25px; height: 25px;"></td>
                    <td><%=b.getUserId()%></td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
            <% } %>
        </div>

            <% } %>
        
      </div>
 
   <script>
   	$(function() {
   		$('.card').on('click', function() {
   			location.href = '<%= contextPath %>/detail.fbo?no=' + $(this).data('no');
   		})
   	})
   </script>


		<!-- 검색 결과를 출력할 영역 -->
		<div class="row justify-content-center" id="search-results"> 
		</div>
		
		<!-- Pagination 영역 -->
		<ul class="pagination d-flex justify-content-center text-dark" id="pagination"> 
		</ul>  





		<div id="board-b" class="row justify-content-center">
		  <form id="searchForm" method="post" name="search">
		    <table class="">
		      <tr>
		        <td>
		          <select class="form-control" name="searchField" id="select-bar">
		            <option value="bbsTitle">제목+내용</option>
		            <option value="userID">작성자</option>
		          </select>
		        </td>
		        <td>
		          <input type="text" class="form-control" id="search-bar" placeholder="검색" name="searchText">
		        </td>
		        <td>
		          <button type="submit" class="btn" id="search-btn">검색</button>
		        </td>
		      </tr>
		    </table>
		  </form>
		</div>


        <ul class="pagination d-flex justify-content-center text-dark" id="page">
        
          <li class='page-item <%= pi.getCurrentPage() == 1 ? "disabled" : "" %>'>
          	<a class="page-link" href="<%= contextPath%>/list.fbo?page=<%= pi.getCurrentPage() -1 %>">&lt;</a>
          </li>
          
          <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
         	 <li class='page-item <%= p == pi.getCurrentPage() ? "active" : "" %>'>
         	 	<a class="page-link" style="color: #ffffff;" href="<%= contextPath%>/list.fbo?page=<%= p %>"><%= p %>
         	 	</a>
         	 </li>
          <% } %>
                   
          <li class='page-item <%= pi.getCurrentPage() == pi.getMaxPage() ? "disabled" : "" %>'>
          	<a class="page-link" href="<%=contextPath%>/list.fbo?page=<%= pi.getCurrentPage()+1 %>">&gt;
          	</a>
          </li>
          
        </ul>




    </section>








  <!-- Section end -->

   <!-- Header, Nav start -->
   <%@ include file="/views/common/footer.jsp" %>
   <!-- Header, Nav end -->
   
	<script>
	  // 검색 폼의 제출 이벤트를 Ajax로 처리
	  $('#searchForm').on('submit', function(e) {
	    e.preventDefault();  // 폼의 기본 제출 동작을 막음
	
	    performSearch(1);  // 검색 수행, 첫 번째 페이지부터 시작
	  });
	
	  function performSearch(page) {
	    const searchField = $('#select-bar').val();  // 선택된 검색 필드
	    const searchText = $('#search-bar').val().trim();  // 검색어 입력값
	
	    if (!searchText) {
	      alert('검색어를 입력하세요.');
	      return;
	    }
	
	    // Ajax 요청
	    $.ajax({
	      url: '<%= contextPath %>/fbSearch.mv',  // 서버의 검색 엔드포인트
	      type: 'GET',
	      data: {
	        searchField: searchField,
	        searchText: searchText,
	        page: page  // 현재 페이지 정보
	      },
	      success: function(res) {
	        // 서버에서 반환된 데이터로 결과와 페이지네이션 업데이트
	        const result = res.list;
	        const pagination = res.pi;
	
	        // 결과 영역 초기화
	        $('#search-results').html('');
	        let resultHtml = '';
	
	        if (result.length === 0) {
	          resultHtml += '<div>검색 결과가 없습니다.</div>';
	        } else {
	          // 결과를 반복문으로 HTML 생성
	          for (let i = 0; i < result.length; i++) {
	            resultHtml += `
	              <div class="col-4 mb-4">
	                <div class="card" data-no="${result[i].boardNo}">
	                  <img class="card-img-top" src="<%= contextPath %>${result[i].titlePath}" alt="영화 이미지" width="300px" height="230px">
	                  <div class="card-body">
	                    <div>${result[i].movieTitle}</div>
	                    <div>${result[i].movieContent}</div>
	                    <div>${result[i].movieOpenDate}</div>
	                  </div>
	                  <div class="card-footer">
	                    <table>
	                      <tr>
	                        <td><img src="${result[i].profilePath}" style="width: 25px; height: 25px;"></td>
	                        <td>${result[i].userId}</td>
	                      </tr>
	                    </table>
	                  </div>
	                </div>
	              </div>
	            `;
	          }
	        }
	
	        $('#search-results').html(resultHtml);  // 검색 결과 표시
	
	        // 페이지네이션 생성
	        createPagination(pagination);
	      },
	      error: function(error) {
	        console.error('검색 중 오류 발생:', error);
	      }
	    });
	  }
	
	  function createPagination(pagination) {
	    const currentPage = pagination.currentPage;
	    const startPage = pagination.startPage;
	    const endPage = pagination.endPage;
	    const maxPage = pagination.maxPage;
	
	    let paginationHtml = '';
	
	    // 이전 페이지 버튼
	    paginationHtml += `<li class="page-item ${currentPage === 1 ? 'disabled' : ''}">
	      <a class="page-link" href="javascript:performSearch(${currentPage - 1})">&lt;</a>
	    </li>`;
	
	    // 페이지 번호 버튼
	    for (let i = startPage; i <= endPage; i++) {
	      paginationHtml += `<li class="page-item ${i === currentPage ? 'active' : ''}">
	        <a class="page-link" href="javascript:performSearch(${i})">${i}</a>
	      </li>`;
	    }
	
	    // 다음 페이지 버튼
	    paginationHtml += `<li class="page-item ${currentPage === maxPage ? 'disabled' : ''}">
	      <a class="page-link" href="javascript:performSearch(${currentPage + 1})">&gt;</a>
	    </li>`;
	
	    // 페이지네이션 HTML 업데이트
	    $('#pagination').html(paginationHtml);
	  }
	
	  // 카드 클릭 시 게시글 상세보기로 이동
	  $(document).on('click', '.card', function() {
	    const boardNo = $(this).data('no');
	    location.href = `<%= contextPath %>/detail.fbo?no=${boardNo}`;
	  });
	</script>
  
  
  
</body>

<style>
  @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css');

  html{
    display: flex;
    justify-content: center;
  }

  #main {
    background-color: #131313;
    width: 100%; min-height: 1080px;
    max-width: 1920px;
    font-family: 'pretendard';
  }

  #card{
    width: 1275px; border: solid 1px;
    margin-left: 322px;
  }

  #board-b{
    margin-top: 35px;
  }

  #page{
    margin-top: 30px;
  }

  #select-bar{
    
    width: 164px;
    height: 45px;
    background-color: #45454b; color: white; border: 1px solid #131313;
  }

  #search-bar{
    height: 45px;
    width: 657px;
    background-color: #666; color: white; border: 1px solid #131313;
  }

  #search-btn{
    height: 45px;
    width: 132px;
    background-color: #F33F3F; color: white;
  }

  .page-link {
    color: #ffffff; 
    background-color: #131313;
    border-color: #131313;;
  }

  .page-item.active .page-link {
    z-index: 1;
    color: #ffffff;
    font-weight:bold;
    background-color: #131313;
    border-color: #131313;;
    text-decoration : underline;
  }

  .page-item.disabled .page-link {
    z-index: 1;
    color: #ffffff;
    font-weight:bold;
    background-color: #131313;
    border-color: #131313;
	}
	
  .page-link:focus, .page-link:hover {
    color: #ffffff;
    background-color: #131313; 
    border-color: #131313;
	}
	
	.card{
	  height: 400px;
	  overflow: hidden;
	  border: none;
	}
	
	#card-top{
	  width:280px;
	  height: 380px;
	}
	.card-body {
	  background-color: #222222; /* 카드 본문 회색 배경 */
	  color: white;
	}
	
	.card-footer {
	  background-color: #888888; /* 카드 푸터 어두운 회색 배경 */
	  color: white; /* 푸터 텍스트 색상 */
	}
	
	#taste{
	  width: 150px;
	  height: 30px;
	  border-radius: 20px;
	  border: none;
	  color: white;
	  background-color: #3C3C3C;
	}
	
	#ndhe{
	  background-color: red;
	  width: 150px;
	  height: 30px;
	  border-radius: 20px;
	  border: none;
	  color: white;
	}
	
	
	.card {
	  width: 100%; /* 필요시 텍스트 영역의 너비 조절 */
	}
	
	#mv-content{
	  overflow: hidden;  		
	  text-overflow: ellipsis;
	  white-space: nowrap;
	  width: 100%; 	
	}

 #c-box{
 cursor: pointer;
 }
</style>
</html>