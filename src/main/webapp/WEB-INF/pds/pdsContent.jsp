<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>pdsContent.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <style>
	  th {
	    text-align: center;
	    background-color: #eee;
	  }
	</style>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>자료실 내용 상세보기</h2>
	<table class="table table-bordered text-center">
		<tr>
			<th>올린이</th>
			<td>${vo.nickName}</td>
			<th>올린날짜</th>
			<td>${vo.fDate}</td>
		</tr>
		<tr>
			<th>파일명</th>
			<td>
				<c:set var="fNames" value="${fn:split(vo.fName, '/')}"/>
				<c:set var="fSNames" value="${fn:split(vo.fSName, '/')}"/>
				<c:forEach var="fName" items="${fNames}" varStatus="st">
					<a href="${ctp}/images/pds/${fSNames[st.index]}" download="${fName}" onclick="downNumCheck(${vo.idx})" >${fName}</a><br/>
				</c:forEach>
					(<fmt:formatNumber value="${vo.fSize/1024}" pattern="#,##0" /> KByte)
			</td>
			<th>다운횟수</th>
			<td>${vo.downNum}</td>
		</tr>
		<tr>
			<th>분류</th>
			<td>${vo.part}</td>
			<th>접속IP</th>
			<td>${vo.hostIp}</td>
		</tr>
		<tr>
			<th>상세내용</th>
			<td colspan="3" class="text-left">
				${fn:replace(vo.content, newLine, "<br/>")}
			</td>
		</tr>
	</table>
	<br/>
	<div><a href="PdsList.pds" class="btn btn-warning">돌아가기</a></div>
	<br/>
	<!-- 자료실에 등록된 자료가 사진이라면 아래쪽에 사진들을 모두 보여준다. -->
	<div class="text-center">
		<c:forEach var="fSName" items="${fSNames}" varStatus="st">
			${st.count}.${fNames[st.index]} : <br/>
			<c:set var="len" value="${fn:length(fSName)}"/>
			<c:set var="ext" value="${fn:substring(fSName, len-3, len)}"/>
			<c:set var="extLower" value="${fn:toLowerCase(ext)}"/>
			<c:if test="${extLower == 'jpg' || extLower == 'gif' ||extLower == 'png'}">
				<img src="${ctp}/images/pds/${fSName}" width="50%">
			</c:if>
			<hr>
		</c:forEach>
	</div>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>