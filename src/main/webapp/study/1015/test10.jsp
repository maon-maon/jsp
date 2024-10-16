<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String flag = request.getParameter("flag");
%>
<!-- 서버의 WAS가 해석하는 부분. 서버프로그램이라 항상 먼주 수행됨. 위치 상관없음 그 다음 클라이언트의 스크립트 수행 -->
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test10.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		'use strict';
		
		if('<%=flag%>' == 'no') alert("회원 정보를 확인하세요");
		/* 자바의 값을 가져오려고 표현식 사용함. flag에 담긴 값을 비교하여 if문을 처리 
			 표현식의 비교는 무조건 문자로!!*/
		function fCheck() {
			let mid = myform.mid.value;
			let pwd = myform.pwd.value;
			
			if(mid.trim() == "") {
				alert("아이디를 입력하세요");
				myform.mid.focus();
			}
			else if(pwd.trim() == "") {
				alert("비밀번호를 입력하세요");
				myform.pwd.focus();
			}
			else {
				myform.submit();
			}
		}
		
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>성명과 나이를 입력하세요</h2>
	<form name="myform" method="post" action="<%=request.getContextPath() %>/1015/Test10Ok2">
	<!-- /1015/Test09Ok2는 경로라서 무조건 적어야 함. 홈앱=컨텍스트 이름이 바뀌어도 경로는 변하지 않음  /javaGroupdms 컨텍스트명임
			 request.getContextPath() :서버에 요청함 서버에 알려둔 컨텍스트명이 있음 /javaGroup를 삭제해도 됨  -->
		<div>아이디: 
			<input type="text" id="mid" name="mid" value="hkd1234" class="form-control mb-2"  autofocus placeholder="아이디를 입력하세요" />
		</div>
		<div>비밀번호: 
			<input type="password" id="pwd" name="pwd" value="1234" class="form-control mb-2"  placeholder="비밀번호를 입력하세요"/>
		</div>
		<div>
			<input type="button" onclick="fCheck()" value="전송" class="btn btn-success form-control" />
		</div>
	</form>
</div>
<p><br/></p>
</body>
</html>
