<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<style>
.m-4{
  text-align: center;
  margin: auto;
  color: white;
  font-size: 40px;
}
.input-line,#buttons{
  margin: auto;
  width: 577px;
    height: 70px;
    font-size: 20px;
    border-radius: 5px;
    border: 0px;
    background-color: rgba(252, 252, 252, 0.116);
    color: white;
}
input:focus {outline: none;}
.container{
  text-align: center;
  margin: auto;
  padding: 0;
}
body{
  background-color: #131313;
}
.font{
  font-size: 12px;
  color: gray;
  text-align: left;
  margin-left: 270px;
}
.back{
  margin: auto;

}
body{
  font-family: 'pretendard';
}
.header{
  margin-top: 140px;
}
#margins{
  margin-top: 24px;
}

#marginss{
  margin-top: 15px;
}
#buttons{
  margin-top: 55px;
}
</style>
<body>
<%-- <%
	String contextPath = request.getContextPath();
%> --%>
 <div class="container p-3">

   <!-- Header, Nav start -->
 <%@ include file="/views/common/header.jsp" %> 
   <!-- Header, Nav end -->

   <!-- Section start -->
   <section class="back" >
     <div class="container">
        <div class="header">
    <h2 class="m-4">MOVIE PICK 회원가입</h2>
      </div>
       	<form action="<%= contextPath %>/insert.us" method="post" class="signup-form">
         
			        <input type="text" class="input-line" placeholder="아이디" name="userId" required onblur="checkId();">
			        <div class="font">영문 소문자 또는 영문 소문자, 숫자 조합 6~12 자리</div>
							           
							<input type="password" class="input-line" placeholder="비밀번호" id="margin" name="userPwd" required>
							
							<input type="password" class="input-line" placeholder="비밀번호 확인" id="marginss" required>
							
							<input type="text" class="input-line" placeholder="이메일" id="margins" name="email">
							
							
							<input type="text" class="input-line" placeholder="전화번호" id="marginss" name="phone" >



         <br>

       			 <div>
           <button type="submit" class="btn  btn-sm " style=" color: gray; background-color: #ffffff29 ;" id="buttons" disabled >회원가입</button>
       		 </div>

     </form>
				<script>
				
					function checkId() {
						var userId = document.getElementById("userId").value;
						
						  if (userId === "") {
						        document.getElementById("idCheckMessage").innerHTML = "";
						        return;
						    }
						
						  var xhr = new XMLHttpRequest();
						  const $idInput = $(".signup-form input[name=userId]");
						  $.ajax({
							 url : '<%= contextPath %>/idcheck.us',
							 data : {checkId :$idInput.val()},
							 success : function(res){
								 console.log(res);
								// 서버에서 중복 여부에 따라 메시지 처리
						            if (res == "duplicate") {
						            	alert('이미 존재하는 회원의 아이디입니다.');
			        					$idInput.select(); // 다시 입력 유도
						            } else if (res == "available") {
						                document.getElementById("idCheckMessage").innerHTML = "사용 가능한 아이디입니다.";
							 }
						  })
						  }
						  

						    // 요청 헤더 설정 (POST 요청으로 데이터를 전송)
						    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

						    // 서버로 보내는 데이터
						    xhr.send("userId=" + encodeURIComponent(userId));

						    // 서버로부터 응답을 받았을 때 실행되는 함수
						    xhr.onreadystatechange = function () {
						        if (xhr.readyState === 4 && xhr.status === 200) {
						            var response = xhr.responseText;

						
						
					}
        	// 아이디 중복체크용 함수 
        	function fnIdCheck() {
        		const $idInput = $(".signup-form input[name=userId]");
        		
        		$.ajax({
        			url: '<%= contextPath %>/idcheck.us',
        			data: {checkId: $idInput.val()},
        			success: function(res){
        				console.log(res);
        				if(res == 'NNNNN'){ // 사용불가능
        					alert('이미 존재하는 회원의 아이디입니다.');
        					$idInput.select(); // 다시 입력 유도
        				}else{ // 사용가능
        					if(confirm('사용가능한 아이디입니다. 사용하시겠습니까?')){
        						$('.signup-form :submit').removeAttr('disabled'); // 회원가입 버튼 활성화
        						$idInput.prop('readonly', true); // 더이상 아이디 수정 불가하도록
        					}else{
        						$idInput.select(); // 다시 입력 유도
        					}
        				}
        			}, 
        			error: function() {
        				console.log('아이디 중복체크용 ajax 통신 실패');
        			}
        		})
        		
        	}
        </script>

     </div>

   </section>
   <!-- Section end -->


   <!-- Footer start -->
     <!-- footer.jsp include 할 예정 -->
   <!-- Footer end -->

 </div>
</form>
</body>
</html>