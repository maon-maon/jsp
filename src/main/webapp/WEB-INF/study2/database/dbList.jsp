<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>dbList.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
	<script>
		'use strict';
		
		function nameSearch() {
			let name = document.getElementById("name").value;
			if(name.trim() == "") {
				alert("입력하세요");
				document.getElementById("name").focus;
			}
			//else location.href = "${ctp}/study2/database/DbSearch?name="+name; //개별자료 검색할 때 사용
			// 22 DbSearch사용 안하고 DbList사용
			else location.href = "${ctp}/study2/database/DbList?name="+name; //개별자료 검색할 때 사용
		}
	</script>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2 class="text-center">회 원 리 스 트</h2>
	<!-- 25 -->
	<div class="row mb-1">
		<div class="col text-left"><a href="${ctp}/study2/database/DbInput" class="btn btn-success">회원가입</a></div>
		<div class="col text-right"><a href="${ctp}/study2/database/DbList" class="btn btn-primary">전체검색</a></div>
	</div>
	
	<div>
		<table class="table table-hover text-center">
			<tr class="table-secondary">
				<th>번호</th>
				<th>성명</th>
				<th>나이</th>
				<th>성별</th>
				<th>주소</th>
			</tr>
			<!-- 11 -->
			<!-- 12 -->
			<c:forEach var="vo" items="${vos}" varStatus="st">	
				<tr>
					<%-- <td>${vo.idx}</td> --%> <!--11  -->
					<td>${st.count}</td>
					<!-- 30 -->
					<td><a href="${ctp}/study2/database/DbSearch?idx=${vo.idx}">${vo.name}</a></td>
					<td>${vo.age}</td>
					<td>${vo.gender}</td>
					<td>${vo.address}</td>
				</tr>
			</c:forEach>
			<tr><td colspan="5" class="m-0 p-0"></td></tr>
		</table>
	</div>
	<!-- 17 -->
	<div class="input-group mt-1 mb-3">
		<div class="input-group-prepend"> <div class="input-group-text">성명검색</div></div>
		<input type="text" name="name" id="name" class="form-control" />
		<div class="input-group-append"><input type="button" value="검색" onclick="nameSearch()" class="btn btn-outline-dark"/></div>
	</div>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>