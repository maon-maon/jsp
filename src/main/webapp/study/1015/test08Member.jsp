<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test08Member.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		'use strict';
		
		function logoutCheck() {
			alert("로그아웃합니다.");
			location.href = "test08.jsp";
		}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>이곳은 회원 전용방입니다.</h2>
	<hr/>
	<div><img src="../../images/252.jpg" width="500px"></div>
	<hr/>
	<div><a href="javascript:logoutCheck()" class="btn btn-success">로그아웃</a></div>
	<hr/>
</div>
<p><br/></p>
</body>
</html>