<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t1_FilterRes.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>이곳은 t1_FilterRes입니다.</h2>
	<div>
		서버에서 전송되어온 메세지 : ${msg}
	</div>
	<hr>
	<div><a href="${ctp}/study/1021_xml/t1_filter.jsp" class="form-control btn btn-success">돌아가기</a></div>
</div>
<p><br/></p>
</body>
</html>