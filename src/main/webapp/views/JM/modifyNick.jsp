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
			  color: rgb(0, 0, 0);
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

   	<!-- Header, Nav start -->
   <%--  <%@ include file="/views/common/header.jsp" %> --%>
    <!-- Header, Nav end -->

				<!-- body부 시작 -->

			<div class="container">
			          <a href="" id="imgbt"><img src="/AllMan_MVP_Project/src/main/webapp/resources/user_upfiles/스크린샷 2024-05-02 093857.png" alt=""></a>
			        <div class="font">프로필 이미지 추가하기</div>
			          <div class="idfo">닉네임을 설정해주세요</div>
			        <div class="button-group">
			  <input type="text" class="ifound" placeholder="닉네임" >
			  <button type="submit"  id="buttons">확인</button>
			</div>
			</div>
			
			<!-- body부 종료 -->
			
			
   	<!-- Header, Nav start -->
   <%--  <%@ include file="/views/common/footer.jsp" %> --%>
    <!-- Header, Nav end -->			
			
			
</body>
</html>