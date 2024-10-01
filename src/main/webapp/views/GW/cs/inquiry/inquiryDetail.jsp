<%@ page import="java.util.Map" %>
<%@ page import="com.mvp.semi.cs.inquiry.model.vo.Inquiry"%>
<%@ page import="com.mvp.semi.common.model.vo.Attachment" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Map<String, Object> map = (Map<String, Object>)request.getAttribute("map");
	Inquiry i = (Inquiry)map.get("i");
	Attachment at = (Attachment)map.get("at");	// null(첨부파일이 없을 경우) | 파일번호, 원본명, 수정명, 저장경로 
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
   
   <h2 class="">문의내용</h2>
   
    <div class="d-flex justify-content-end">
      <!-- 현재 로그인되어있는 회원이 해당 게시글의 작성자 본인일 경우 보여지는 요소 -->
      <% if(loginUser != null && loginUser.getUserId().equals(i.getUserNo())) { %>
      	<% if(i.getReplyContent() == null) { %>
      <a href="<%= contextPath %>/modify.iq?no=<%= i.getInquiryNo() %>" type="button" class="btn btn-secondary btn-sm">수정</a> &nbsp;
      	<% } %>
      <a href="<%= contextPath %>/delete.iq?no=<%= i.getInquiryNo() %>" type="button" class="btn btn-danger btn-sm">삭제</a> &nbsp;
      <% } %>
      <!-- ------------------------------------------------------------------------- -->
      <a href="<%= contextPath %>/list.iq" type="button" class="btn btn-warning btn-sm">목록가기</a>
    </div>
     
    <br>
   
     <table class="table" id="usertb">
       <tr>
         <th id="nc" width="100px">문의유형</th>
         <td id="nc"><%= i.getInquiryType() %></td>
       </tr>
	     <tr>
	       <th id="nc">제목</th>
	       <td id="nc"><%= i.getInquiryTitle() %></td>
	     </tr>
	     <tr>
	       <th id="nc">내용</th>
	       <td id="nc"><p style="min-height:200px; white-space:pre-wrap;"><%= i.getInquirycontent() %></p></td>
     	 </tr>
       <tr>
         <th id="nc">첨부파일</th>
         <td id="nc">
         <% if(at == null) { %>
           <!-- case1. 첨부파일이 존재하지 않을 경우-->
           첨부파일이 없음
         <% } else {%>
           <!-- case2. 첨부파일이 존재할 경우 -->
           <a download="<%= at.getOriginName() %>" href="<%= contextPath + at.getFilePath() + at.getChangeName() %>" style="color: black"><%= at.getOriginName() %></a>	<!-- 첨부파일 원본명 -->
            																								<!-- /web   /resources/board_upfiles/   123904501239_12934.jpg-->
         <% } %>
         </td>
       </tr>
     </table>
    <hr style="background-color: #ffffff;">
    <br><br> <br><br>
    
		<h2>답변</h2> 
			<br>
			
			<% if(i.getReplyContent() == null && loginUser.getStatus().equals("U")){ %>
			<div style="width: 900px;">답변등록이 안되어있습니다.</div>
			<% }else if (i.getReplyContent() == null && loginUser.getStatus().equals("A")){ %>
			  <form action="<%= contextPath %>/inquiry.as" method="POST">
			    <input type="hidden" name="inquiryNo" value="<%= i.getInquiryNo() %>">
			    <table class="table">
			      <tr>
			        <th id="nc1" width="100px">내용</th>
			        <td><textarea rows="10" class="form-control" id="nc2" style="resize:none;" required name="replyContent"></textarea></td>
			      </tr>
			    </table>
			    <div class="d-flex justify-content-end">
			    <button type="submit" class="btn btn-primary" >답변등록</button>
			    </div>
			  </form>
			<% } else {%>
			 <table id="reply-area" class="table">
	     	<tr>
	     		<th id="nc" width="100px"><%= i.getUserNickname() %></th>
	     		<td id="nc" width="700px"><p style="min-height:200px; white-space:pre-wrap;"><%= i.getReplyContent() %></p></td>
	     		<td id="nc"><%= i.getReplyDate() %></td>
	     	</tr>
	     </table>
     <% } %>
     
     
  

        
        
        
		</div>
	</div>
</body>

<style>
	#modify{
		min-height: 500px; 
		margin-top: 100px;
		color: white;
}
	#nc{
		color: white; 
}
	#nc1{
		color: white; 
}

	#nc2{
		background-color: #2b2b2b; 
		color: white; 
		border: none;
}



</style>
</html>