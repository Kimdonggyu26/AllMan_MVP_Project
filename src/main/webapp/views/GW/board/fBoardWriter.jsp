<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title> 
</head>

<body id="main">

  <!-- Header, Nav start -->
  <%@ include file="/views/common/header.jsp" %>
  <!-- Header, Nav end -->

  <!-- Section start -->
  <section class="container-me">
    <div id="content-regist">게시판 글작성</div>

    <div id="all">
      <!-- 왼쪽 이미지와 버튼 -->
      <div id="content-box">
        <div id="cbo">
          <img src="<%=contextPath%>/resources/board_upfiles/QnA.png" alt="image" width="275px" height="370px" name="ttimg" onclick="openModal()" id="basic">
        </div>
        <div id="button-red">
          <button class="btn" type="button" style="background-color: #F33F3F; color: white;" onclick="fnWriteInsert();">등록하기</button>
        </div>
        <div id="button-reset"> 
          <button class="btn" type="reset" style="background-color: #3D3E3D; color: white;" onclick="resetForm()">초기화</button>
        </div>
      </div>

      <!-- 오른쪽 입력 폼 -->
      <div id="content">
        <input type="hidden" id="movieNo" name="movieNo">
        <table class="table-borderless">
          <tr>         
            <td colspan="2">
              <div class="input-container">
                <label for="title">제목 |</label>
                <input type="text" id="title" name="tt" placeholder="내용을 입력하세요." style="border: none;">
              </div>
            </td>
          </tr>
          <tr>
            <td style="width: 140px;">
              <select id="tboard" name="tboard" class="form-control" style="background-color: #3D3E3D; color: #BEBEBE; border: none;" onchange="resetSearchResults()">
                <option value="<%= loginUser.getTasteNo() %>"><%= loginUser.getTasteCode() %>게시판</option>
                <option value="0"  selected>자유게시판</option>
              </select>
            </td>
            <td colspan="2">
              <input type="text" name="search" id="search1" size="40" class="form-control" placeholder="영화 제목을 입력해주세요." required onclick="openModal()" readonly>
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
      <div class="modal-content" style="width: 760px; min-height: 100px;">
        <span class="close" onclick="closeModal()">&times;</span>
        <h3>영화검색</h3>
        <div id="search3">
          <input type="text" id="modalSearch" placeholder="검색어를 입력하세요." style="margin-bottom:10px">
          <button class="btn" onclick="performSearch()" id="m-search">검색</button>
        </div>
        <hr color="white" style="width: 680px; margin-right: 31px;">
        <div style="text-align: left; color: white;">
          <table id="search-area" style="width: 680px;"></table>
        </div>
        <hr style="background-color: white;">
        <ul class="pagination d-flex justify-content-center text-dark" id="page-area"></ul>
      </div>
    </div>

  </section>
  <!-- Section end -->

  <!-- Footer -->
  <%@ include file="/views/common/footer.jsp" %>
  <!-- JavaScript -->
  <script>
    function resetForm() {
      document.getElementById('title').value = '';
      document.getElementById('tboard').value = '<%= loginUser.getTasteNo() %>';
      document.getElementById('search1').value = '';
      document.getElementById('content-text').value = '';
      document.getElementById('movieNo').value = '';
      
      var imgElement = document.querySelector('#basic');
      if (imgElement) {
        imgElement.src = '<%=contextPath%>/resources/board_upfiles/QnA.png';
      }
    }

    function openModal() {
      document.getElementById('modalSearch').value = '';
      document.getElementById('search-area').innerHTML = '';
      document.getElementById('page-area').innerHTML = '';
      document.getElementById('searchModal').style.display = 'block';
      const boardType = document.getElementById('tboard').value;
    }

    function closeModal() {
      document.getElementById('search-area').innerHTML = '';
      document.getElementById('page-area').innerHTML = '';
      document.getElementById('searchModal').style.display = 'none';
    }
    
    function resetSearchResults() {
        // 검색어 및 검색 결과 초기화
					openModal();
      }

    function selectMovie(titlePath, movieTitle, movieNo) {
      var contextPath = '<%= contextPath %>';
      var imgElement = document.querySelector('#cbo img');
      if (imgElement) {
        imgElement.src = contextPath + titlePath;  
      }

      $("#search1").val(movieTitle);
      document.getElementById('movieNo').value = movieNo;
      closeModal();
    }

    window.onclick = function(event) {
      var modal = document.getElementById('searchModal');
      if (event.target == modal) {
        closeModal();
      }
    }

    function performSearch(page) {
      var search = document.getElementById('modalSearch').value.trim();
      const boardType = document.getElementById('tboard').value;
      if (search === "") {
        $('#search-area').html('<tr><td colspan="4">검색결과가 없습니다.</td></tr>');
        return;
      }
      
      $.ajax({
        url: '<%= contextPath %>/fbSearch.mv',
        type: 'GET',
        data: {
        	no: <%= loginUser.getTasteNo() %>,
        	boardType: boardType,
          search: search,
          page: page
        },
        success: function(res) {
          let s = res.list;
          let p = res.pi;
          let scEl = "";

          if (s.length === 0) {
            scEl += '<tr><td colspan="4">검색결과가 없습니다.</td></tr>';
          } else {
            scEl += '<tr>' +
                     '<th>영화제목</th>' +
                     '<th>장르</th>' +
                     '<th>출연진</th>' +
                     '<th>감독</th>' +
                     '</tr>';
            scEl += '<tr><td colspan="4" style="border-top: 1px solid #ccc; height: 0px;"></td></tr>';
            
            for (let i = 0; i < s.length; i++) {
              scEl += '<tr onclick="selectMovie(\'' + s[i].titlePath + '\', \'' + s[i].movieTitle + '\', ' + s[i].movieNo + ')">' +    
                       '<td>' + s[i].movieTitle + '</td>' +
                       '<td>' + s[i].genre + '</td>' +
                       '<td>' + s[i].actor + '</td>' +
                       '<td>' + s[i].director + '</td>' +
                       '</tr>';
              scEl += '<tr><td colspan="4" style="border-top: 1px solid #ccc; height: 0px;"></td></tr>';
            }
          }

          $('#search-area').html(scEl);
          createPagination(p);
        },
        error: function(error) {
          console.error('검색 중 오류 발생:', error);
        }
      });
    }

    function createPagination(p) {
      let liEl = "<li class='page-item " + (p.currentPage === 1 ? "disabled" : "") + "'>" +
                 '<a class="page-link" onclick="performSearch(' + (p.currentPage - 1) + ')">&lt;</a>' +
                 "</li>";

      for (let i = p.startPage; i <= p.endPage; i++) {
        liEl += "<li class='page-item " + (i === p.currentPage ? "active" : "") + "'>" +
                '<a class="page-link" onclick="performSearch(' + i + ')">' + i + '</a>' +
                "</li>";
      }

      liEl += "<li class='page-item " + (p.currentPage === p.maxPage ? "disabled" : "") + "'>" +
               '<a class="page-link" onclick="performSearch(' + (p.currentPage < p.maxPage ? (p.currentPage + 1) : p.maxPage) + ')">&gt;</a>' +
               "</li>";

      $('#page-area').html(liEl);
    }

    function fnWriteInsert() {
      const boardType = document.getElementById('tboard').value;
      const boardTitle = document.getElementById('title').value;
      const boardContent = document.getElementById('content-text').value;
      const userNo = <%= loginUser.getUserNo() %>;
      const movieNo = document.getElementById('movieNo').value;

      if (!boardTitle || !boardContent || !movieNo || !boardType) {
        alert("빈값을 입력할 수 없습니다.");
        return;
      }

      // AJAX 요청
      $.ajax({
        url: '<%= contextPath %>/tbinsert.tbo',
        type: 'POST',
        data: {
          boardType: boardType,
          boardTitle: boardTitle,
          boardContent: boardContent,
          userNo: userNo,
          movieNo: movieNo
        },
        success: function(res) {
          if (res > 0) {
            alert("게시글이 성공적으로 등록되었습니다.");
            if (boardType == 10){
            	 window.location.href = '<%= contextPath %>/list.tbo';
            } else if (boardType == 0){
              window.location.href = '<%= contextPath %>/list.fbo';
            } else{
            	window.location.href = '<%= contextPath %>/list.<%= loginUser.getTasteCode() %>';
            }  
          }
        },
        error: function() {
          alert('게시글 작성에 실패하였습니다.');
        }
      });
    }
    
  </script>

</body>

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
    margin-left: 96.5px;
  }

  #button-reset{
    margin-top: 20px;
    margin-left: 103px;
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
    z-index: 1000000; /* 최상위 */
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
	 }
	
	 .close {
	   color : white;
	   float: right;
	   font-size: 25px;
	 }
	
	 .close:hover,
	 .close:focus {
	   color: white;
	   text-decoration: none;
	   cursor: pointer;
	   }
	   
  #modalSearch{
	 	width: 80%; 
	 	height: 40px;
	 	color: white;
	 	outline: none;
	 	border: none;
   }
	   
  #m-search{
   color: white;
   width: 15%;
   height: 40px;
   background-color : #F33F3F;
   margin-left: 10px;
   }
	   
  #search1{
   background-color: #3D3E3D; 
   color: white;
   }
   
   #search3{
    display: flex;
    flex-direction: row;
   }
   
     #page{
    margin-top: 30px;
  }

  .page-link {
    color: #ffffff; 
    background-color: #131313;
    border-color: #131313;;
  }

  .page-item.active .page-link {
    z-index: 1;
    color: #ffffff;
    font-weight:bold;
    background-color: #131313;
    border-color: #131313;;
    text-decoration : underline;
  }

  .page-item.disabled .page-link {
    z-index: 1;
    color: #ffffff;
    font-weight:bold;
    background-color: #131313;
    border-color: #131313;
}

  .page-link:focus, .page-link:hover {
    color: #ffffff;
    background-color: #131313; 
    border-color: #131313;
}

	#search-area {
		cursor: pointer;
	}
	#page-area{
		cursor: pointer;
	}
         

  </style>
</html>