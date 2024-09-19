<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    <style >
    body{
  background-color: #131313;
  font-family: 'pretendard';
}
.ifound{
    width: 577px;
    height: 70px;
    font-size: 20px;
    border-radius: 5px;
    border: 0px;
    background-color: rgba(252, 252, 252, 0.116);
    color: white;
    margin-top: 15px;
    padding: 0px;
    
}
input::placeholder{padding-left: 20px;}
.button-group{
  width: 577px;
    height: 70px;
    font-size: 20px;
}
#buttons{
  margin-top: 25px;
  background-color: #ffffff91;
  color: rgb(255, 255, 255);
    width: 577px;
    height: 70px;
    font-size: 20px;
    border-radius: 5px;
    border: 0px;
    margin-top: 15px;
    padding: 0px;
}
.container{
  margin-top: 313px;
  align-items: center;
  display: flex;
    flex-direction: column; /* 세로 방향으로 정렬 */
    text-align: left;

}
.idfo{
  font-size: 40px;
  color: white;
  margin: auto;
  margin-bottom: 34px;
}
#ifound{

  color: white;
  margin-top: 30px;
  text-align: left;
}
input:focus {outline: none;}
.font{
  font-size: 15px;
  color: gray;
  text-align: left;
  margin-top: 10px;
  margin-bottom: 27px;
}

  </style>
  

<body>
      <!-- Header, Nav start -->
    <%-- <%@ include file="/views/common/header.jsp" %> --%>
    <!-- Header, Nav end -->
    
    <!-- body 시작부 -->

				<div class="container">
          <div class="idfo">비밀번호 찾기</div>
          <div class="font">아이디 확인 후 등록된 이메일 주소로 비밀번호 재설정을 위한 인증 메일이 발송됩니다.<br> 
            이메일을 확인하여 비밀번호 재설정을 완료해주세요.</div>
        <div class="button-group">
  <input type="text" class="ifound" placeholder="아이디" >
  <button type="submit"  id="buttons"><a href="">확인</a></button>
</div>
</div>
    

		<!-- body 종료 -->
    <!-- Footer start -->
      <!-- footer.jsp include 할 예정 -->
    <!-- Footer end -->
</body>
</html>