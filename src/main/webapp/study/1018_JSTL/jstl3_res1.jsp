<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl3_res1.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h5>Database에서 가져온 1건의 자료를 출력(vo)</h5> <!-- vo에 담긴 자료 출력 -->
	<div class="card p-3">
		<div class="card p-2 m-2">성명 : ${vo.name}</div>
		<div class="card p-2 m-2">나이 : ${vo.age}</div>
		<div class="card p-2 m-2">성별 : ${vo.gender}</div>
		<div class="card p-2 m-2">직업 : ${vo.job}</div>
		<div class="card p-2 m-2">주소 : ${vo.address}</div>
	</div>
	<hr/>
	<div><a href="${ctp}/study/1018_JSTL/jstl3_vo.jsp" class="btn btn-success">돌아가기</a></div>
</div>
<p><br/></p>
</body>
</html>