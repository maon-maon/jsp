<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test10Board.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@include file="testHeader.jsp" %>
<p><br/></p>
<div class="container" style="height: 700px;">
	<h2>이곳은 게시판입니다.</h2>
	<hr/>
	<div><img src="<%=request.getContextPath() %>/images/253.jpg" width="500px"></div>
	<hr/>
</div>
<p><br/></p>
<%@include file="testFooter.jsp" %>
</body>
</html>