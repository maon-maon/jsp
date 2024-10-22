<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstlMenu.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>JSTL 응용연습</h2>
	<hr/>
	<div><a href="${ctp}/study/1018_JSTL/jstl1.jsp" class="form-control btn btn-success mb-2">JSTL 1 Core</a></div>
	<div><a href="${ctp}/study/1018_JSTL/jstl2_for.jsp" class="form-control btn btn-warning mb-2">JSTL 2 for</a></div>
	<div><a href="${ctp}/study/1018_JSTL/jstl3_vo.jsp" class="form-control btn btn-primary mb-2">JSTL 3 VO</a></div>
	<div><a href="${ctp}/study/1018_JSTL/jstl4_function.jsp" class="form-control btn btn-info mb-2">JSTL 4 function</a></div>
	<div><a href="${ctp}/study/1018_JSTL/jstl5_format.jsp" class="form-control btn btn-secondary mb-2">JSTL 5 format</a></div>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>