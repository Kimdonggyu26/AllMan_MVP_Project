<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
/* ��ü �����̳� �߾� ���� */
body{
    background-color: #131313;
    font-family: 'pretendard';
}
.container {
    display: flex;
    flex-direction: column; /* ���� �������� ���� */
    justify-content: center;
    align-items: center;
    margin-top: 10%;
    text-align: center;
}
input:focus {outline: none;}

/* ��ư �׷� ��Ÿ�� */
.button-group {
    display: flex;
    flex-direction: column; /* ��ư���� ���η� ���� */
    margin-top: 20px;
}

/* ��ư ��Ÿ�� */
.btn {
    border: none;
    border-radius: 5px;
    background-color: #2BAF81; /* ��� ��ư ���� */
    color: white; /* �ؽ�Ʈ ���� */
    font-size: 16px;
    cursor: pointer; 
    width: 570px; /* ��ư�� ������ �ʺ� */
    height: 70px;
    text-align: center;

}

/* '�Ѿ��' ��ư ��Ÿ�� */
.btn.skip {
    margin-top: 106px;
    background-color: #F33F3F; /* ������ ��ư */
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
        <div class="font">��ȭ ���� �м�</div>
        <div class="content">��ȭ�� ���� ��� �� ��� �κ��� �� �߿��Ѱ���?</div>
        <div class="button-group">
        	<form id="tasteForm" action="<%=tsContextPath%>/taste.t9" method="post">
			    <input type="hidden" name="taste" id="tasteInput" value="">
			    <button type="submit" class="btn" id="btn1" name="taste2" value="0" onclick="setTasteValue(0)">������ ö�а� ��ȭ�� �޽���</button>
			    <br>
			    <button type="submit" class="btn" id="btn2" value="1" onclick="setTasteValue(1)">ȭ���� �Կ� ����� �ð����� ����</button>
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