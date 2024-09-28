<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 테스트용 -->

	<div class="container p-3">

		<!-- Header, Nav start -->
		<%@ include file="/views/common/header.jsp"%>
		<!-- Header, Nav end -->

		<!-- Section start -->
		<section class="row m-3" style="min-height: 500px">
			<div class="container border p-5 m-4 rounded" style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
				<h2 class="m-4" style="color: #ffffff; ">500에러 불편을 드려 죄송합니다. 발표할 때 이거 뜨면 개망입니다 ㅋㅋ</h2>
				<a type="button" class="btn btn-success" href="<%= contextPath%>/views/movieMain/mainPage.jsp">돌아기기</a>
			</div>
		</section>
		<!-- Section end -->

		<!-- Footer start -->
		<%@ include file="/views/common/footer.jsp"%>
		<!-- Footer end -->

	</div>

</body>
</html>