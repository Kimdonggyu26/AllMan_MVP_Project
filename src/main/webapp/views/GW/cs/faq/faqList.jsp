<%@ page import="java.util.List" %>
<%@ page import="com.mvp.semi.cs.faq.model.vo.FaQ" %>
<%@ page import="com.mvp.semi.common.model.vo.PageInfo" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	List<FaQ> list = (List<FaQ>)request.getAttribute("list");
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

    <section id="start-b">

        <div class="" id="head">
          <h3 >FAQ</h3><hr color="white">
        </div>

        <div id="qna-h">
        <table id="qna-list" class="table">
          <thead>
            <tr>
              <th width="700px">자주하는질문</th>
              <th width="150px">작성자</th>
              <th width="150px">작성일</th>
            </tr>
          </thead>
          
          <tbody>
          	
          	<% if(list.isEmpty()) { %>
            <!-- case1. 조회된 Qna가 없을 경우 -->
            <tr>
              <td colspan="3" style="text-align:center">존재하는 FAQ글이 없습니다.</td>
            </tr>

						<% } else { %>
						<!-- case2. 조회된 FaQ이 있을 경우 -->
							<% for (FaQ f : list) { %>
            <tr class="board-title" data-toggle="collapse" data-target="#qna<%= f.getFaqNo() %>">
              <td><%= f.getFaqTitle() %></td>
              <td><%= f.getUserNo() %></td>
              <td><%= f.getRegistDate() %></td>
            </tr>
            <tr class="board-title collapse" id="qna<%= f.getFaqNo() %>">
              <td colspan="3">
                <p class="border rounded p-3 w-75 mx-auto" style="min-height: 150px;"><%= f.getFaqContent() %></p>
                
                <!-- 로그인한 회원이 관리자 권한일 경우 보여지는 요소-->
                <div align="center">
                  <a href="<%= contextPath %>/modify.faq?no=<%= f.getFaqNo() %>" type="button" class="btn btn-secondary btn-sm">수정하기</a>
	                <a href="<%= contextPath %>/delete.faq?no=<%= f.getFaqNo() %>" type="button" class="btn btn-danger btn-sm">삭제하기</a>
                </div>
                
                
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
          	<a class="page-link" href="<%= contextPath%>/list.faq?page=<%= pi.getCurrentPage() -1 %>">&lt;</a>
          </li>
          
          <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
         	 <li class='page-item <%= p == pi.getCurrentPage() ? "active" : "" %>'>
         	 	<a class="page-link" style="color: #ffffff;" href="<%= contextPath%>/list.faq?page=<%= p %>"><%= p %>
         	 	</a>
         	 </li>
          <% } %>
                   
          <li class='page-item <%= pi.getCurrentPage() == pi.getMaxPage() ? "disabled" : "" %>'>
          	<a class="page-link" href="<%=contextPath%>/list.faq?page=<%= pi.getCurrentPage()+1 %>">&gt;
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

  #main { background-color: #131313; width: 1920px; min-height: 1080px; font-family: 'pretendard'; }
    #head { width: 1276px; margin: 61px auto 0; }
    #head h3, thead { color: #fff; }
    #qna-h, #qna-b { width: 1276px; margin: 63px auto 0; }
    #qna-h {margin-top: 82px;}
    #qna-b { margin-top: 44px; }
    thead { background-color: #666765; }
    tbody { color: #fff; }
    .page-link, .page-item.disabled .page-link, .page-item.active .page-link { color: #fff; background-color: #131313; border-color: #131313; }
    .page-item.active .page-link { font-weight: bold; text-decoration: underline; }
    .page-link:hover { color: #fff; background-color: #131313; border-color: #131313; }
    #select-bar, #search-bar, #search-btn { height: 45px; border: none; }
    #select-bar { margin-left: 167px; width: 164px; background-color: #45454b; color: #fff; }
    #search-bar { width: 657px; background-color: #666; color: #fff; }
    #search-btn { width: 132px; background-color: #F33F3F; color: #fff; }
    input[type="text"]::placeholder {color: #c2b9b9;}

</style>

</html>