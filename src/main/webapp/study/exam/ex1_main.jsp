<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ex1_main.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>이곳은 회원(${sMid}) 메인방입니다.</h2>
	<hr/>
	<div>
		<a href="${ctp}/study/exam/ex1_Login.jsp" class="btn btn-success">돌아가기</a>
	</div>
</div>
<p><br/></p>
</body>
</html>