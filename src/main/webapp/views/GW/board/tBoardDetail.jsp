<%@ page import="com.mvp.semi.board.model.vo.Board"%>
<%@ page import="com.mvp.semi.common.model.vo.PageInfo" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	Board b = (Board)request.getAttribute("b");
%>
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

 			<div class="btn-taste">
        <div class="row justify-content-center mt-5 mb-3">
          <a href="<%= contextPath %>/list.NDHE" class="mx-2 btn btn-sm" id="taste">NDHE 게시판</a>
          <a href="<%= contextPath %>/list.VDSE" class="mx-2 btn btn-sm" id="taste">VDSE 게시판</a>
          <a href="<%= contextPath %>/list.SPTF" class="mx-2 btn btn-sm" id="taste">SPTF 게시판</a>
          <a href="<%= contextPath %>/list.BOFA" class="mx-2 btn btn-sm" id="taste">BOFA 게시판</a>
        </div>
        <div class="row justify-content-center mb-3">
          <a href="<%= contextPath %>/list.ETRF" class="mx-2 btn btn-sm" id="taste">ETRF 게시판</a>
          <a href="<%= contextPath %>/list.CCFE" class="mx-2 btn btn-sm" id="taste">CCFE 게시판</a>
          <a href="<%= contextPath %>/list.CASE" class="mx-2 btn btn-sm" id="taste">CASE 게시판</a>
          <a href="<%= contextPath %>/list.HHAL" class="mx-2 btn btn-sm" id="taste">HHAL 게시판</a>
        </div>
      </div>

      <div id="title">

        
        <div id="m-title"><%=b.getBoardTitle() %></div>

				<span id="m-dg"><%=b.getRegistDate() %></span><span id="m-dg">&nbsp;&nbsp;/&nbsp;&nbsp;</span><span id="m-dg"><%=b.getGenre() %></span>


        <div >
          <img src="<%=contextPath + b.getTitlePath() %>" alt="영화 이미지" id="detail-img">
        </div>
  
        <div id="content">
          <p style="max-height:200px; color: white;"><%=b.getBoardContent() %></p>
        </div>

      </div>

      <div id="reply">
          <table>
            <tr>
              <td style="color: white; text-align: left;">댓글작성</td>
            </tr>
            <% if(loginUser == null || loginUser.getTasteNo() != b.getTasteNo()) { %>   
             <tr>
              <td><textarea id="reply-content" readonly placeholder="로그인이 안되어있거나 본인취향 게시판이 아닙니다."></textarea></td>
            </tr>
        			<tr>
              	<td style="text-align: right;"><button class="btn" style="background-color: #F33F3F; color: white;" type="button" disabled>등록</button></td>
            	</tr>
        		<% }else {  %>
            <tr>
              <td><textarea maxlength="100" id="reply-content" placeholder="비속어 등의 댓글은 금지사항이며, 제제 사유입니다 "></textarea></td>
            </tr>
            <tr>
              <td style="text-align: right;"><button class="btn" style="background-color: #F33F3F; color: white;" onclick="fnReplyInsert();">등록</button></td>
            </tr>
            <% } %>
        </table>
      </div>
      

      <div style=" text-align: left; color: white; ">
        <table id="reply-area">
        </table>  
      </div>
      
      <hr style="backgroundcolor= white;">
      
      <ul class="pagination d-flex justify-content-center text-dark" id="page-area">   
        
      </ul>
      
       
      
			<script>
			var contextPath = '<%= contextPath %>';
			  $(function() {
			    fnReplyList(); // 페이지 로드시 초기 댓글 목록 조회를 위해서
			     //setInterval(fnReplyList, 3000); // 2초간격마다 매번 조회 요청 (실시간으로 보여지게 처리 가능)
			
			    // 삭제버튼 클릭시 댓글 삭제요청용 ajax 호출
			    $('#reply-area').on('click', 'span', function() {
			      $.ajax({
			        url: '<%=contextPath%>/delete.re',
			        data: { no: $(this).data('no') },
			        success: function(res) {
			          if (res > 0) {
			            fnReplyList();
			          }
			        },
			        error: function() {
			          console.log('댓글 삭제용 ajax 통신 실패');
			        }
			      });
			    });
			  });
			
			  // 댓글 작성용 함수 (ajax 요청)
			  function fnReplyInsert() {
			    $.ajax({
			      url: '<%= contextPath %>/insert.re',
			      data: {
			        no: <%= b.getBoardNo() %>,
			        content: $("#reply-content").val()
			      },
			      type: "post",
			      success: function(res) {
			        if (res > 0) { // 댓글작성성공
			          $("#reply-content").val(""); // 텍스트상자 초기화
			          fnReplyList(); // 갱신된 댓글목록 조회해서 다시 화면에 뿌리기
			        }
			      },
			      error: function() {
			        console.log('댓글 작성용 ajax 통신 실패');
			      }
			    });
			  }
			
			  // 현재 게시글의 댓글 목록 조회용 함수 (ajax 요청)
			  function fnReplyList(page) {
				  $.ajax({
				    url: '<%= contextPath %>/list.re',
				    data: {
				      no: <%= b.getBoardNo() %>, 
				      page: page
				    },
				    success: function(res) {
				      console.log(res);
				      
				      var r = res.list;  // 댓글 목록
				      var p = res.pi;    // 페이지 정보
				      
				      let trEl = "";
				      if (r.length === 0) { // 댓글이 없을 경우
				        trEl += '<tr><td colspan="3">존재하는 댓글이 없습니다.</td></tr>';
				      } else { // 댓글이 있을 경우
				        for (let i = 0; i < r.length; i++) {
				          trEl += '<tr style="border">' +
				                  '<td style="width: 40px;"><img src="' + contextPath + r[i].writerProfile + '" style="height: 30px; width: 30px;"></td>' +
				                  '<td style="width: 750px;">' + r[i].replyWriter + '</td>' +
				                  '</tr>' +
				                  '<tr>' +
				                  '<td colspan="2" style="font-size: 15px;">' + r[i].replyContent + '</td>' +
				                  '<td>' + r[i].registDt + '</td>';  // 날짜 정보 추가
				
				          // 로그인한 사용자와 댓글 작성자가 동일할 경우 수정/삭제 버튼 추가
				          if (r[i].replyWriter == '<%= loginUser == null ? "" : loginUser.getUserId() %>') {
				            trEl += '<td><span style="font-size: 15px;" data-no="' + r[i].replyNo + '">x</span></td>';
				          }
				
				          trEl += '</tr>'; 
				          trEl += '<tr><td colspan="3" style="border-top: 1px solid #ccc; height: 10px;"></td></tr>'; // 구분선
				        }
				      }        
				      $('#reply-area').html(trEl);
				
				      // 페이지네이션 생성
				      let liEl = "";  
				
				      // 이전 페이지 버튼
				      liEl += "<li class='page-item " + (p.currentPage === 1 ? "disabled" : "") + "'>" +
				              '<a class="page-link" onclick="fnReplyList(' + (p.currentPage - 1) + ')">&lt;</a>' +
				              "</li>";
				
				      // 페이지 번호 버튼
				      for (let i = p.startPage; i <= p.endPage; i++) {
				        liEl += "<li class='page-item " + (i === p.currentPage ? "active" : "") + "'>" +
				                '<a class="page-link" onclick="fnReplyList(' + i + ')">' + i + '</a>' +
				                "</li>";
				      }
				
				      // 다음 페이지 버튼
				      liEl += "<li class='page-item " + (p.currentPage === p.maxPage ? "disabled" : "") + "'>" +
				              '<a class="page-link" onclick="fnReplyList(' + (p.currentPage < p.maxPage ? (p.currentPage + 1) : p.maxPage) + ')">&gt;</a>' +
				              "</li>";
				
				      $('#page-area').html(liEl);
				
				    },
				    error: function() {
				      console.log('댓글 목록 조회용 ajax 통신 실패');
				    }
				  });
				}
			</script>
			
                  

    </section>



  <!-- Section end -->

  <!-- Footer start -->
  <%@ include file="/views/common/footer.jsp" %>
  <!-- Footer end -->
  
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
	#title div{
	  color: white;
	}
	#m-dg{
	  color: white;
	}
	#m-title{
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
	
	#reply-content{
	  width: 800px;
	  height: 100px; 
	  background-color: #303030;
	  color: white;
	  resize: none;
	  border: none;
	  border-radius: 10px;
	  box-sizing: border-box;
	}
	
		#taste{
	  width: 150px;
	  height: 30px;
	  border-radius: 20px;
	  border: none;
	  color: white;
	  background-color: #3C3C3C;
	}
	
	#reply-area span{
	
	cursor: pointer;
	}

</style>


</html>