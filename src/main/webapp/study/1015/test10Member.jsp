<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%
	String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
%> : 헤더에 값을 넣었으니 삭제--%>
<!-- 서버에 있는 mid를 요청해서 3항 연산자로 처리 -->
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test10Member.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- 스크립트 부분은 .js파일을 만들어서 src=""로 링크걸어서 사용  -->
	<script>
		'use strict';
		
		/* 세션을 처리하지 않았을 떄 로그인하지 않은 회원의 접근을 차단 */
		<%-- 헤더와 중복된 내용 지워도 됨 
		if('<%=mid %>' ==  '') {
			alert("로그인 후 사용하세요");
			location.href = "<%=request.getContextPath() %>/study/1015/test10.jsp";
		}
		
		function logoutCheck() {
			alert("로그아웃합니다.");
			location.href = "test10.jsp";
		} --%>
	</script>
</head>
<body>
<%@include file="testHeader.jsp" %>
<p><br/></p>
<div class="container" style="height: 700px;">
<!-- css 부분은 위에 <style>로 외부 링크 걸어서 사용하면 동일한 내용 적용  -->
	<h2>이곳은 회원 전용방입니다.(<font color="red"><b><%=mid %></b></font>)</h2>
	<hr/>
	<!-- <div><img src="../../images/252.jpg" width="500px"></div> -->
	<!-- <div><img src="/javaGroup/images/252.jpg" width="500px"></div> -->
	<div><img src="<%=request.getContextPath() %>/images/252.jpg" width="500px"></div>
	<hr/>
	<div><a href="javascript:logoutCheck()" class="btn btn-success">로그아웃</a></div>
	<hr/>
</div>
<p><br/></p>
<%@include file="testFooter.jsp" %>
</body>
</html>