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
      <div class="btn-taste">
        <div class="row justify-content-center mt-5 mb-3">
          <a href="<%= contextPath %>/list.NDHE" class="mx-2 btn btn-sm" id="ndhe" >NDHE 게시판</a>
          <a href="<%= contextPath %>/list.VDSE" class="mx-2 btn btn-sm" id="taste"  >VDSE 게시판</a>
          <a href="<%= contextPath %>/list.SPTF" class="mx-2 btn btn-sm" id="taste"  >SPTF 게시판</a>
          <a href="<%= contextPath %>/list.BOFA" class="mx-2 btn btn-sm" id="taste"  >BOFA 게시판</a>
        </div>
        <div class="row justify-content-center mb-3">
          <a href="<%= contextPath %>/list.ETRF" class="mx-2 btn btn-sm" id="taste"  >ETRF 게시판</a>
          <a href="<%= contextPath %>/list.CCFE" class="mx-2 btn btn-sm" id="taste"  >CCFE 게시판</a>
          <a href="<%= contextPath %>/list.CASE" class="mx-2 btn btn-sm" id="taste"  >CASE 게시판</a>
          <a href="<%= contextPath %>/list.HHAL" class="mx-2 btn btn-sm" id="taste"  >HHAL 게시판</a>
        </div>
      </div>


      <div class="container" id="bt1">
      
				<% if(loginUser != null && loginUser.getTasteNo() == 10){ %>
        <div class="d-flex justify-content-end mb-3">
           <a href="<%= contextPath %>/write.tbo" class="btn btn-secondary btn-sm">글쓰기</a>
        </div>
         <% } %>
        
        <% if(list.isEmpty()) { %>
        <div>
          <div style="text-align:center">존재하는 게시글이 없습니다.</div>
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
   			location.href = '<%= contextPath %>/detail.tbo?no=' + $(this).data('no');
   		})
   	})
   </script>


      





        <div id="board-b" class="row justify-content-center">
          <form method="post" name="search" action="">
              <table class="">
                <tr>
                  <td><select class="form-control" name="searchField" id="select-bar">
                      <option value="bbsTitle">제목+내용</option>
                      <option value="userID">작성자</option>
                  </select></td>
                  <td><input type="text" class="form-control" id="search-bar" placeholder="검색" name="searchText"> </td> 
                  <td><button type="submit" class="btn" id="search-btn">검색</button></td>
      
              </table>
            </form>
          </div>


        <ul class="pagination d-flex justify-content-center text-dark" id="page">
        
          <li class='page-item <%= pi.getCurrentPage() == 1 ? "disabled" : "" %>'>
          	<a class="page-link" href="<%= contextPath%>/list.tbo?page=<%= pi.getCurrentPage() -1 %>">&lt;</a>
          </li>
          
          <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
         	 <li class='page-item <%= p == pi.getCurrentPage() ? "active" : "" %>'>
         	 	<a class="page-link" style="color: #ffffff;" href="<%= contextPath%>/list.tbo?page=<%= p %>"><%= p %>
         	 	</a>
         	 </li>
          <% } %>
                   
          <li class='page-item <%= pi.getCurrentPage() == pi.getMaxPage() ? "disabled" : "" %>'>
          	<a class="page-link" href="<%=contextPath%>/list.tbo?page=<%= pi.getCurrentPage()+1 %>">&gt;
          	</a>
          </li>
          
        </ul>




    </section>








  <!-- Section end -->

   <!-- Header, Nav start -->
   <%@ include file="/views/common/footer.jsp" %>
   <!-- Header, Nav end -->


  
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