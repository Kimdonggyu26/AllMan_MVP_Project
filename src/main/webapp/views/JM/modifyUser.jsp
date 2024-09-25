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


 <form action="modifyuser.us">
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      
      <div class="modal-header" style="justify-content: center;">
        <div class="modal-title">프로필 편집</div>
      </div>


      <div class="modal-body">
        <a href=""><img src="../" alt=""></a>
        <div><input type="text" value="<%= loginUser.getUserNick() %>" id="changenick" name="userNick"></div>
        <h6>*2자 이상 10자 이내의 한글 영문,숫자 입력 가능합니다.</h6>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer" style="justify-content: center;">
        <button type="button" class="btn1" data-dismiss="modal"><a href="" style="color: black;">확인</a></button>
        <button type="button" class="btn2" data-dismiss="modal"><a href="">취소</a></button>
      </div>

    </div>
  </div>
</div>

<div class="container">
  <div class="profile">
      <img src="" alt="프로필 이미지" style="width: 50px; height: 50px;">
      <span class="username" ><%= loginUser.getUserId() %></span>
      <button class="edit-button" data-toggle="modal" data-target="#myModal" type="button">프로필 수정</button>
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
      <span style="margin: 10px;">@</span>
      <select id="email-domain" style="width: 250px;">
          <option value="naver.com">naver.com</option>
          <option value="gmail.com">gmail.com</option>
          <option value="hanmail.net">hanmail.net</option>
          <option value="nate.com">nate.com</option>
      </select>
  </div>
</div>
<div style="display: flex; flex-direction: row;">
  <div id="phone">휴대폰 번호</div>
  <div style="display: flex;">
      <select>
          <option>010</option>
          <option>011</option>
      </select>
      <input type="text" style="flex: 1; margin-left: 10px;" value="#">
      <input type="text" style="flex: 1; margin-left: 10px;" value="#">
  </div>
</div>
  <div  id="btns">
      <button ><a href="" style="color: black;">확인</a></button>
      <button style="background-color: #131313 ;color : white; border: 1px solid gray;" ><a href="">취소</a></button>
  </div>
</div>
  <div> <hr style="background-color: gray;"> </div>
  <a href="<%= contextPath %>/views/JM/deleteUser.jsp" style="color:  gray; margin-left: 30px; text-decoration: none;"> 회원탈퇴 및 계정삭제</a>
</form>

<!-- body 종료 -->
   	<!-- Header, Nav start -->
	<%@ include file="/views/common/footer.jsp"%>
	<!-- Header, Nav end -->

</body>
</html>