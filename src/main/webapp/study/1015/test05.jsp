<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test05.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		'use strict';
		
		function fCheck() {
			let name = myform.name.value;
			let age = myform.age.value;
			
			if(name.trim() == "") {
				alert("이름을 입력하세요");
				myform.name.focus();
			}
			else if(age.trim() == "") {
				alert("나이를 입력하세요");
				myform.age.focus();
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
	<form name="myform" method="get" action="test05Ok.jsp">
	<!-- <form name="myform" method="post" action="test05Ok.jsp"> -->
	<!-- 전송시 : test05Ok.jsp로 보낼 때 서버에 보내짐  -->
		<div>이름: 
			<input type="text" id="name" name="name" value="홍길동" class="form-control mb-2" required autofocus placeholder="이름을 입력하세요" />
		</div>
		<div>나이: 
			<input type="number" id="age" name="age" value="25" class="form-control mb-2" required placeholder="나이를 입력하세요"/>
		</div>
		<div>
			<!-- <input type="submit" value="전송" class="btn btn-success"> -->
			<input type="button" value="전송" onclick="fCheck()" class="btn btn-success form-control" />
		</div>
	</form>
</div>
<p><br/></p>
</body>
</html>