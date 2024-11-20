<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>errorMenu.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>Error 페이지 연습</h2>
	<hr/>
	<div><a href="ErrorJSP.st" class="btn btn-success mb-1">JSP에러 발생(View)</a></div>
	<div><a href="Error400.st?vo=${vo}" class="btn btn-success mb-1">400에러 발생(타입에러)</a>(X)</div><!-- 못잡음 -->
	<div><a href="Error404.st" class="btn btn-success mb-1">404에러 발생()</a></div><!--페이지없음 -->
	<div><a href="Error405.st" class="btn btn-success mb-1">405에러 발생()</a></div><!--get을 post로 넘길 때 오류 -->
	<div><a href="Error500.st" class="btn btn-success mb-1">500에러 발생(컴파일에러)</a></div><!-- 컴파일오류 -->
	<!-- 초기파일=환경파일:web.xml에 설정함 -->
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>