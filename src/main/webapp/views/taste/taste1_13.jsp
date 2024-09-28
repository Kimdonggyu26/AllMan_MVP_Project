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
    background-color: #60D060; /* ��� ��ư ���� */
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
<body>
    <div class="container">
        <div class="font">��ȭ ���� �м�</div>
        <div class="content">��ȭ�� ��ü���� �����⸦ ������ ��, � ��Ÿ���� ��ȣ�Ͻó���?</div>
        <div class="button-group">
            <button class="btn" id="btn1">���ſ� ������ ������ ��</button>
            <button class="btn" id="btn2">������ ������ ���Ӱ� �ִ� ��</button>
            <button class="btn skip">�Ѿ��</button>
        </div>
    </div>
</body>
</html>