<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
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
<%--  <%
	String contextPath = request.getContextPath();
%> --%>

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
         
			        <input type="text" class="input-line" placeholder="아이디" name="userId" required >
			        <div class="font">영문 소문자 또는 영문 소문자, 숫자 조합 6~12 자리</div>
							           
							<input type="password" class="input-line" placeholder="비밀번호" id="margin" name="userPwd" required>
							
							<input type="password" class="input-line" placeholder="비밀번호 확인" id="marginss" required>
							
							<input type="text" class="input-line" placeholder="이메일" id="margins" name="email">
							
							
							<input type="text" class="input-line" placeholder="전화번호" id="marginss" name="phone" >



         <br>

       			 <div>
           <button type="submit" class="btn  btn-sm " style=" color: gray; background-color: #ffffff29 ;" id="buttons"  >회원가입</button>
       		 </div>

     </form>
     </div>

   </section>
				<script>
				
		/* 			function checkId() {
						var userId = document.getElementById("userId").value;
						 var buttons = $('#buttons'); // 회원가입 버튼
						
						  $.ajax({
						        url: '/check-user-id', // 중복 아이디 확인을 위한 서버 API 경로
						        method: 'POST',
						        data: { userId: userId },
						        success: function(response) {
						            if (response.isDuplicate) {
						                $('#message').text('중복되는 아이디입니다.'); // 중복일 경우 메시지 출력
						                submitBtn.prop('disabled', true); // 버튼 비활성화
						            } else {
						                $('#message').text('사용 가능한 아이디입니다.');
						                submitBtn.prop('disabled', false); // 버튼 활성화
						            }
						        },
						        error: function() {
						            $('#message').text('서버 오류가 발생했습니다. 다시 시도해주세요.');
						            submitBtn.prop('disabled', true); // 오류 발생 시 버튼 비활성화
						        }
						    });
						  
	
					} */
        <%-- 	// 아이디 중복체크용 함수 
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
        		
        	} --%>
        </script>

   <!-- Section end -->


   <!-- Footer start -->
     <!-- footer.jsp include 할 예정 -->
   <!-- Footer end -->

</body>
</html>