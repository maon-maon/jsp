<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t3_init.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>이곳은 init(Servlet)에서 보낸 값을 찍어봅니다.</h2>
	<p>
		회사명 : ${sLogoName}<br/>
		홈페이지 주소 : <a href="${sHomeAddess}">${sHomeAddess}</a>
	</p>
	<hr/>
	<p><a href="${ctp}/1021/T3_initOk" class="btn btn-success">컨트롤러 다녀오기</a></p>
	<p><a href="${ctp}/1021/T3_initOut" class="btn btn-warning">세션종료</a></p>
</div>
<p><br/></p>
</body>
</html>