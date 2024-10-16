<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
%>
<!-- 서버에 있는 mid를 요청해서 3항 연산자로 처리 -->
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test09Admin.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		'use strict';
		
		/* 세션을 처리하지 않았을 떄 로그인하지 않은 회원의 접근을 차단 */
		if('<%=mid %>' ==  '') {
			alert("로그인 후 사용하세요");
			location.href = "<%=request.getContextPath() %>/study/1015/test09.jsp";
		}
		//값전달은 get방식을 많이 씀. 경로는 절대경로를 많이 씀(컨텍스트명을 서버에서 불러오는걸로)
		
		function logoutCheck() {
			alert("로그아웃합니다.");
			location.href = "test09.jsp";
		}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>이곳은 관리자 화면입니다.(<font color="red"><b><%=mid %></b></font>)</h2>
	<hr/>
	<!-- <div><img src="../../images/72.jpg" width="500px"></div> -->
	<!-- 상대경로를 절대경로로 변경. 웹에서 절대경로는 위험함 쓰면 안됨=유저의 pc에는 동일한 경로의 폴더가 없음 -->
	<!-- <div><img src="/javaGroup/images/72.jpg" width="500px"></div> -->
	<div><img src="<%=request.getContextPath() %>/images/72.jpg" width="500px"></div>
	<!-- 절대경로를 많이 사용함. 컨텍스트명을 이름으로 쓰지 말고 서버에서 가져와야함!! -->
	<hr/>
	<div><a href="javascript:logoutCheck()" class="btn btn-success">로그아웃</a></div>
	<hr/>
</div>
<p><br/></p>
</body>
</html>