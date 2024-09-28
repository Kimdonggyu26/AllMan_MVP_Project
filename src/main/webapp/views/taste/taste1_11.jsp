<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
/* 전체 컨테이너 중앙 정렬 */
body{
    background-color: #131313;
    font-family: 'pretendard';
}
.container {
    display: flex;
    flex-direction: column; /* 세로 방향으로 정렬 */
    justify-content: center;
    align-items: center;
    margin-top: 10%;
    text-align: center;
}
input:focus {outline: none;}

/* 버튼 그룹 스타일 */
.button-group {
    display: flex;
    flex-direction: column; /* 버튼들을 세로로 정렬 */
    margin-top: 20px;
}

/* 버튼 스타일 */
.btn {
    border: none;
    border-radius: 5px;
    background-color: #60D060; /* 녹색 버튼 색상 */
    color: white; /* 텍스트 색상 */
    font-size: 16px;
    cursor: pointer; 
    width: 570px; /* 버튼의 고정된 너비 */
    height: 70px;
    text-align: center;

}

/* '넘어가기' 버튼 스타일 */
.btn.skip {
    margin-top: 106px;
    background-color: #F33F3F; /* 빨간색 버튼 */
}
#btn1{
    margin-top: 40px;
}
#btn2{
    margin-top: 40px;
}
.font{
    font-size: 40px;
    color: white;
}
.content{
    margin-top: 40px;
    font-size: 30px;
    color: white;
}
</style>
<%
	String tsContextPath = request.getContextPath(); // "/web"
%>

<body>
    <div class="container">
        <div class="font">영화 취향 분석</div>
        <div class="content">주인공의 성장을 어떻게 묘사하는 것을 선호하십니까?</div>
        <div class="button-group">
        	<form id="tasteForm" action="<%=tsContextPath%>/taste.t11" method="post">
			    <input type="hidden" name="taste" id="tasteInput" value="">
			    <button type="submit" class="btn" id="btn1" onclick="setTasteValue(0)">이야기의 깊이와 전개</button>
			    <br>
			    <button type="submit" class="btn" id="btn2" onclick="setTasteValue(1)">시각적 아름다움과 연출</button>
			</form>
        </div>
    </div>
</body>

<script>
    function setTasteValue(tasteValue) {
        // Set the hidden input value based on the button clicked
        document.getElementById('tasteInput').value = tasteValue;
    }
</script>
</html>