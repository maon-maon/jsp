<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("newLine", "\n"); %> <!-- 엔터입력시 줄바꿈 적용 --> 
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>guestList.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <style>
  	th {
  		text-align: center;
  		background-color: #eee;
  	}
  </style>
  <script>
  	'use strict';
  	function deleteCheck(idx) {
		 let ans = confirm("현 방명록 삭제");
		 if(ans) location.href = "GuestDeleteOk.gu?idx="+idx;
	}
  </script>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2 class="text-center">방 명 록 리 스 트</h2>
	<!-- 글쓰기 / 관리자 버튼 -->
	<br/>
	<table class="table table-borderless m-0 p-0">
		<tr>
			<td class="text-left">
				<!-- <input type="button" value="글올리기" onclick="location.href=''" class="btn btn-outline-success"> -->
				<a href="GuestInput.gu" class="btn btn-outline-success">글올리기</a> <!-- 확장자 패턴은 앞에 없어도 됨 .gu가 다 걸러줌 -->
			</td>
			<td class="text-right">
				<c:if test="${sAdmin != 'adminOk'}"><a href="GuestAdmin.gu" class="btn btn-outline-success">관리자</a></c:if>
				<c:if test="${sAdmin == 'adminOk'}"><a href="GuestAdminOut.gu" class="btn btn-outline-success">관리자로그아웃</a></c:if>
			</td>
		</tr>
	</table>
	<!-- 방명록 내용 -->
	<c:set var="guestNo" value="${guestCnt}"/>
	<c:forEach var="vo" items="${vos}" varStatus="st">
		<table class="table table-borderless m-0 p-0">
			<tr>
				<td class="text-left">
					<%-- 번호 : ${vo.idx} --%>
					<%-- 번호 : ${st.count} --%>
					번호 : ${guestNo}
					<c:if test="${sAdmin == 'adminOk'}"><a href="javascript:deleteCheck(${vo.idx})" class="btn btn-danger btn-sm">삭제</a></c:if>
				</td>
				<td class="text-right">
					방문IP : ${vo.hostIp}
				</td>
			</tr>
		</table>
		<table class="table table-bordered">
			<tr>
				<th style="width: 120px">글쓴이</td>
				<td>${vo.name}</td>
				<th style="width: 120px">방문일자</td>
				<td>${fn:substring(vo.visitDate , 0,19)}</td>
			</tr>
			<tr>
				<th>Email</td>
				<td colspan="3"><!-- vo.email == '' || vo.email == null -->  <!-- 빈공간을 확인하는 명령어 empty --> <!-- 값이 없으면 -1 -->
					<c:if test="${empty vo.email || fn:length(vo.email)<6 || fn:indexOf(vo.email, '@')==-1|| fn:indexOf(vo.email, '.')==-1}">none</c:if>
					<c:if test="${!empty vo.email && fn:length(vo.email)>=6 && fn:indexOf(vo.email, '@')!=-1 && fn:indexOf(vo.email, '.')!=-1}">${vo.email}</c:if>
				</td>
			</tr>
			<tr>
				<th>홈페이지</td>
				<td colspan="3">
					<%-- <a href="$ { vo.homePage }" target="_blank" > $ { vo.homePage }< /a> --%>
					<c:if test="${empty vo.homePage || fn:length(vo.homePage)<=10 || fn:indexOf(vo.homePage, '.')==-1}">none</c:if>
					<c:if test="${!empty vo.homePage && fn:length(vo.homePage)>10 && fn:indexOf(vo.homePage, '.')!=-1}"><a href="$ { vo.homePage }" target="_blank" >${vo.homePage}</a></c:if>
				</td>
			</tr>
			<tr>
				<th>방문소감</td>
				<td colspan="3">${fn:replace(vo.content, newLine ,"<br/>")}</td>
			</tr>
		</table>
		<table class="table table-hover"></table>
		<c:set var="guestNo" value="${guestNo - 1}" />
	</c:forEach>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>