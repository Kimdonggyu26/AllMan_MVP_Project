<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <style>
    body{
      background-color: #131313;
      font-family: 'pretendard';
    }
    .container {
    display: flex;
    flex-direction: column; /* 세로 방향으로 정렬 */
    justify-content: center;
    align-items: center;


}
    .delete{
      background-color: #ffffff10;
      margin-top: 51px;
      width: 902px;
      height: 370px;
      border-radius: 15px;
      
    }
    #tdr{
      color: #ff5353;
      font-size: 20px;
    }
    .font{
      color: white;
      width:100px;
      font-size: 20px;
      padding-left: 30px;
      
    }
  #title{
    font-size: 60px;
  }
  #tr1{
    margin-top: 36px;
  }

  table{
    width: 902px;
  }
.checkbox{
  margin-top: 41px;
}
.ifound{
    width: 577px;
    height: 70px;
    font-size: 20px;
    border-radius: 5px;
    border: 0px;
    background-color: rgba(255, 255, 255, 0.116);
    color: white;
    padding: 0px;
    margin-bottom: 32px;
    margin-top: 119px;
    
}
#btn{
  margin-top: 119px;
  width:254px;
  height: 72px;
  border-radius: 4px;
  background-color: #ffffff10;
  color: white;
  font-size: 25px;
  border:none;
}
#agree-checkbox{
  transform: scale(2);
  border: none;
  margin-right: -5px;
}
  </style>
  
    <!-- Header, Nav start -->
    <%-- <%@ include file="/views/common/header.jsp" %> --%>
    <!-- Header, Nav end -->
  
  	<div class="container">
        <div class="delete">
          <table>
            <div id="tr1"><tr>
              <td colspan="2" class="font" id="title">탈퇴안내</td>
            </tr>
          </div>
          <div id="tr2">  
          <tr>
              <td colspan="2" class="font">회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해 주세요.</td>
            </tr>
          </div>
            <tr id="tr3" rowspan="2">
              <td colspan="2" class="font">사용하고 계신 아이디(user01)는 탈퇴할 경우 재사용 및 복구가 불가능합니다. <br>
                                          탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다. <br>
                                          탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다. </td>
               
              </tr>
              <div id="tr4" >
            <tr>
              <td class="font">탈퇴 후에는</td>
              <td id="tdr">아이디(user_no)로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.</td>
            </tr>
          </div>
          </table>
              
        </div>
        <div class="checkbox">
          <input type="checkbox" id="agree-checkbox">
          <label for="agree-checkbox" class="font">안내 사항을 모두 확인 하였으며, 이에 동의합니다.</label>
        </div>
        

        <input type="text" class="ifound" placeholder="비밀번호 확인" >

          <button id="btn">확인</button>
          
        </div>

	 <!-- Header, Nav start -->
    <%-- <%@ include file="/views/common/footer.jsp" %> --%>
    <!-- Header, Nav end -->


</body>
</html>