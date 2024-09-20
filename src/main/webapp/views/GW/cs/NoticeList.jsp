<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <!-- Bootstrap 사용을 위한 CDN -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- ------------------------- -->
  <style>
  @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css');

  html{
    display: flex;
    justify-content: center;
  }

  #main {
    background-color: #131313;
    width: 1920px; min-height: 1080px;
    font-family: 'pretendard';
  }

  #head{
    width: 1276px; margin-left: 322px; margin-top: 61px;
  }

  #head h3{
    color: rgb(255, 255, 255)
  }

  #qna-h{
    width: 1276px; margin-left: 322px; margin-top: 82px;
  }
  #qna-b{
    margin-top: 44px;
  }

  #page{
    margin-top: 35px;
  }

  #select-bar{
    margin-left: 488px;
    width: 164px;
    height: 45px;
    background-color: #45454b; color: white;  border: none;
  }

  #search-bar{
    height: 45px;
    width: 657px;
    background-color: #666; color: white;  border: none;
  }

  #search-btn{
    height: 45px;
    width: 132px;
    background-color: #F33F3F; color: white;
  }

  thead {
    background-color: #666765;
    color: rgb(255, 255, 255);
  }
  tbody {
    color: rgb(255, 255, 255);
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

input[type="text"]::placeholder {color: #c2b9b9;}

</style>

</head>
<body id="main">

    <!-- Header, Nav start -->
    <!-- header.jsp include로 표현할 예정 -->
    <!-- Header, Nav end -->

    <!-- Section start -->

    <section>

        <div id="head">
          <h3 >공지사항</h3><hr color="white">
        </div>

        <div id="qna-h">
        <table id="qna-list" class="table">
          <thead>
            <tr>
              <th width="700px">글제목</th>
              <th width="150px">작성자</th>
              <th width="150px">작성일</th>
            </tr>
          </thead>
          <tbody>
            <!-- case1. 조회된 Qna가 없을 경우 
            <tr>
              <td colspan="3" style="text-align:center">존재하는 QnA글이 없습니다.</td>
            </tr>
            -->

            <tr class="board-title" data-toggle="collapse" data-target="#qna4">
              <td>공지사항게시판입니다!!!!!!!!!!!!!!!!!</td>
              <td>작성자입니다.</td>
              <td>2024-08-21</td>
            </tr>
            <tr class="board-title collapse" id="qna4">
              <td colspan="3">
                <p class="border rounded p-3 w-75 mx-auto" style="min-height: 150px;">공지사항 내용입니다.</p>
                
                <!-- 로그인한 회원이 관리자 권한일 경우 보여지는 요소 
                <div align="center">
                  <button type="button" class="btn btn-secondary btn-sm">수정하기</button>
                  <button type="button" class="btn btn-danger btn-sm">삭제하기</button>
                </div>
                -->
            </td>
          </tr>

            <tr class="board-title" data-toggle="collapse" data-target="#qna3">
              <td>공지사항게시판입니다!!!!!!!!!!!!!!!!!</td>
              <td>작성자입니다.</td>
              <td>2024-08-21</td>
            </tr>
            <tr class="board-title collapse" id="qna3">
              <td colspan="3">
              <p class="border rounded p-3 w-75 mx-auto" style="min-height: 150px;">공지사항 내용입니다.</p>
              </td>
          </tr>

            <tr class="board-title" data-toggle="collapse" data-target="#qna2">
              <td>공지사항게시판입니다!!!!!!!!!!!!!!!!!</td>
              <td>작성자입니다.</td>
              <td>2024-08-21</td>
            </tr>
            <tr class="board-title collapse" id="qna2">
              <td colspan="3">
              <p class="border rounded p-3 w-75 mx-auto" style="min-height: 150px;">공지사항 내용입니다.</p>  
              </td>
          </tr>

            <tr class="board-title" data-toggle="collapse" data-target="#qna1">
              <td>공지사항게시판입니다!!!!!!!!!!!!!!!!!</td>
              <td>작성자입니다.</td>
              <td>2024-08-21</td>
            </tr>
            <tr class="board-title collapse" id="qna1">
              <td colspan="3">
              <p class="border rounded p-3 w-75 mx-auto" style="min-height: 150px;">공지사항 내용입니다.</p>
              </td>
          </tr>

          </tbody>
        </table>
        </div>

        <div id="qna-b">
          <form method="post" name="search" action="">
              <table class="">
                <tr>
                  <td><select class="form-control" name="searchField" id="select-bar">
                      <option value="bbsTitle">제목+내용</option>
                      <option value="userID">작성자</option>
                  </select></td>
                  <td><input type="text" class="form-control" id="search-bar" placeholder="검색" name="searchText"> </td> 
                  <td><button type="submit" class="btn" id="search-btn">검색</button></td>
      
              </table>
            </form>
          </div>

        <ul class="pagination d-flex justify-content-center text-dark" id="page">
          <li class="page-item disabled"><a class="page-link" href="">&lt;</a></li>
          <li class="page-item active"><a class="page-link" href="">1</a></li>
          <li class="page-item"><a class="page-link" href="">2</a></li>
          <li class="page-item"><a class="page-link" href="">3</a></li>
          <li class="page-item"><a class="page-link" href="">4</a></li>
          <li class="page-item"><a class="page-link" href="">5</a></li>
          <li class="page-item"><a class="page-link" href="">&gt;</a></li>
        </ul>



    </section>








  <!-- Section end -->

  <!-- Footer start -->
  <!-- footer.jsp include 할 예정 -->
  <!-- Footer end -->

  
</body>
</html>