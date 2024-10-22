<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>storageMenu.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>storage 연습</h2>
	<hr>
	<div>
		<a href="${ctp}/study/1017_storage/t1_Cookies.jsp" class="form-control btn btn-success mb-2">쿠키연습</a>
		<a href="${ctp}/study/1017_storage/t2_Session.jsp" class="form-control btn btn-primary mb-2">세션연습</a>
		<a href="${ctp}/study/1017_storage/t3_Application.jsp" class="form-control btn btn-info mb-2">어플리케이션연습</a>
		<a href="${ctp}/study/1017_storage/t4_StorageTest.jsp" class="form-control btn btn-warning">스토리지 응용</a>
	</div>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>