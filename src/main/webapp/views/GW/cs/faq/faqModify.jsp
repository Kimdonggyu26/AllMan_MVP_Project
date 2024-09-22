<%@ page import="com.mvp.semi.cs.faq.model.vo.FaQ"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	FaQ n = (FaQ)request.getAttribute("n");	// 글번호, 글제목, 글내용
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <!-- Header, Nav start -->
   <%@ include file="/views/common/header.jsp" %>
   <!-- Header, Nav end -->
 <div class="container">
   <div class="border p-5 rounded" id="modify"  >
   <h2 class="m-4">FAQ 수정</h2>
   
   <form action="<%= contextPath %>/update.faq" method="post" class="m-4">
   <input type="hidden" name="no" value="<%= n.getFaqNo() %>">
     <table class="table">
	     <tr>
	       <th id="nt1">제목</th>
	       <td><input type="text" class="form-control" id="nt2" required name="title"  value="<%= n.getFaqTitle() %>"></td>
	     </tr>
	     <tr>
	       <th id="nc1">내용</th>
	       <td><textarea rows="10" class="form-control" id="nc2" style="resize:none;" required name="content"><%= n.getFaqContent() %></textarea></td>
     		</tr>
      </table>

        <br>

          <div align="center">
            <button type="submit" class="btn btn-primary btn-sm">수정하기</button>
            <button type="reset" class="btn btn-danger btn-sm">초기화</button>
          </div>

        </form>
      </div>
      </div>
</body>

<style>
	#modify{
		min-height: 500px; 
		margin-top: 100px;
		color: white;
}
	#nc1{
		color: white; 
}
	#nt1{
		color: white; 
}
	#nc2{
		background-color: #2b2b2b; 
		color: white; 
		border: none;
}
	#nt2{
		background-color: #2b2b2b; 
		color: white; 
		border: none;
}
</style>
</html>