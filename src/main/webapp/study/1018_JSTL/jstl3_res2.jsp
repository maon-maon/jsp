<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl3_res2.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <style>
  	th, td {
  		text-align: center;
  	}
  </style>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h5>Database에서 가져온 여러건의 자료를 출력(vo)</h5> <!-- vo에 담긴 자료 출력 -->
	<table class="table table-hover">
		<tr class="table-secondary">
			<th>번호</th>
			<th>성명</th>
			<th>나이</th>
			<th>성별</th>
			<th>직업</th>
			<th>주소</th>
		</tr>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${st.count}</td>
				<td>${vo.name}</td>
				<td>${vo.age}</td>
				<td>${vo.gender}</td>
				<td>${vo.job}</td>
				<td>${vo.address}</td>
			</tr>
		</c:forEach>
		<tr><td colspan="6" class="m-0 p-0"></td></tr> <!-- 마지막줄 선 넣기 -->
	</table>
	
	<div><a href="${ctp}/study/1018_JSTL/jstl3_vo.jsp" class="btn btn-success">돌아가기</a></div>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>