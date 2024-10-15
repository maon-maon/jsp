<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test06.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		'use strict';
		
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
	<h2>아이디와 비밀번호를 입력하세요</h2>
	<form name="myform" method="post" action="test06Ok.jsp">
	<!-- 전송시 : test06Ok.jsp로 보낼 때 서버에 보내짐  -->
		<div>아이디: 
			<input type="text" id="mid" name="mid" value="hkd1234" class="form-control mb-2" required autofocus placeholder="아이디를 입력하세요" />
		</div>
		<div>비밀번호: 
			<input type="password" id="pwd" name="pwd" value="1234" class="form-control mb-2" required placeholder="비밀번호를 입력하세요"/>
		</div>
		<div>
			<input type="button" value="전송" onclick="fCheck()" class="btn btn-success form-control" />
		</div>
	</form>
</div>
<p><br/></p>
</body>
</html>