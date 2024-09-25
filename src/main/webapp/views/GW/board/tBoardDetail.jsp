<%@ page import="com.mvp.semi.board.model.vo.Board"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
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
            <% if(loginUser == null) { %>
             <tr>
              <td><textarea id="reply-content" readonly placeholder="로그인 후 이용가능한 서비스입니다. "></textarea></td>
            </tr>
        			<tr>
              	<td style="text-align: right;"><button class="btn" style="background-color: #F33F3F; color: white;" type="button" disabled>등록</button></td>
            	</tr>
        		<% }else {  %>
            <tr>
              <td><textarea id="reply-content" placeholder="비속어 등의 댓글은 금지사항이며, 제제 사유입니다 "></textarea></td>
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
      
      
      <script>
        $(function(){
        	fnReplyList();	// 페이지 로드시 초기 댓글 목록 조회를 위해서
        	//setInterval(fnReplyList, 2000);	// 2초간격마다 매번 조회 요청 (실시간으로 보여지게 처리 가능)
        	
        	// 삭제버튼 클릭시 댓글 삭제요청용 ajax 호출
        	// $('#reply-area span').on('click', function(){})	// 이벤트 제대로 안걸림
        	$('#reply-area').on('click', 'span', function(){
        		$.ajax({
        			url: '<%=contextPath%>/delete.re',
        			data: {no: $(this).data('no') },
        			success: function(res){
        				if(res > 0){
        					fnReplyList();
        				}
        			},
        			error: function() {
        				console.log('댓글삭제용 ajax 통신 실패');
        			}
        		})
        	})
        })
        
        // 댓글 작성용 함수 (ajax요청)
        function fnReplyInsert() {
        	$.ajax({
        		url: '<%= contextPath %>/insert.re',
        		data: {
        			no: <%= b.getBoardNo() %>,
        			content: $("#reply-content").val()
        		},
        		type: "post",
        		success: function(res){
        			if(res > 0){ // 댓글작성성공
        				$("#reply-content").val(""); // 텍스트상자 초기화
        				fnReplyList();	// 갱신된 댓글목록 조회해서 다시 화면에 뿌리기
        			}
        		},
        		error: function(){
        			console.log('댓글 작성용 ajax 통신 실패')
        		}
        	})
        }
        
        
 


        
        	// 현재 게시글의 댓글 목록 조회용 함수 (ajax요청)
        	function fnReplyList() {
        		
        		$.ajax({
        			url: '<%= contextPath %>/list.re',
        			data: {no: <%= b.getBoardNo() %>},
        			success: function(res){
        				console.log(res);
        				
        				let trEl = "";
        				if(res.length ==0) {	// 댓글이 없을 경우
        	        trEl +=	'<tr><td colspan="3">존재하는 댓글이 없습니다. </td></tr>';	
        				}else{	// 댓글이 있을 경우
        					
        					for(let i=0; i<res.length; i++){
        						
        						/*
        	        <tr>
					          <td style="width: 40px; "><img src="../assets/image/Ellipse 512.png" style="height: 30px; width: 30px;"></td>
					          <td style="width: 750px;">user01</td>
						      </tr>
						      <tr>
						        <td colspan="2" style="font-size: 15px;">댓글 달기 멋있는데요? 재밌는데요? ㅏㅎ하ㅏ핳</td>
						      </tr>
						      <tr>
					          <td style="font-size: 10px;">수정</td>
					          <td style="font-size: 10px;">삭제</td>
					        </tr>
        						*/
        						trEl += '<tr>'
        									+ 	'<td style="width: 40px; "><img src="' + res[i].writerProfile 	+ '</td>'
        									+ 	'<td style="width: 750px;">' + res[i].replyWriter + '</td>'	
        									+ '</tr>'
        									+ '<tr>'
        									+ 	'<td colspan="2" style="font-size: 15px;">'+ res[i].replyContent + '</td>'
        									+ '</tr>'
        						 if(res[i].replyWriter == '<%= loginUser == null ? "" : loginUser.getUserId() %>'){
        							 trEl += '<tr data-no="'	+ res[i].replyNo +	'">'
        							 			 + 		'<td style="font-size: 10px;">' + 수정 + '</td>'
        								     +   	'<td style="font-size: 10px;">' + 삭제 + '</td>'
        									   +  '</tr>'	
        						 }
        						
        					}
        					
        				}
        				
        				$('#reply-area').html(trEl);
        			},
        			error: function(){
        				console.log('댓글 목록 조회용 ajax 통신 실패');
        			}
        		})
        		
        	}
        </script>
      
      
      
      
      
      
      <hr color="white"> 
      </div>

        <!--  ul class="pagination d-flex justify-content-center text-dark" id="page">
          <li class="page-item disabled"><a class="page-link" href="">&lt;</a></li>
          <li class="page-item active"><a class="page-link" href="">1</a></li>
          <li class="page-item"><a class="page-link" href="">2</a></li>
          <li class="page-item"><a class="page-link" href="">3</a></li>
          <li class="page-item"><a class="page-link" href="">4</a></li>
          <li class="page-item"><a class="page-link" href="">5</a></li>
          <li class="page-item"><a class="page-link" href="">&gt;</a></li>
        </ul-->

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

</style>


</html>