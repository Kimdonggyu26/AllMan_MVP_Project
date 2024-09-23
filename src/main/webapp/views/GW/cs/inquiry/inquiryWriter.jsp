<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap 사용을 위한 CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- ------------------------- -->
</head>
 
<body id="main">

    <!-- Header, Nav start -->
    <%@ include file="/views/common/header.jsp" %>
    <!-- Header, Nav end -->

  <div class="container-me">
      <form action="<%= contextPath %>/insert.iq" method="post" enctype="multipart/form-data">
        <div id="title" >
          <h5>1:1 문의</h5>
        </div>
        
          <!-- 아이디 -->
          <div class="form-group" id="id-bar">
              *<label>아이디</label>
              <input type="text" value="user01"  readonly>
          </div>

          <!-- 문의 유형 -->
          <div class="form-group" id="select-bar">
              *<label style=>문의 유형</label>
              <select>
                  <option>문의 유형</option>
                  <option value="general">일반 문의</option>
                  <option value="tech">기술 문의</option>
                  <option value="billing">결제 문의</option>
              </select>
          </div>

          <!-- 문의 제목 -->
          <div class="form-group" id="iq-title">
              *<label>문의 제목</label>
              <input type="text" name="title placeholder="문의 제목">
          </div>

          <!-- 문의 내용 -->
          <div class="form-group" id="iq-content">
              *<label>문의 내용</label>
              <textarea name="content" rows="8" placeholder="문의 내용을 입력하세요"></textarea>
          </div>


          <!-- 파일 첨부 -->
          <div class="form-group" id="att-box">
              <label>파일 첨부</label>
              <input name="upfile" type="file" id="file-upload">
          </div>

          <!-- 주의사항 -->
          <div class="form-notice" id="ct-box">
              * 첨부 파일은 최대 3개까지 가능합니다.<br>
              * 10MB 파일만 업로드 가능합니다.<br>
              * 첨부 가능한 파일 형식: jpg, jpeg, png, gif, ppt, pdf<br>
              * 문의 내용은 암호화됩니다.
          </div>

          <!-- 버튼 -->
          <div class="form-actions" id="button-rc">
              <button type="submit" class="btn btn-register" style="background-color: #F33F3F; color: white; margin-right: 50px;">등록</button>
              <button type="reset" class="btn btn-cancel" style="background-color: #585858; color: white;" onclick="history.back();">취소</button>
          </div>
      </form>
  </div>
  
  
  <!-- Footer start -->
  <%@ include file="/views/common/footer.jsp" %>
  <!-- Footer end -->
    
</body>

<style>
  html{
  display: flex;
  justify-content: center;
	}

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

  #title{
    margin-top: 50px; 
    margin-bottom: 20px;
    color: white;
  }

  #id-bar{
    color: #F56C6C;
  }
  #id-bar label{
    color: white;
  }

  #id-bar input{
    background-color: #131313; border: none; color: white;
    margin-left: 50px;
    outline: none;
    width: 150px;
  }

  #select-bar{
    background-color: #131313; border: none; color: #F56C6C;
  }

  #select-bar label{
    color: white;
  }

  #select-bar select{
    background-color: #131313; color: white;
    margin-left: 33px;
    border-color: #7d7b7b;
    width: 150px;
    outline: none;
  }

  #iq-title{
    background-color: #131313; border: none; color: #F56C6C;
    margin-bottom: 20px;
  }

  #iq-title label{
    color: white;
  }

  #iq-title input{
    background-color: #131313; color: white;
    margin-left: 33px;
    outline: none;
    border: solid 1px #7d7b7b;
    width: 600px;
  }

  #iq-content{
    background-color: #131313; border: none; color: #F56C6C;
    display: flex;
    align-items: flex-start;
  }

  #iq-content label{
    color: white;
    margin-right: 5px;
  }
  
  #iq-content textarea{
    background-color: #131313; color: white;
    margin-left: 33px;
    outline: none;
    border: solid 1px #7d7b7b;
    width: 600px;
    resize: none;
    display: block;
  }
      #att-box{
  margin-top: 50px;
  background-color: #131313; border: none; color: white;
	}
	
	#att-box label{
	  margin-left: 5px;
	}
	
	#file-upload{
	  margin-left: 40px;
	  background-color: #131313;
	}
	
	#ct-box{
	  margin-top: 40px;
	  color: white;
	}
	
	#button-rc{
	  display: flex;
	  margin-top: 100px;
	  justify-content: center;
	}

</style>

</html>