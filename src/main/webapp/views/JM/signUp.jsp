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

 <div class="container p-3">

   <!-- Header, Nav start -->

   <!-- Header, Nav end -->

   <!-- Section start -->
   <section class="back" >
     <div class="container">
        <div class="header">
       <h2 class="m-4">MOVIE PICK 회원가입</h2>
      </div>
       <form action="" method="" class="">
         
        <input type="text" class="input-line" placeholder="아이디" name="userId" required>
        <div class="font">영문 소문자 또는 영문 소문자, 숫자 조합 6~12 자리</div>
           
<input type="password" class="input-line" placeholder="비밀번호" id="margin" name="userPwd" required>

<input type="password" class="input-line" placeholder="비밀번호 확인" id="marginss" required>
<div class="font">영문, 숫자, 특수문자(~!@#$%^&*)조합 8~15자리</div>
<input type="text" class="input-line" placeholder="이메일" id="margins" name="email">


<input type="text" class="input-line" placeholder="전화번호" id="marginss" name="phone" >



         <br>

         <div >
           <button type="submit" class="btn  btn-sm " style=" color: gray; background-color: #ffffff29 ;" id="buttons" disabled>회원가입</button>

         </div>

       </form>
 <%--  <script>
        	// 아이디 중복체크용 함수 
        	function fnIdCheck() {
        		
        		// 사용자가 입력한 아이디값 전달하면서 ajax요청
        		// NNNNN(사용불가) | NNNNY(사용가능) 응답데이터 돌려받기
        		
        		const $idInput = $("#signup-form input[name=userId]");
        		
        		$.ajax({
        			url: '<%= contextPath %>/idcheck.me',
        			data: {checkId: $idInput.val()},
        			success: function(res){
        				console.log(res);
        				if(res == 'NNNNN'){ // 사용불가능
        					alert('이미 존재하거나 탈퇴한 회원의 아이디입니다.');
        					$idInput.select(); // 다시 입력 유도
        				}else{ // 사용가능
        					if(confirm('사용가능한 아이디입니다. 사용하시겠습니까?')){
        						$('#signup-form :submit').removeAttr('disabled'); // 회원가입 버튼 활성화
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
      --%>
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