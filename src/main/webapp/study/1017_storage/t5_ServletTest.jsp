<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t5_ServletTest.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>서블릿에서 '세션/어플리케이션' 처리하기</h2>
	<p>
		<a href="<%=request.getContextPath() %>/1017/T5_ServletTestOk?mid=admin" class="btn btn-success mr-3">서버에서 처리</a>
		<a href="<%=request.getContextPath() %>/1017/T5_ServletTestClear" class="btn btn-danger mr-3">서버스토리지 삭제</a>
	</p>
	<hr/>
	<p>세션 아이디 : ${sMid}</p>
	<p>어플리케이션 아이디 : ${aMid}</p>
</div>
<p><br/></p>
</body>
</html>