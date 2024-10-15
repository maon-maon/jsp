<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test04.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>JSP 파일 호출하기</h2>
	<form method="post" action="test04Ok.jsp">
		<input type="submit" value="전송" class="btn btn-success" />
	</form>
</div>
<p><br/></p>
</body>
</html>
<%-- jsp에선 서블릿에서 처럼 객체(request,response)로 선언하지 않아도 내장객체로 바로 사용할 수 있음
			out.println에서 out을 변수로 response.getWrite를 객체 생성하지 않고 써도 사용가능한 이유.  --%>