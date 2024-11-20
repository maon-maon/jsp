<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ajaxTest2_6.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>${mid}로 검색한 회원 리스트</h2>
  <c:if test="${fn:length(vos) != 0}">
	  <table class="table table-hover text-center">
	    <tr>
	      <th>번호</th>
	      <th>성명</th>
	      <th>닉네임</th>
	      <th>나이</th>
	      <th>성별</th>
	    </tr>
	    <c:forEach var="vo" items="${vos}" varStatus="st">
	      <tr>
	        <td>${st.count}</td>
	        <td>${vo.name}</td>
	        <td>${vo.nickName}</td>
	        <td>${vo.birthday}</td>
	        <td>${vo.gender}</td>
	      </tr>
	    </c:forEach>
	    <tr><td colspan="5" class="m-0 p-0"></td></tr>
	  </table>
  </c:if>
  <c:if test="${fn:length(vos) == 0}">
  	<div class="text-center">찾고자 하는 자료가 없습니다.</div>
  </c:if>
</div>
<p><br/></p>
</body>
</html>