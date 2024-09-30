<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원가입 페이지</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<style>
  /* 스타일 정의 */
  .m-4 {
    text-align: center;
    margin: auto;
    color: white;
    font-size: 40px;
  }
  .input-line, #buttons {
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
  .container {
    text-align: center;
    margin: auto;
    padding: 0;
  }
  body {
    background-color: #131313;
  }
  .font {
    color: gray;
    text-align: left;
    padding-left: 280px
  }
  .header {
    margin-top: 140px;
  }
  #margin{
   margin-top: 24px;
  }
  #margins {
    margin-top: 24px;
  }
  #marginss {
    margin-top: 15px;
  }
  #buttons {
    margin-top: 55px;
  }
  #id {
    margin-left: 126px;
  }
  #idcheck {
    background-color: white;
    border: none;
    width: 100px;
    height: 70px;
    border-radius: 5px;
    margin-left: 20px;
  }
</style>

<body>
  <section class="back">
    <div class="container">
      <div class="header">
        <h2 class="m-4">MOVIE PICK 회원가입</h2>
      </div>
      
      <form action="/mvp/insert.us" method="post" id="signup-form">
	        <input type="text" class="input-line" placeholder="아이디" name="userId" id="id" required>
	        <button id="idcheck" type="button" onclick="fnIdCheck()">중복확인</button>
      	<div>
	        <div class="font">영문 소문자 또는 영문 소문자, 숫자 조합 6~12 자리</div>
	
	        <input type="password" class="input-line" placeholder="비밀번호" id="margin" name="userPwd" required>
	        <input type="password" class="input-line" placeholder="비밀번호 확인" id="marginss" name="confirmPwd" required>
	        <input type="text" class="input-line" placeholder="이메일" id="margins" name="checkEmail">
	        <input type="text" class="input-line" placeholder="전화번호" id="marginss" name="checkPhone">
      	</div>
        
        <br>

        <div>
          <button type="submit" class="btn btn-sm" style="color: white; background-color: #ffffff29;" id="buttons" disabled>회원가입</button>
        </div>
      </form>
    </div>
  </section>

  <!-- 스크립트 시작 -->
  <script>
  $(document).ready(function() {
      let idChecked = false;
      let emailChecked = false;
      let phoneChecked = false;

      // 중복 확인 로직 (아이디)
      window.fnIdCheck = function() {
        const $idInput = $("#signup-form input[name=userId]").val();

        if (!validateId()) {
          alert("아이디는 영문 소문자 또는 숫자 조합으로 6~12자리여야 합니다.");
          return;
        }

        $.ajax({
          url: '/mvp/idcheck.us',
          data: { checkId: $idInput },
          success: function(res) {
            console.log(res);
            if (res == 'NNNNN') {
              alert('이미 존재하는 회원의 아이디입니다.');
              idChecked = false;
            } else {
              alert('사용 가능한 아이디입니다.');
              idChecked = true;
              checkAllFields();
            }
          },
          error: function(xhr, status, error) {
            alert('아이디 중복 체크에 실패했습니다.');
            console.log(error);
          }
        });
      }

      // 아이디 유효성 검사 함수
      function validateId() {
        const idInput = $("#signup-form input[name=userId]").val();
        const idRegex = /^[a-z0-9]{6,12}$/;
        return idRegex.test(idInput);
      }

      // 이메일 유효성 검사 및 중복 확인 함수
      function validateEmail() {
        const email = $("#signup-form input[name=checkEmail]").val();
        if (email) {
          $.ajax({
            url: '/mvp/emailcheck.us',
            data: { checkEmail: email },
            success: function(res) {
              if (res === 'NNNNN') {
                alert('이미 사용 중인 이메일입니다.');
                emailChecked = false;
              } else {
                emailChecked = true;
              }
              checkAllFields();
            },
            error: function(xhr, status, error) {
              alert('이메일 중복 체크에 실패했습니다.');
              console.log(error);
              emailChecked = false;
            }
          });
        }
      }

      // 전화번호 유효성 검사 및 중복 확인 함수
      function validatePhone() {
        const phone = $("#signup-form input[name=checkPhone]").val();
        if (phone) {
          $.ajax({
            url: '/mvp/phonecheck.us',
            data: { checkPhone: phone },
            success: function(res) {
              if (res === 'NNNNN') {
                alert('이미 사용 중인 전화번호입니다.');
                phoneChecked = false;
              } else {
                phoneChecked = true;
              }
              checkAllFields();
            },
            error: function(xhr, status, error) {
              alert('전화번호 중복 체크에 실패했습니다.');
              console.log(error);
              phoneChecked = false;
            }
          });
        }
      }

      // 모든 필드 확인 함수
      function checkAllFields() {
        const userId = $("#signup-form input[name=userId]").val();
        const userPwd = $("#signup-form input[name=userPwd]").val();
        const confirmPwd = $("#signup-form input[name=confirmPwd]").val();
        const email = $("#signup-form input[name=checkEmail]").val();
        const phone = $("#signup-form input[name=checkPhone]").val();

        if (userId && userPwd && confirmPwd && email && phone && idChecked) {
          if (userPwd === confirmPwd && emailChecked && phoneChecked) {
            $("#signup-form :submit").removeAttr("disabled").css("background-color", "#f33f3F");
          } else {
            $("#signup-form :submit").attr("disabled", "disabled").css("background-color", "#ffffff29");
          }
        }
      }

      // 폼 제출 시 비밀번호와 비밀번호 확인 값 확인
      $("#signup-form").on("submit", function(e) {
        const userPwd = $("#signup-form input[name=userPwd]").val();
        const confirmPwd = $("#signup-form input[name=confirmPwd]").val();

        if (userPwd !== confirmPwd) {
          alert("비밀번호가 일치하지 않습니다.");
          e.preventDefault(); // 폼 제출을 막음
        }
      });

      // 각 입력 필드에 이벤트 리스너 추가
      $("#signup-form input[name=checkEmail]").on("input", validateEmail);
      $("#signup-form input[name=checkPhone]").on("input", validatePhone);
      $("#signup-form input[name=userPwd], #signup-form input[name=confirmPwd]").on("input", checkAllFields);
    });
  </script>

</body>
</html>
