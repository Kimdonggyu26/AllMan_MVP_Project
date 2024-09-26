<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  

  
  
<body id="main">

  
 	<!-- Header, Nav start -->
   <%@ include file="/views/common/header.jsp" %>
  <!-- Header, Nav end -->

  <!-- Section start -->
  <section class="container-me">
    <div id="content-regist">
      취향게시판 글쓰기
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
          <button class="btn" type="reset" style="background-color: #3D3E3D; color: white;"  onclick="resetForm()">초기화</button>
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
              <select id="tboard" name="tboard" class="form-control" style="background-color: #3D3E3D; color: #BEBEBE; border: none;">
                <option value="10<%-- loginUser.getTasteNo --%>"><%--loginUser.getTasteCode --%>NDHE게시판</option>
                <option value="0">자유게시판</option>
              </select>
            </td>
            <td colspan="2">
              <input type="text" name="search" id="search1" size=40 class="form-control" placeholder="영화 제목을 입력해주세요." style="background-color: #3D3E3D; color: white;" required onclick="openModal()">
            </td>
          </tr>
          <tr>
            <td colspan="3">
              <textarea rows="20" name="content" id="content-text" class="form-control" style="resize:none; background-color: #3D3E3D; color: white;" placeholder="내용을 입력해주세요." required></textarea>
            </td>
          </tr>
        </table>
      </div>
    </div>
    
     <div id="searchModal" class="modal">
      <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2>검색어 입력</h2>
        <input type="text" id="modalSearch" placeholder="검색어를 입력하세요." style="margin-bottom:10px">
        <a href="<%= contextPath %>/insert.sh" class="mx-2 btn btn-sm" onclick="performSearch()" id="m-search">검색</a>
      </div>
    </div>
    
    <script>
    
    function submitForm() {
        const title = document.getElementById('title').value;
        const tboard = document.getElementById('tboard').value;
        const search = document.getElementById('search1').value;
        const content = document.getElementById('content-text').value;

        // AJAX 요청
        fetch('/inset.tbo', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            title: title,
            tboard: tboard,
            search: search,
            content: content
          })
        });
      }
      
      function resetForm() {
        document.getElementById('title').value = '';
        document.getElementById('tboard').value = '10'; // 기본값으로 초기화
        document.getElementById('search1').value = '';
        document.getElementById('content-text').value = '';
      }

      function openModal() {
        document.getElementById('searchModal').style.display = 'block';
      }

      function closeModal() {
        document.getElementById('searchModal').style.display = 'none';
      }

      function performSearch() {
        closeModal(); // 검색 후 모달 닫기
      }
        

    </script>
    
  </section>
  <!-- Section end -->
  
  	<!-- Header, Nav start -->
    <%@ include file="/views/common/footer.jsp" %>
    <!-- Header, Nav end -->
  
</body>

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
    
         /* 모달 스타일 */
     .modal {
       display: none; /* 기본적으로 숨김 */
       position: fixed; /* 고정 위치 */
       z-index: 1; /* 최상위 */
       width: 100%; /* 전체 너비 */
       height: 100%; /* 전체 높이 */
       overflow: auto; /* 필요 시 스크롤 가능 */
       background-color: rgba(0, 0, 0, 0.4); /* 투명한 검은색 */
     }

     .modal-content {
       background-color: #131313;
       color : white;
       margin: 15% auto; /* 중앙 정렬 */
       padding: 20px;
       border: 1px solid #888;
       width: 80%; /* 화면 크기에 따라 다름 */
     }

     .close {
       color : white;
       float: right;
       font-size: 25px;
     }

     .close:hover,
     .close:focus {
       color: black;
       text-decoration: none;
       cursor: pointer;
       }
       
      #modalSearch{
       	width: 100%; 
       	height: 40px;
       	color: white;
       	outline: none;
       	border: none;
       }
       
      #m-search{
       color: white;
       background-color : #F33F3F
       }
     
        

  </style>
</html>