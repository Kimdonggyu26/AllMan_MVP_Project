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

<!--폰트-->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />


</head>
<style>
.m-4{
  text-align: center;
  margin: auto;
  color: white;
  font-size: 40px;
}
.input-line,#buttons{
  margin: auto;
  width: 577px;
    height: 70px;
    font-size: 20px;
    border-radius: 5px;
    border: 0px;
    background-color: rgba(252, 252, 252, 0.116);
    color: white;
}
input:focus {outline: none;}
.container{
  text-align: center;
  margin: auto;
  padding: 0;
}
body{
  background-color: #131313;
}
.font{
  font-size: 12px;
  color: gray;
  text-align: left;
  margin-left: 270px;
}
.back{
  margin: auto;

}
body{
  font-family: 'pretendard';
}
.header{
  margin-top: 140px;
}
#margins{
  margin-top: 24px;
}

#marginss{
  margin-top: 15px;
}
#buttons{
  margin-top: 55px;
}
#id{
    margin-left: 126px;
}
#idcheck{
  background-color: white;
  border: none;
  width: 100px;
  height: 70px;
  border-radius: 5px;
  margin-left: 20px;
}
</style>
<body>
 <%
	String contextPath = request.getContextPath();
%> 


   <!-- Section start -->

   <section class="back" >
     <div class="container">
        <div class="header">
    <h2 class="m-4">MOVIE PICK 회원가입</h2>
      </div>
       	<form action="<%= contextPath %>/insert.us" method="post" id="signup-form">
         
			        <input type="text" class="input-line" placeholder="아이디" name="userId" id="id" required >
			        <button id="idcheck" type="button" onclick="fnIdCheck();" > 중복확인 </button>
			        <div class="font">영문 소문자 또는 영문 소문자, 숫자 조합 6~12 자리</div>
							           
							<input type="password" class="input-line" placeholder="비밀번호" id="margin" name="userPwd" required>
							
							<input type="password" class="input-line" placeholder="비밀번호 확인" id="marginss" name="confirmPwd" required>
							
							<input type="text" class="input-line" placeholder="이메일" id="margins" name="email">
							
							
							<input type="text" class="input-line" placeholder="전화번호" id="marginss" name="phone" >



         <br>

       			 <div>
           <button type="submit" class="btn  btn-sm " style=" color: white; background-color: #ffffff29 ;" id="buttons"  disabled>회원가입</button>
       		 </div>

     </form>
     </div>

   </section>
   

   <!-- Section end -->



		  <script>
		  
		  <%-- let idChecked = false; // 중복 확인 여부 저장
		  
		  function fnIdCheck() {
			  function validateId() {
				    const idInput = $("#signup-form input[name=userId]").val();
				    const idRegex = /^[a-z0-9]{6,12}$/; // 영문 소문자 또는 숫자, 6~12자리

				    if (!idRegex.test(idInput)) {
				        alert('아이디는 영문 소문자 또는 숫자 조합으로 6~12자리여야 합니다.');
				        return false; // 유효하지 않은 경우
				    }

				    return true; // 유효한 경우
				}
		        // 사용자가 입력한 아이디값 전달하면서 ajax요청
		        // NNNNN(사용불가) | NNNNY(사용가능) 응답데이터 돌려받기
		        
		        const $idInput = $("#signup-form input[name=userId]");
		        if (!validateId()) {
		            $idInput.select(); // 유효하지 않으면 입력을 다시 유도
		            return;
		        }


		        $.ajax({
		          url: '<%= contextPath %>/idcheck.us',
		          data: {checkId: $idInput.val()},
		          success: function(res){
		            console.log(res);
		            if(res == 'NNNNN'){ // 사용불가능
		              alert('이미 존재하는 회원의 아이디입니다.');
		              $idInput.select(); // 다시 입력 유도
		            }else{ // 사용가능
		              if(confirm('사용가능한 아이디입니다. 사용하시겠습니까?')){
		                $('#signup-form :submit').removeAttr('disabled'); // 회원가입 버튼 활성화
		              
		                $idInput.prop('readonly', true); // 더이상 아이디 수정 불가하도록
		                checkAllFields(); // 중복 확인 후 모든 필드 체크
		              }else{
		                $idInput.select(); // 다시 입력 유도
		              }
		            }
		          }, 
		          error: function() {
		            console.log('아이디 중복체크용 ajax 통신 실패');
		          }
		        })
		        
		      }
		  function checkBeforeSubmit() {
			    if (!idChecked) {
			        alert('아이디 중복 확인을 완료해야 합니다.');
			        return false; // 중복 확인이 완료되지 않으면 폼 제출을 막음
			    }
			    return true; // 중복 확인이 완료된 경우 폼 제출 허용
			}
		  function checkAllFields() {
			    // 모든 입력 필드가 채워져 있는지 확인
		 const userId = $("#signup-form input[name=userId]").val();
    const userPwd = $("#signup-form input[name=userPwd]").val();
    const confirmPwd = $("#signup-form input[name=confirmPwd]").val();
    const email = $("#signup-form input[name=email]").val();
    const phone = $("#signup-form input[name=phone]").val();

			    // 모든 필드가 입력되었고, 중복확인이 완료되었을 경우
			    if (userId && password && confirmPassword && email && phone && idChecked) {
		/* 	        // 회원가입 버튼 활성화 및 배경색 변경
			        $("#signup-button").removeAttr("disabled").css("background-color", "red");
			    } else {
			        // 모든 필드가 입력되지 않았거나 중복확인이 완료되지 않은 경우, 비활성화 유지
			        $("#signup-button").attr("disabled", "disabled") */
			        if (userPwd === confirmPwd) {
			            $("#signup-form :submit").css("background-color", "red"); // 배경색을 빨간색으로 변경
			        } else {
			            alert('비밀번호가 일치하지 않습니다.');
			    }
			}
		  $("#signup-form input").on("input", function() {
			    checkAllFields(); // 입력 값이 바뀔 때마다 필드 확인
			}); --%>
/* 			let idChecked = false; // 중복 확인 여부 저장 */
<%-- 
			// 중복 확인 로직
			function fnIdCheck() {
			    const $idInput = $("#signup-form input[name=userId]");
			    
			    // 아이디 유효성 검사
			    if (!validateId()) {
			        $idInput.select(); // 유효하지 않으면 입력 다시 유도
			        return;
			    }

			    // 중복 확인 요청
			    $.ajax({
			        url: '<%= contextPath %>/idcheck.us',
			        data: {checkId: $idInput.val()},
			        success: function(res) {
			            console.log(res);
			            if (res == 'NNNNN') { // 사용불가능
			                alert('이미 존재하는 회원의 아이디입니다.');
			                $idInput.select(); // 다시 입력 유도
			                idChecked = false;
			            } else { // 사용가능
			                if (confirm('사용가능한 아이디입니다. 사용하시겠습니까?')) {
			                    $('#signup-form :submit').removeAttr('disabled'); // 회원가입 버튼 활성화
			                    $idInput.prop('readonly', true); // 더이상 아이디 수정 불가
			                    idChecked = true; // 중복 확인 성공
			                    checkAllFields(); // 모든 필드 확인 함수 호출
			                } else {
			                    $idInput.select(); // 다시 입력 유도
			                    idChecked = false;
			                }
			            }
			        },
			        error: function() {
			            console.log('아이디 중복체크용 ajax 통신 실패');
			        }
			    });
			}

			// 아이디 유효성 검사
			function validateId() {
			    const idInput = $("#signup-form input[name=userId]").val();
			    const idRegex = /^[a-z0-9]{6,12}$/; // 영문 소문자 또는 숫자 6~12자리
			    if (!idRegex.test(idInput)) {
			        alert('아이디는 영문 소문자 또는 숫자 조합으로 6~12자리여야 합니다.');
			        return false;
			    }
			    return true;
			}

			// 모든 필드 확인 함수
			function checkAllFields() {
			    const userId = $("#signup-form input[name=userId]").val();
			    const userPwd = $("#signup-form input[name=userPwd]").val();
			    const confirmPwd = $("#signup-form input[name=confirmPwd]").val();
			    const email = $("#signup-form input[name=email]").val();
			    const phone = $("#signup-form input[name=phone]").val();

			    // 모든 필드가 입력되었는지 확인
			    if (userId && userPwd && confirmPwd && email && phone && idChecked) {
			        // 비밀번호 일치 여부 확인
			        if (userPwd === confirmPwd) {
			            $("#signup-form :submit").css("background-color", "red"); // 배경색을 빨간색으로 변경
			        } else {
			            alert('비밀번호가 일치하지 않습니다.');
			        }
			    } let idChecked = false; // 중복 확인 여부 저장

			 // 중복 확인 로직
			 function fnIdCheck() {
			     const $idInput = $("#signup-form input[name=userId]");
			     
			     // 아이디 유효성 검사
			     if (!validateId()) {
			         $idInput.select(); // 유효하지 않으면 입력 다시 유도
			         return;
			     }

			     // 중복 확인 요청
			     $.ajax({
			         url: '<%= contextPath %>/idcheck.us',
			         data: {checkId: $idInput.val()},
			         success: function(res) {
			             console.log(res);
			             if (res == 'NNNNN') { // 사용불가능
			                 alert('이미 존재하는 회원의 아이디입니다.');
			                 $idInput.select(); // 다시 입력 유도
			                 idChecked = false;
			             } else { // 사용가능
			                 if (confirm('사용가능한 아이디입니다. 사용하시겠습니까?')) {
			                     $('#signup-form :submit').removeAttr('disabled'); // 회원가입 버튼 활성화
			                     $idInput.prop('readonly', true); // 더이상 아이디 수정 불가
			                     idChecked = true; // 중복 확인 성공
			                     checkAllFields(); // 모든 필드 확인 함수 호출
			                 } else {
			                     $idInput.select(); // 다시 입력 유도
			                     idChecked = false;
			                 }
			             }
			         },
			         error: function() {
			             console.log('아이디 중복체크용 ajax 통신 실패');
			         }
			     });
			 }

			 // 아이디 유효성 검사
			 function validateId() {
			     const idInput = $("#signup-form input[name=userId]").val();
			     const idRegex = /^[a-z0-9]{6,12}$/; // 영문 소문자 또는 숫자 6~12자리
			     if (!idRegex.test(idInput)) {
			         alert('아이디는 영문 소문자 또는 숫자 조합으로 6~12자리여야 합니다.');
			         return false;
			     }
			     return true;
			 }

			 // 모든 필드 확인 함수
			 function checkAllFields() {
			     const userId = $("#signup-form input[name=userId]").val();
			     const userPwd = $("#signup-form input[name=userPwd]").val();
			     const confirmPwd = $("#signup-form input[name=confirmPwd]").val();
			     const email = $("#signup-form input[name=email]").val();
			     const phone = $("#signup-form input[name=phone]").val();

			     // 모든 필드가 입력되었는지 확인
			     if (userId && userPwd && confirmPwd && email && phone && idChecked) {
			         // 비밀번호 일치 여부 확인
			         if (userPwd === confirmPwd) {
			             $("#signup-form :submit").css("background-color", "red"); // 배경색을 빨간색으로 변경
			         } else {
			             alert('비밀번호가 일치하지 않습니다.');
			         }
			     }
			 }

			 // 각 입력 필드에 입력 이벤트 추가
			 $("#signup-form input").on("input", function() {
			     checkAllFields(); // 각 필드가 입력될 때마다 필드 확인 함수 호출
			 });
			}

			// 각 입력 필드에 입력 이벤트 추가
			$("#signup-form input").on("input", function() {
			    checkAllFields(); // 각 필드가 입력될 때마다 필드 확인 함수 호출
			});
		   --%>
		   let idChecked = false; // 중복 확인 여부 저장

		// 중복 확인 로직
		function fnIdCheck() {
		    const $idInput = $("#signup-form input[name=userId]");
		    
		    // 아이디 유효성 검사
		    if (!validateId()) {
		        $idInput.select(); // 유효하지 않으면 입력 다시 유도
		        return;
		    }

		    // 중복 확인 요청
		    $.ajax({
		        url: '<%= contextPath %>/idcheck.us',
		        data: {checkId: $idInput.val()},
		        success: function(res) {
		            console.log(res);
		            if (res == 'NNNNN') { // 사용불가능
		                alert('이미 존재하는 회원의 아이디입니다.');
		                $idInput.select(); // 다시 입력 유도
		                idChecked = false;
		            } else { // 사용가능
		                if (confirm('사용가능한 아이디입니다. 사용하시겠습니까?')) {
		                    $('#signup-form :submit').removeAttr('disabled'); // 회원가입 버튼 활성화
		                    $idInput.prop('readonly', true); // 더이상 아이디 수정 불가
		                    idChecked = true; // 중복 확인 성공
		                    checkAllFields(); // 모든 필드 확인 함수 호출
		                } else {
		                    $idInput.select(); // 다시 입력 유도
		                    idChecked = false;
		                }
		            }
		        },
		        error: function() {
		            console.log('아이디 중복체크용 ajax 통신 실패');
		        }
		    });
		}

		// 아이디 유효성 검사
		function validateId() {
		    const idInput = $("#signup-form input[name=userId]").val();
		    const idRegex = /^[a-z0-9]{6,12}$/; // 영문 소문자 또는 숫자 6~12자리
		    if (!idRegex.test(idInput)) {
		        alert('아이디는 영문 소문자 또는 숫자 조합으로 6~12자리여야 합니다.');
		        return false;
		    }
		    return true;
		}

		// 모든 필드 확인 함수
		function checkAllFields() {
		    const userId = $("#signup-form input[name=userId]").val();
		    const userPwd = $("#signup-form input[name=userPwd]").val();
		    const confirmPwd = $("#signup-form input[name=confirmPwd]").val();
		    const email = $("#signup-form input[name=email]").val();
		    const phone = $("#signup-form input[name=phone]").val();

		    // 모든 필드가 입력되었는지 확인
		    if (userId && userPwd && confirmPwd && email && phone && idChecked) {
		        // 비밀번호 일치 여부 확인
		        if (userPwd === confirmPwd) {
		            $("#signup-form :submit").css("background-color", "#f33f3F"); // 배경색을 빨간색으로 변경
		        } else {
		            alert('비밀번호가 일치하지 않습니다.');
		        }
		    }
		}

		// 각 입력 필드에 입력 이벤트 추가
		$("#signup-form input").on("input", function() {
		    checkAllFields(); // 각 필드가 입력될 때마다 필드 확인 함수 호출
		});
        </script>
        

</body>
</html>