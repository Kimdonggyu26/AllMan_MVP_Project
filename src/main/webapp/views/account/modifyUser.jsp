<%@ page import="com.mvp.semi.user.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
 	<!-- Header, Nav start -->
	<%@ include file="/views/common/header.jsp"%>
	<!-- Header, Nav end -->

    <!-- body 시작부 -->
   
<style>
body {
  background-color: #131313;
  color: white;
  font-family: 'pretandard';
}

.container {
  width: 1000px;
  margin: 50px auto;
  margin-top: 100px;
  
}

.username{
  font-size: 30px;
}

.profile {
  display: flex;
  align-items: center;
  margin-bottom: 20px;
}

.profile img {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  margin-right: 10px;
}

.edit-button {
  background-color: gray;
  color: white;
  padding: 5px 10px;
  border: none;
  border-radius: 5px;
  margin-left: 10px;
  cursor: pointer;
  width: 120px;
  margin-left: 20px;
}


input[type="text"], select {
  width: 200px;
  padding: 10px;
  margin-bottom: 20px;
  border: 1px solid gray;
  border-radius: 5px;
  background-color: #131313;
  color: white;
}


button {
  width: 200px;
  height: 40px;
  margin: 10px;
  border: none;
  border-radius: 5px;
  cursor: pointer;

}

#btns{
  width: 200px;
  display: flex; 
  justify-content: center;
  align-items: center;
  text-align: center;
  margin-left: 400px;
  margin-top: 100px;
}
.userid,.name,.email{
  margin-right: 77px;
}
#name{
  margin-left: 0px;
}
#phone{
  margin-right: 40px;
}
.modal-content {
  background-color: #131313;
  width: 530px;
  height: 530px;
}
.modal-title{
  font-size: 40px;
}
.modal-body{
  justify-content: center;
  text-align: center;

}
.modal-footer{
  font-size: 15px;
}
.btn2{
  background-color: black;
  color: white;
}
.btn1,.btn2{
  width: 150px;
  height: 50px;
}
.modal-body img{
  width: 150px;
  height: 150px;
}
#changeid{
  width: 315px;
  height: 52px;
  margin-top: 25px;
  margin-bottom: 22px;
 
}
#changenick::placeholder{
  color: white;
  font-size: 25px;
}
a {
    color: inherit;
  font-style: normal;
  color: white;
  text-decoration-line : none;
}
a:link {
  color : white;
  text-decoration: none;
}
a:visited {
  color : white;
  text-decoration: none;
}
a:hover {
  color : white;
  text-decoration: none;
}
a:active {
  color : white;
  text-decoration: none;
}

</style>
<%--  <%

        String msg = (String) request.getAttribute("msg"); // 성공 메시지
    %>

    <!-- 수정 성공 메시지 표시 -->
    <div style="color: green;">
        <%= msg %>
    </div> --%>



<div class="container">
  <div class="profile">
      <img  class="card-img-top" src="<%=contextPath + loginUser.getFilePath() %>" alt="" style="width: 50px; height: 50px;">
      <span class="username" ><%= loginUser.getUserId() %></span>
      <button class="edit-button" type="button" ><a href="<%=contextPath %>/modifyProfile.us"> 프로필 수정 </a></button>
  </div>

  <h2>회원정보 수정</h2>
  <div style="display: flex; flex-direction: row;">
  <div class="userid">아이디</div>
  <input type="text" id="userid" name="userid" value="<%= loginUser.getUserId() %>" readonly>
  </div>
  <div style="display: flex; flex-direction: row;">
  <div class="name">닉네임</div>
  <input type="text" id="name" name="userNick" value="<%= loginUser.getUserNick() %>" readonly >
  </div>
  <div style="display: flex; flex-direction: row;">
  <div class="email">이메일</div>
  <div >
      <input type="text" id="email" name="email" style="width: 200px;"  value="<%= loginUser.getEmail() %>">	
  </div>
</div>
<div style="display: flex; flex-direction: row;">
  <div id="phone">휴대폰 번호</div>
			<div>
				<input type="text"  name="phone" style="width: 200px;"  value="<%= loginUser.getPhone() %>">
		</div>
</div>
  <div  id="btns">
       <button type="submit" style="background-color: #131313; color: white; background-color: gray; border: 1px solid gray;">수정</button>
  </div>
</div>
  <div> <hr style="background-color: gray;"> </div>
  <a href="<%= contextPath %>/views/account/deleteUser.jsp" style="color:  gray; margin-left: 30px; text-decoration: none;"> 회원탈퇴 및 계정삭제</a>
</form>

<!-- body 종료 -->
   	<!-- Header, Nav start -->
	<%@ include file="/views/common/footer.jsp"%>
	<!-- Header, Nav end -->
 <script>
				document.getElementById("profileImage").onchange = function(event) {
		        const file = event.target.files[0];
		        if (file) {
		            const reader = new FileReader();
		            reader.onload = function(e) {
		                const img = document.getElementById("imagePreview");
		                img.src = e.target.result; // 이미지 미리보기
		            };
		            reader.readAsDataURL(file); // 파일을 데이터 URL로 읽음
		        }
		    };
</script>
</body>
</html>