<%@ page import="java.util.*" %>
<%@ page import="com.mvp.semi.cs.inquiry.model.vo.Inquiry"%>
<%@ page import="com.mvp.semi.common.model.vo.Attachment" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Map<String, Object> map = (Map<String, Object>)request.getAttribute("map");
	Inquiry i = (Inquiry)map.get("i");	
	Attachment at = (Attachment)map.get("at");	// null | 파일번호, 원본명, 수정명 ,저장경로
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
   <h2 class="m-4">1대1문의 수정</h2>
   
   <form action="<%= contextPath %>/update.iq" method="post" enctype="multipart/form-data" class="m-4">
   <input type="hidden" name="no" value="<%= i.getInquiryNo() %>">
     <table class="table">
     	<tr>
   			<th id="nt1">문의유형</th>
   			<td>
	   		 <select name="category" class="form-control" id="nc2">
	         <option value="general">일반 문의</option>
	         <option value="tech">기술 문의</option>
	         <option value="billing">결제 문의</option>
	       </select>
	      </td>
        </tr>
	     <tr>
	       <th id="nt1">제목</th>
	       <td><input type="text" class="form-control" id="nt2" required name="title"  value="<%= i.getInquiryTitle() %>"></td>
	     </tr>
	     <tr>
	       <th id="nc1">내용</th>
	       <td><textarea rows="10" class="form-control" id="nc2" style="resize:none;" required name="content"><%= i.getInquirycontent() %></textarea></td>
     		</tr>
     		<tr>
          <th id="nc1">첨부파일</th>
          <td id="nc1">
            <!-- 기존에 첨부파일이 있었을 경우 보여지는 기존 첨부파일명 -->
            <% if(at != null) { %>
            	<%= at.getOriginName() %> <br>
            	<input type="hidden" name="originFileNo" value="<%= at.getFileNo() %>">
            <% } %>

            <!-- 새로이 첨부파일 업로드 해서 수정 가능 -->
            <input type="file" name="upfile">
          </td>
        </tr>
      </table>

        <br>

          <div align="center">
            <button type="submit" class="btn btn-primary btn-sm">수정하기</button>
            <button type="reset" class="btn btn-danger btn-sm">초기화</button>
            <button type="button" class="btn btn-outline-warning btn-sm" onclick="history.back();">뒤로가기</button>
          </div>

        </form>
      </div>
      </div>
      
      
 	<!-- Footer start -->
  <%@ include file="/views/common/footer.jsp" %>
  <!-- Footer end -->
      
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