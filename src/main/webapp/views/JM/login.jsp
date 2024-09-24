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

<!-- Header, Nav end -->
<%
	String contextPath = request.getContextPath(); // "/web"
%>

<style>

	body {
		font-family: 'pretendard';
		background-color: #131313;
	}
	
	.container {
		margin: auto;
		padding: 0;
	}
	
	.header {
		text-align: center;
		margin: auto;
		margin-top: 18%;
	}
	
	#login-put {
		font-size: 40px;
		color: white;
	}
	
	#id, #pass, #login-out {
		width: 577px;
		height: 70px;
		font-size: 20px;
		border-radius: 5px;
		border: 0px;
		background-color: rgba(252, 252, 252, 0.116);
		color: white;
	}
	
	input::placeholder {
		color: gray;
	}
	
	#login-out {
		margin-top: 70px;
	}
	
	.login-form {
		display: flex;
		flex-direction: column;
		align-items: center;
		margin-top: 20px;
	}
	
	.found {
		margin: auto;
		text-align: center;
		font-size: 20px;
		margin-top: 57px;
		justify-content: space-evenly;
		font-family: 'pretendard';
		color: white;
	}
	
	input:focus {
		outline: none;
	}
	
	a {
		color: inherit;
		font-style: normal;
		color: white;
		text-decoration-line: none;
	}
</style>


	<div class="container p-3">
		<form action="<%=contextPath%>/login.us" method="post">
			<div class="header ">
				<h1 id="login-put">MOVIE PICK 로그인</h1>
				<br>
			</div>
			<div class="login-form m-3">
				<input type="text" placeholder="아이디" id="id" name="userId" value=""required> 
				<br> 
				<input type="password" placeholder="비밀번호" id="pass" name="userPwd" value="" required>
				<br>
				<button type="submit" id="login-out" value="">로그인하기</button>
			</div>
		</form>
		<div>
			<table class="found">
				<tr>
					<td class="p-3"><a href="<%= contextPath %>/views/JM/findId.jsp">아이디 찾기 &nbsp|&nbsp  </a></td>
					<td class="p-3"><a href="<%= contextPath %>/views/JM/findPwd.jsp">비밀번호 찾기 &nbsp | &nbsp </a></td>
					<td class="p-3"><a href="<%= contextPath%>/views/JM/signUp.jsp ">회원가입</a></td>
				</tr>
			</table>

		</div>
	</div>
		<script> 
		/ 모든 필드 확인 함수
		 function checkAllFields() {
		     const userId = $("#signup-form input[name=userId]").val();
		     const userPwd = $("#signup-form input[name=userPwd]").val();
		     if (userId && userPwd && confirmPwd ) {
		         // 비밀번호 일치 여부 확인
		         if (userPwd === confirmPwd) {
		             $("#signup-form :submit").css("background-color", "red"); // 배경색을 빨간색으로 변경
		         } else {
		             checkAllrt('비밀번호가 일치하지 않습니다.');
		         }
		     }
		}
		     
		     
		     
			 $("#signup-form input").on("input", function() {
			     checkAllFields(); // 각 필드가 입력될 때마다 필드 확인 함수 호출
			 });  
		</script>
</body>

</html>