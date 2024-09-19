<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	 <style>
    @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css');

    html{
      display: flex;
      justify-content: center;
    }

    #main {
      background-color: #131313;
      width: 100%; 
      max-width: 1920px;
      min-height: 1080px;
    }

    .container-me{
      font-family: 'pretendard';
      display: flex;
      flex-direction: column;
      align-items: center;
      width: 100%;
      max-width: 1920px;
    }

    #content-regist{
      color: white; 
      font-size: 40px;
      margin-top: 100px;
    }

    #content-box{
      margin-top: 73px;
      display: flex;
      flex-direction: column;
    }

    img{
      width: 274px; 
      height: 369px;
    }

    #button-red{
      margin-top: 35px;
    }

    #button-reset{
      margin-top: 20px;
    }

    #all{
      display: flex;
      flex-direction: row; /* 행 방향으로 변경 */
    }

    #content{
      margin-left: 50px;
      color: white;
      margin-top: 50px;
    }

    #content input{
      border: none;
    }

    #content textarea{
      border: none;
    }

    table{
      border-collapse: separate;
      border-spacing: 10px 10px;
    }

    .input-container {
            display: flex;
            align-items: center;
            background-color: #3D3E3D;
            border-radius: 3px;
            max-width: 550px;
            border: none;
        }

    label {
        color: #BEBEBE;
        font-size: 16px;
        padding-top: 7px;
        margin-right: 10px;
        margin-left: 7px;
    }

    input[type="text"] {
        border-radius: 3px;
        background-color: #3D3E3D;
        font-size: 16px;
    }

    #title{
      color: white;
      width: 440px;
      outline: none;
    }
        

  </style>
  
  
  	<!-- Header, Nav start -->
    <%--  <%@ include file="/views/common/header.jsp" %> --%>
    <!-- Header, Nav end -->
  
  <!-- body부 시작 -->
  
<body id="main">
  <!-- Section start -->
  <section class="container-me">
    <div id="content-regist">
      게시글 등록
    </div>

    <div id="all">
      <!-- 왼쪽 이미지와 버튼 -->
      <div id="content-box">
        <div>
          <img src="../assets/image/city3.jpg" alt="image">
        </div>
        <div id="button-red">
          <button class="btn" type="button" style="background-color: #F33F3F; color: white;">등록하기</button>
        </div>
        <div id="button-reset"> 
          <button class="btn" type="reset" style="background-color: #3D3E3D; color: white;">초기화</button>
        </div>
      </div>

      <!-- 오른쪽 입력 폼 -->
      <div id="content">
        <table class="table-borderless">
          <tr>         
            <td colspan="2" >
              <div class="input-container">
                <label for="title">제목 |</label>
                <input type="text" id="title" placeholder="내용을 입력하세요."  style="border: none;" >
              </div>
            </td>
          </tr>
          <tr>
            <td style="width: 140px;">
              <select name="" class="form-control" style="background-color: #3D3E3D; color: #BEBEBE; border: none;">
                <option value="10">NDHE게시판</option>
                <option value="20">VDSE게시판</option>
                <option value="30">SPTF게시판</option>
                <option value="40">BOFA게시판</option>
                <option value="50">ETRF게시판</option>
                <option value="60">CCFE게시판</option>
                <option value="70">CASE게시판</option>
                <option value="80">HHAL게시판</option>
              </select>
            </td>
            <td colspan="2">
              <input type="text" size=40 class="form-control" placeholder="영화 제목을 입력해주세요." style="background-color: #3D3E3D; color: white;" required>
            </td>
          </tr>
          <tr>
            <td colspan="3">
              <textarea rows="20" class="form-control" style="resize:none; background-color: #3D3E3D; color: white;" placeholder="내용을 입력해주세요." required></textarea>
            </td>
          </tr>
        </table>
      </div>
    </div>
  </section>
  <!-- Section end -->
  
  	<!-- Header, Nav start -->
    <%--  <%@ include file="/views/common/header.jsp" %> --%>
    <!-- Header, Nav end -->
  
</body>
</html>