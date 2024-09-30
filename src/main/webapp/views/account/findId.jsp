	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					}
					#ifound{
					
					  color: white;
					  margin-top: 30px;
					  text-align: left;
					}
					input:focus {outline: none;}
					.font{
					  font-size: 12px;
					  color: gray;
					  text-align: left;
					  margin-top: 10px;
					}
					
					  </style>
					  
					</head>
					
					<body>

						 <%
								String contextPath = request.getContextPath();
							%> 			
												
					<!-- body부 시작  -->
				  	<form action="<%=contextPath %>/findid.us" >
						<div class="container">
						          <div class="idfo">아이디 찾기</div>
						          <div class="font">가입 시 등록한 이메일을 입력해주세요.</div>
						        <div class="button-group">
						  <input type="text" class="ifound"   id="emailInput" name="email" placeholder="이메일"  >
						  <button type="submit"  id="buttons" >확인</button>
						</div>
					</div>
					</form>
						<script>
    const emailInput = document.getElementById("emailInput");
    const submitButton = document.getElementById("buttons");

    // 이메일 입력 값 감지
    emailInput.addEventListener("input", function() {
        if (emailInput.value.trim() !== "") {
            // 값이 입력된 경우 배경색을 빨간색으로 변경
            submitButton.style.backgroundColor = "#f33f3f";
        } else {
            // 값이 없는 경우 기본 배경색으로 변경
            submitButton.style.backgroundColor = "#ffffff91";
        }
    });
</script>
</body>
</html>