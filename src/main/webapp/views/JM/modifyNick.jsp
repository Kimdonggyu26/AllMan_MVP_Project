<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
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
			    background-color: rgba(255, 255, 255, 0.116);
			    color: white;
			    padding: 0px;
			    margin-bottom: 32px;
			    
			}
			input::placeholder{padding-left: 20px;}
			.button-group{
			  width: 577px;
			    height: 70px;
			    font-size: 20px;
			}
			#buttons{
			  margin-top: 25px;
			  background-color: #ffffff;

			    width: 577px;
			    height: 70px;
			    font-size: 20px;
			    border-radius: 5px;
			    border: 0px;
			    margin-top: 15px;
			    padding: 0px;
			    font-weight: 900;
			   
			}
			.container{
			  margin-top: 250px;
			  align-items: center;
			  display: flex;
			    flex-direction: column; /* 세로 방향으로 정렬 */
			    text-align: left;
			
			}
			.idfo{
			  font-size: 40px;
			  color: white;
			  margin: auto;
			  margin-bottom: 9px;
			}
			#ifound{
			
			  color: white;
			  margin-top: 30px;
			  text-align: left;
			}
			input:focus {outline: none;}
			.font{
			  font-size: 15px;
			  color: white;
			  text-align: left;
			  margin-top: 10px;
			  margin-bottom: 31px;
			}
			#imgbt{
			  background-color: #131313;
			  border: none;
			  margin-bottom: 15px;
			  
			}
			#imgbt img{
			  width: 250px;
			  height: 250px;
			 
			}
			
			#imgbt:hover{
			  border: none;
			  cursor: pointer;
			}

  </style>
  
</head>
			<body>


<%-- 
			<%
			   String contextPath = request.getContextPath();
					%>
		<% 
		String alertMsg = (String) session.getAttribute("alertMsg");
		if (alertMsg != null) { 
		%>
		    <div class="alert alert-success"><%= alertMsg %></div>
		    <% session.removeAttribute("alertMsg"); // 메시지 표시 후 세션에서 제거 %>
		<% 
		} 
		%>
<!-- multipart/form-data를 추가하여 파일 업로드 가능하게 설정 -->
<form action="<%= contextPath %>/modifynick.us" method="post" enctype="multipart/form-data">
    <input type="hidden" name="userId" value="<%= request.getAttribute("userId") %>">
    <div class="container">
        <div class="idfo">프로필 사진을 선택하세요</div>
        <input type="file" name="profileImage" class="ifound" required> <!-- 파일 업로드 입력 -->
        <div class="font">프로필 이미지 추가하기</div>
        <div class="idfo">닉네임을 설정해주세요</div>
        <div class="button-group">
            <input type="text" class="ifound" name="usernick" placeholder="닉네임" required>
            <button type="submit" id="buttons">확인</button>
        </div>
    </div>
</form>
 --%>
 					<%
			   String contextPath = request.getContextPath();
					%>
				<form action="<%= contextPath %>/modifyProfile.us" method="post" enctype="multipart/form-data">
				    <input type="hidden" name="userId" value="<%= request.getAttribute("userId") %>">
				    <div class="container">
				        <div class="idfo">프로필 사진을 선택하세요</div>
				         <label for="profileImage">
								        <img id="imagePreview" src="https://via.placeholder.com/200" alt="Click to upload" style="cursor: pointer; width: 200px; height: 200px; border: 1px solid #ccc;">
								    </label>
								    <!-- 파일 입력 필드 숨기기 -->
								    <input type="file" name="profileImage" id="profileImage" class="imagefile" style="display: none;" required>
				        <div class="font">프로필 이미지 추가하기</div>
				        <div class="idfo">닉네임을 설정해주세요</div>
				        <div class="button-group">
				            <input type="text" class="ifound" name="usernick" placeholder="닉네임" required>
				            <button type="submit" id="buttons">확인</button>
				        </div>
				    </div>
				</form>
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