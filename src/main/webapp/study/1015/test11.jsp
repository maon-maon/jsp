<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test11.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>서블릿에서의 호출 수행 순서 확인</h2>
	<hr/>
	<form METHOD="post" action="<%=request.getContextPath() %>/1015/Test11Ok">
		<div><button type="button" onclick="location.href='<%=request.getContextPath() %>/1015/Test11Ok'" class="btn btn-success">확인1(get)</button></div>
		<div><button type="submit" class="btn btn-success">확인2(post)</button></div>
	</form>
<p><br/></p>
</body>
</html>