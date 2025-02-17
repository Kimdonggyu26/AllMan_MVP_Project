<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mvp.semi.user.model.vo.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<style>
  @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css');
body{
  background-color: #131313;
  font-family: 'pretendard';
}
.ifound{
    width: 577px;
    height: 70px;
    font-size: 25px;
    border-radius: 5px;
    border: 0px;
    background-color: rgba(252, 252, 252, 0.116);
    color: darkgrey;
    text-align: center;
    margin-top: 15px;
    padding: 0px;
}
.button-group{
  width: 577px;
    height: 70px;
    font-size: 20px;
}
#buttons{
  margin-top: 25px;
  background-color: #ffffff;
  color: rgb(0, 0, 0);
    width: 577px;
    height: 70px;
    font-size: 20px;
    border-radius: 5px;
    border: 0px;
    font-weight: 900;
    margin-top: 15px;
    padding: 0px;
}
.container{
  margin-top: 313px;
  align-items: center;
  display: flex;
    flex-direction: column; /* 세로 방향으로 정렬 */
    /* justify-content: center; */
    /* align-items: center; */
    text-align: left;

}
.idfo{
  font-size: 40px;
  color: white;
/* text-align: center; */
  margin: auto;
}
input:focus {outline: none;}
.font{
  font-size: 20px;
  color: gray;
  text-align: center;
  margin-top: 10px;
}
#check{
  color: #85E86A;
  font-size: 50px;
  margin-bottom: 20px;
}
</style>
	<body>
	
<%
	String contextPath = request.getContextPath(); // "/web"
	User loginUser = (User)session.getAttribute("loginUser");
	String alertMsg = (String)session.getAttribute("alertMsg");
  String maskedUserId = (String) session.getAttribute("maskedUserId");
	
%>
	<form action="<%= contextPath %>/login.us" >
	<div class="container">
           <i class="fa-regular fa-circle-check" id="check"></i>
	          <div class="idfo">입력하신 정보와 일치하는 결과입니다.</div>
           <div class="font">이메일을 확인하여 비밀번호 재설정을 완료해주세요.</div>
	         <div id="userId">
	         	 	<p style="color:white; text-align:center; font-size:20px;">아이디: <%= maskedUserId %></p>
	         </div>
	        <div class="button-group">
	  <button type="submit"  id="buttons">로그인하러 가기</button>
	</div>
	</div>
</form>
   	<!-- Header, Nav start -->
   <%--  <%@ include file="/views/common/footer.jsp" %> --%>
    <!-- Header, Nav end -->


</body>
</html>