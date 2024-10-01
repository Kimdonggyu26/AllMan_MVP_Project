	<%@ page import="com.mvp.semi.user.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<%
	String contextPath = request.getContextPath(); 
String alertMsg = (String)session.getAttribute("alertMsg");
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
		padding-left: 20px;
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
	 .error-message {
            color: red;
            margin-top: 10px;
            text-align: center;
        }
</style>


	<div class="container p-3">
    <form action="<%=contextPath%>/login.us" method="post">
        <div class="header">
            <h1 id="login-put">MOVIE PICK 로그인</h1>
        </div>
        <div class="login-form m-3">
            <input type="text" placeholder="아이디" id="id" name="userId" required>
            <br>
            <input type="password" placeholder="비밀번호" id="pass" name="userPwd" required>
            <br>
            <button type="submit" id="login-out" style="background-color: gray;">로그인하기</button>
        </div>
           <div id="password-error" class="error-message" style="display: none;">비밀번호 입력이 완료되었습니다.</div>
        
    </form>
    
    <!-- 추가적인 링크 부분 -->
    <div>
        <table class="found">
            <tr>
                <td class="p-3"><a href="<%= contextPath %>/views/account/findId.jsp">아이디 찾기 &nbsp|&nbsp  </a></td>
                <td class="p-3"><a href="<%= contextPath %>/views/account/findPwd.jsp">비밀번호 찾기 &nbsp | &nbsp </a></td>
                <td class="p-3"><a href="<%= contextPath%>/signup.us">회원가입</a></td>
            </tr>
        </table>
    </div>
</div>
<script>
    $(document).ready(function() {
        // 비밀번호 입력이 완료되면 메시지가 뜨도록 설정
        $("#loginForm").on("submit", function(event) {
            const password = $("#pass").val();
            if (password.length > 0) {
                $("#password-error").show(); // 로그인 버튼을 눌렀을 때 메시지 표시
            } else {
                $("#password-error").hide(); // 비밀번호가 없으면 메시지 숨김
            }
        });

        // 모든 입력 필드에서 입력을 감지해 버튼 색상 변경
        $(".login-form input").on("input", function() {
            checkAllFields(); // 각 필드가 입력될 때마다 필드 확인 함수 호출
        });

        function checkAllFields() {
            const userId = $(".login-form input[name=userId]").val();
            const userPwd = $(".login-form input[name=userPwd]").val();

            // 모든 필드가 입력되었는지 확인
            if (userId && userPwd) {
                $("#login-out").css("background-color", "#f33f3f"); // 배경색 빨간색으로 변경
            } else {
                $("#login-out").css("background-color", "gray"); // 기본 배경색으로 되돌림
            }
        }
    });
</script>
		
</body>

</html>