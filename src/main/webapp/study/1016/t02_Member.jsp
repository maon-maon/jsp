<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t02_Member.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/member.js"></script>
	<!-- 외부에 js파일을 만들어서 선언된 logoutCheck()함수 불러옴. ()의 값이 member.js에 변수url에 담김 -->
</head>
<body>
<%-- <%@include file="../../include/testHeader.jsp" %> --%>
<%-- <jsp:include page="/<%=request.getContextPath() %>/include/testHeader.jsp" /> --%>
<jsp:include page="/include/testHeader.jsp" />
<!-- jsp액션태그는 컨텍스트 안 적음. 중복되면 오류남 -->
<p><br/></p>
<div class="container">
	<h2>이곳은 회원 전용방입니다.</h2>
	<hr/>
	<div><img src="<%=request.getContextPath() %>/images/252.jpg" width="500px"></div>
	<hr/>
	<div><a href="javascript:logoutCheck('<%=request.getContextPath()%>/study/1016/t02_Dispatcher.jsp')" class="btn btn-success">로그아웃</a></div>
	<hr/>
</div>
<p><br/></p>
<jsp:include page="/include/testFooter.jsp" />
</body>
</html>