<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body id="main">
  <style>
  @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css');

  #main {
    background-color: #131313;
    width: 100%; min-height: 1080px;
    max-width: 1920px;
    font-family: 'pretendard';
  }

  #card{
    width: 1275px; border: solid 1px;
    margin-left: 322px;
  }

  #board-b{
    margin-top: 35px;
  }

  #page{
    margin-top: 30px;
  }

  #select-bar{
    
    width: 164px;
    height: 45px;
    background-color: #45454b; color: white; border: 1px solid #131313;
  }

  #search-bar{
    height: 45px;
    width: 657px;
    background-color: #666; color: white; border: 1px solid #131313;
  }

  #search-btn{
    height: 45px;
    width: 132px;
    background-color: #F33F3F; color: white;
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

.card{
  height: 400px;
  overflow: hidden;
  border: none;
}

#card-top{
  width:280px;
  height: 380px;
}
.card-body {
  background-color: #222222; /* 카드 본문 회색 배경 */
  color: white;
}

.card-footer {
  background-color: #888888; /* 카드 푸터 어두운 회색 배경 */
  color: white; /* 푸터 텍스트 색상 */
}

.btn-taste button{
  width: 150px;
  height: 30px;
  border-radius: 20px;
  border: none;
  color: white;
  background-color: #3C3C3C;
}

#ndhe{
  background-color: red;
}


.card {
  white-space: nowrap; /* 텍스트가 한 줄로 나오게 설정 */
  overflow: hidden; /* 넘치는 텍스트를 숨기기 */
  text-overflow: ellipsis; /* 넘치는 텍스트를 ... 으로 표시 */
  width: 100%; /* 필요시 텍스트 영역의 너비 조절 */
}
</style>


    <!-- Header, Nav start -->
    <!-- header.jsp include로 표현할 예정 -->
    <!-- Header, Nav end -->

    <!-- Section start -->

    <section>
      <div class="btn-taste">
        <div class="row justify-content-center mt-5 mb-3">
          <button type="button" class="mx-2" id="ndhe">NDHE 게시판</button><button type="button" class="mx-2" id="vdse">VDSE 게시판</button><button type="button" class="mx-2" id="sptf">SPTF 게시판</button><button type="button" class="mx-2" id="bofa">BOFA 게시판</button>
        </div>
        <div class="row justify-content-center mb-3">
          <button type="button" class="mx-2" id="etrf">ETRF 게시판</button><button type="button" class="mx-2" id="ccfe">CCFE 게시판</button><button type="button" class="mx-2" id="case">CASE 게시판</button><button type="button" class="mx-2" id="hhal">HHAL 게시판</button>
        </div>
      </div>

      <div class="container" id="bt1">

        <div class="d-flex justify-content-end mb-3">
          <button type="button" class="btn btn-secondary btn-sm">작성하기</button>
        </div>

        <div class="row justify-content-center">
          <!-- 첫 번째 카드 -->
          <div class="col-4 mb-4">
            <div class="card">
              <img class="card-img-top" src="../../assets/image/city3.jpg" alt="영화 이미지">
              <div class="card-body">
                <table>
                  <tr>
                    <th>영화제목</th>
                  </tr>
                  <tr>
                    <td style="color: #bdbdbd;"><%= contextPath %></td>
                  </tr>
                  <tr>
                    <td style="color: #bdbdbd;"><%= contextPath %></td>
                  </tr>
                </table>
              </div>
              <div class="card-footer">
                <table>
                  <tr>
                    <td><img src="../assets/image/Ellipse 512.png" style="width: 25px; height: 25px;"></td>
                    <td><%= contextPath %></td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
            <!--   for문 사용 
           두 번째 카드
          <div class="col-4 mb-4">
            <div class="card">
              <img class="card-img-top" src="../../assets/image/city3.jpg" alt="영화 이미지">
              <div class="card-body">
                <table>
                  <tr>
                    <th><%= contextPath %></th>
                  </tr>
                  <tr>
                    <td><%= contextPath %></td>
                  </tr>
                  <tr>
                    <td><%= contextPath %></td>
                  </tr>
                </table>
              </div>
              <div class="card-footer">
                <table>
                  <tr>
                    <td><img src="../assets/image/Ellipse 512.png" style="width: 25px; height: 25px;"></td>
                    <td><%= contextPath %></td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
      
          세 번째 카드 
          <div class="col-4 mb-4">
            <div class="card">
              <img class="card-img-top" src="../../assets/image/city3.jpg" alt="영화 이미지">
              <div class="card-body">
                <table>
                  <tr>
                    <th><%= contextPath %></th>
                  </tr>
                  <tr>
                    <td><%= contextPath %></td>
                  </tr>
                  <tr>
                    <td><%= contextPath %></td>
                  </tr>
                </table>
              </div>
              <div class="card-footer">
                <table>
                  <tr>
                    <td><img src="../assets/image/Ellipse 512.png" style="width: 25px; height: 25px;"></td>
                    <td><%= contextPath %></td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
          
           네 번째 카드 
          <div class="col-4 mb-4">
            <div class="card">
              <img class="card-img-top" src="../../assets/image/city3.jpg" alt="영화 이미지">
              <div class="card-body">
                <table>
                  <tr>
                    <th><%= contextPath %></th>
                  </tr>
                  <tr>
                    <td><%= contextPath %></td>
                  </tr>
                  <tr>
                    <td><%= contextPath %></td>
                  </tr>
                </table>
              </div>
              <div class="card-footer">
                <table>
                  <tr>
                    <td><img src="../assets/image/Ellipse 512.png" style="width: 25px; height: 25px;"></td>
                    <td><%= contextPath %></td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
          
          다섯 번째 카드
          <div class="col-4 mb-4">
            <div class="card">
              <img class="card-img-top" src="../../assets/image/city3.jpg" alt="영화 이미지">
              <div class="card-body">
                <table>
                  <tr>
                    <th><%= contextPath %></th>
                  </tr>
                  <tr>
                    <td><%= contextPath %></td>
                  </tr>
                  <tr>
                    <td><%= contextPath %></td>
                  </tr>
                </table>
              </div>
              <div class="card-footer">
                <table>
                  <tr>
                    <td><img src="../assets/image/Ellipse 512.png" style="width: 25px; height: 25px;"></td>
                    <td><%= contextPath %></td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
          
          여섯 번째 카드
          <div class="col-4 mb-4">
            <div class="card">
              <img class="card-img-top" src="../../assets/image/city3.jpg" alt="영화 이미지">
              <div class="card-body">
                <table>
                  <tr>
                    <th><%= contextPath %></th>
                  </tr>
                  <tr>
                    <td><%= contextPath %></td>
                  </tr>
                  <tr>
                    <td><%= contextPath %></td>
                  </tr>
                </table>
              </div>
              <div class="card-footer">
                <table>
                  <tr>
                    <td><img src="../assets/image/Ellipse 512.png" style="width: 25px; height: 25px;"></td>
                    <td><%= contextPath %></td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
      
          일곱 번째 카드 
          <div class="col-4 mb-4">
            <div class="card">
              <img class="card-img-top" src="../../assets/image/city3.jpg" alt="영화 이미지">
              <div class="card-body">
                <table>
                  <tr>
                    <th><%= contextPath %></th>
                  </tr>
                  <tr>
                    <td><%= contextPath %></td>
                  </tr>
                  <tr>
                    <td><%= contextPath %></td>
                  </tr>
                </table>
              </div>
              <div class="card-footer">
                <table>
                  <tr>
                    <td><img src="../assets/image/Ellipse 512.png" style="width: 25px; height: 25px;"></td>
                    <td><%= contextPath %></td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
          
         여덟 번째 카드
          <div class="col-4 mb-4">
            <div class="card">
              <img class="card-img-top" src="../../assets/image/city3.jpg" alt="영화 이미지">
              <div class="card-body">
                <table>
                  <tr>
                    <th><%= contextPath %></th>
                  </tr>
                  <tr>
                    <td><%= contextPath %></td>
                  </tr>
                  <tr>
                    <td><%= contextPath %></td>
                  </tr>
                </table>
              </div>
              <div class="card-footer">
                <table>
                  <tr>
                    <td><img src="../assets/image/Ellipse 512.png" style="width: 25px; height: 25px;"></td>
                    <td><%= contextPath %></td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
          
        아홉 번째 카드 
          <div class="col-4 mb-4">
            <div class="card">
              <img class="card-img-top" src="../../assets/image/city3.jpg" alt="영화 이미지">
              <div class="card-body">
                <table>
                  <tr>
                    <th><%= contextPath %></th>
                  </tr>
                  <tr>
                    <td>영화내용영화내용 영화내용영화내용영화내용</td>
                  </tr>
                  <tr>
                    <td>무슨날짜?</td>
                  </tr>
                </table>
              </div>
              <div class="card-footer">
                <table>
                  <tr>
                    <td><img src="../assets/image/Ellipse 512.png" style="width: 25px; height: 25px;"></td>
                    <td>유저아이디</td>
                  </tr>
                </table>
              </div>
            </div>
          </div>

        </div>
      </div>
     -->

      





        <div id="board-b" class="row justify-content-center">
          <form method="post" name="search" action="">
              <table class="">
                <tr>
                  <td><select class="form-control" name="searchField" id="select-bar">
                      <option value="bbsTitle"><%= contextPath %></option>
                      <option value="userID"><%= contextPath %></option>
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