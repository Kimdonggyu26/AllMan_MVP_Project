

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
body {
	background-color: #131313;
	
	color: white;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.container {
    text-align: center;

 
   
}

.username {
    font-size: 40px;
    margin-bottom: 30px;
}

.highlight {
    font-size: 40px;
    color: #FE7D7D; /* ������ ������ �ؽ�Ʈ */
    margin-bottom: 20px;
}

.content {
    font-size: 24px;
    margin-bottom: 160px;
}
.main{
    font-size: 40px;
    margin-bottom: 10px;
}
.sub{
   font-size: 24px; 
    margin-bottom: 130px;
}
.main-button {
    background-color: #F33F3F;
    color: white;
    width: 570px;
    height: 70px;
    border: none;
    border-radius: 5px;
    font-size: 20px;
    cursor: pointer;
    
}
</style>
</head>

<%
	String ContextPath = request.getContextPath(); // "/web"
%>
<body>
    <div class="container">
        <h1 class="username">ooo���� test��м� �����</h1>
        <h2 class="highlight">NDHE</h2>
       
            <div class="main">���� �߽��� ����test��  ��� ��ȣ��</div>
            <div class="sub">���� �ִ� �̾߱�test�� + �ð��� �Ƹ��ٿ� + ���ſ� ���� + ���� ���</div>

        <p class="content">���⿡ �´� ������test�� �Բ� �����غ�����!</p>
        <a type="submit" href="<%=ContextPath%>"><button class="main-button" >������������</button></a>
    </div>

</body>
</html>