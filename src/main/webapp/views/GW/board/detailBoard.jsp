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
    <!-- header.jsp include로 표현할 예정 -->
    <!-- Header, Nav end -->

    <!-- Section start -->

    <section class="container-me">

      <div class="btn-taste">
        <div class="row justify-content-center mt-5 mb-3">
          <button type="button" class="mx-2" id="ndhe">NDHE 게시판</button><button type="button" class="mx-2" id="vdse">VDSE 게시판</button><button type="button" class="mx-2" id="sptf">SPTF 게시판</button><button type="button" class="mx-2" id="bofa">BOFA 게시판</button>
        </div>
        <div class="row justify-content-center mb-3">
          <button type="button" class="mx-2" id="etrf">ETRF 게시판</button><button type="button" class="mx-2" id="ccfe">CCFE 게시판</button><button type="button" class="mx-2" id="case">CASE 게시판</button><button type="button" class="mx-2" id="hhal">HHAL 게시판</button>
        </div>
      </div>

      <div id="title">

        <table>
          <tr>
            <th>제목입력제목제목입력제목입력제목입력제목입력</th>
          </tr>
          <tr>
            <td><span>날짜</span>/<span>해시태그</span></td>
          </tr>
        </table>

        <div >
          <img src="../../assets/image/city3.jpg" alt="영화 이미지" id="detail-img">
        </div>
  
        <div id="content">
          <p style="max-height:200px; color: white;">기존 일반게시글 내용</p>
        </div>

      </div>

      <div id="reply">
          <table>
            <tr>
              <td style="color: white; text-align: left;">댓글작성</td>
            </tr>
            <tr>
              <td><textarea id="text-b" placeholder="비속어 등의 댓글은 금지사항이며, 제제 사유입니다 "></textarea></td>
            </tr>
            <tr>
              <td style="text-align: right;"><button class="btn" style="background-color: #F33F3F; color: white;" type="button">등록</button></td>
            </tr>
        </table>
      </div>

      <div style=" text-align: left; color: white; ">
        <table>
          <tr>
            <td style="width: 40px; "><img src="../assets/image/Ellipse 512.png" style="height: 30px; width: 30px;"></td>
            <td style="width: 750px;">user01</td>
          </tr>
          <tr>
            <td colspan="2" style="font-size: 20px;">댓글 달기 멋있는데요? 재밌는데요? ㅏㅎ하ㅏ핳</td>
          </tr>
          <tr>
            <td style="font-size: 10px;">수정</td>
            <td style="font-size: 10px;">삭제</td>
          </tr>
      </table>
      <hr color="white"> 
      </div>

      <div style=" text-align: left; color: white; ">
        <table>
          <tr>
            <td style="width: 40px; "><img src="../assets/image/Ellipse 512.png" style="height: 30px; width: 30px;"></td>
            <td style="width: 750px;">user01</td>
          </tr>
          <tr>
            <td colspan="2" style="font-size: 20px;">댓글 달기 멋있는데요? 재밌는데요? ㅏㅎ하ㅏ핳</td>
          </tr>
          <tr>
            <td style="font-size: 10px;">수정</td>
            <td style="font-size: 10px;">삭제</td>
          </tr>
      </table>
      <hr color="white"> 
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

  </div>

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
    font-family: 'pretendard';
  }

  .container-me{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    flex-wrap: wrap;
    
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
	
	#title{
	  margin-top: 33px;
	}
	#title table{
	  color: white;
	}
	#title th{
	  font-size: 36px;
	}
	
	#detail-img{
	  width: 100%;
	  max-width:280px;
	  height: 350px;
	  margin-top: 20px;
	}
	
	#content{
	  margin-top: 20px;
	}
	#text-b{
	  width: 800px;
	  height: 100px; 
	  background-color: #303030;
	  color: white;
	  resize: none;
	  border: none;
	  border-radius: 10px;
	  box-sizing: border-box;
	}



</style>


</html>