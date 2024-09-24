<%@ page import="java.util.List" %>
<%@ page import="com.mvp.semi.cs.notice.model.vo.Notice" %>
<%@ page import="com.mvp.semi.common.model.vo.PageInfo" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	List<Notice> list = (List<Notice>)request.getAttribute("list");
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

        <div class="" id="head">
          <h3 >공지사항</h3><hr color="white">
        </div>

        <div id="qna-h">
        <table id="qna-list" class="table">
          <thead>
            <tr>
              <th width="700px">글제목</th>
              <th width="150px">작성자</th>
              <th width="150px">작성일</th>
            </tr>
          </thead>
          <tbody>
          	
          	<% if(list.isEmpty()) { %>
            <!-- case1. 조회된 공지글가 없을 경우 -->
            <tr>
              <td colspan="3" style="text-align:center">존재하는 QnA글이 없습니다.</td>
            </tr>
			<% } else { %>
			<!-- case2. 조회된 공지글이 있을 경우 -->
				<% for (Notice n : list) { %>
            <tr class="board-title" data-toggle="collapse" data-target="#notice<%= n.getNoticeNo() %>">
              <td><%= n.getNoticeTitle() %></td>
              <td><%= n.getUserNo() %></td>
              <td><%= n.getRegistDate() %></td>
            </tr>
            <tr class="board-title collapse" id="notice<%= n.getNoticeNo() %>">
              <td colspan="3">
                <p class="border rounded p-3 w-75 mx-auto" style="min-height: 150px;"><%= n.getNoticeContent() %></p>
                
              <!-- <(% if(loginUser != null && loginUser.getUserId().equals(n.getNoticeWriter())) { %>-->
	              <!-- 로그인한 회원이 관리자 권한일 경우 보여지는 요소 -->
	              <div align="center">
	                <a href="<%= contextPath %>/modify.no?no=<%= n.getNoticeNo() %>" type="button" class="btn btn-secondary btn-sm">수정하기</a>
	                <a href="<%= contextPath %>/delete.no?no=<%= n.getNoticeNo() %>" type="button" class="btn btn-danger btn-sm">삭제하기</a>
	              </div>
	              <!--<(% } %>-->
                
            </td>
          </tr>
          	<% } %>
          <% } %>
          
          </tbody>
        </table>
        </div>

        <div id="qna-b">
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
          	<a class="page-link" href="<%= contextPath%>/list.no?page=<%= pi.getCurrentPage() -1 %>">&lt;</a>
          </li>
          
          <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
         	 <li class='page-item <%= p == pi.getCurrentPage() ? "active" : "" %>'>
         	 	<a class="page-link" style="color: #ffffff;" href="<%= contextPath%>/list.no?page=<%= p %>"><%= p %>
         	 	</a>
         	 </li>
          <% } %>
                   
          <li class='page-item <%= pi.getCurrentPage() == pi.getMaxPage() ? "disabled" : "" %>'>
          	<a class="page-link" href="<%=contextPath%>/list.no?page=<%= pi.getCurrentPage()+1 %>">&gt;
          	</a>
          </li>
          
        </ul>

    </section>



  <!-- Section end -->

  <!-- Footer start -->
  <%@ include file="/views/common/footer.jsp" %>
  <!-- Footer end -->

</body>

<style>
  @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css');

  html{
    display: flex;
    justify-content: center;
  }

  #main {
    background-color: #131313;
    width: 1920px; min-height: 1080px;
    font-family: 'pretendard';
  }

  #head{
    width: 1276px; margin-left: 322px; margin-top: 61px;
  }

  #head h3{
    color: rgb(255, 255, 255)
  }

  #qna-h{
    width: 1276px; margin-left: 322px; margin-top: 82px;
  }
  #qna-b{
    margin-top: 44px;
  }

  #page{
    margin-top: 35px;
  }

  #select-bar{
    margin-left: 488px;
    width: 164px;
    height: 45px;
    background-color: #45454b; color: white;  border: none;
  }

  #search-bar{
    height: 45px;
    width: 657px;
    background-color: #666; color: white;  border: none;
  }

  #search-btn{
    height: 45px;
    width: 132px;
    background-color: #F33F3F; color: white;
  }

  thead {
    background-color: #666765;
    color: rgb(255, 255, 255);
  }
  tbody {
    color: rgb(255, 255, 255);
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

  input[type="text"]::placeholder {color: #c2b9b9;}

</style>
</html>