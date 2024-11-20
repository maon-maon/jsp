<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ajaxIdCheck2_6.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<div class="container">
	<h2>${mid}로 검색 회원 리스트</h2>
	
		<table class="table table-hover text-center" >
			<tr class="table-info">
				<th>번호</th>
				<th>아이디</th>
				<th>성명</th>
				<th>생일</th>
				<th>성별</th>
				<th>주소</th>
			</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr>
					<td>${st.count}</td>
					<td>${vo.mid}</td>
					<td>${vo.nickName}</td>
					<td>${vo.birthday}</td>
					<td>${vo.gender}</td>
					<td>${vo.address}</td>
				</tr>
			</c:forEach>
			<tr><td colspan="6" class="m-0 p-0"></td></tr>';
		</table>
</div>
<p><br/></p>
</body>
</html>