<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test2.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <script type="text/javascript">
  	'use strict';
  	
  	if('${message}' != "") {
  		alert("${message}");
  		location.href = "${ctp}/study2/mapping/Test2"; /* 페이지 위치를 옮겨줌. 데이터 전송 페이지가 아니라 값이 없는 메인을 띄워줌 */
  	}
  </script>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>URL패턴(확장자 패턴) - .do</h2>
	<hr/>
	<div>전송 메세지 : ${msg}</div>	 <!-- 컨트롤러에서 전송 -->
	<div>전송 메세지2 : ${msg2}</div>	 <!-- 인터페이스=프론트컨트롤러에서 전송 -->
	<hr/>
	<div>
		<%-- <a href="${ctp}/study2/mapping/list.do" class="btn btn-outline-success mr-3">연습list.do</a> --%> <!-- 디렉토리 사용 -->
		<a href="list.do?msg=list" class="btn btn-outline-success mr-3">list.do(전체)</a> <!-- 확장자 패턴은 이름.do만 적어도 됨 -->
		<a href="search.do?msg=search" class="btn btn-outline-primary mr-3">search.do(개별)</a> 
		<a href="input.do?msg=input" class="btn btn-outline-warning mr-3">input.do(가입)</a> 
		<a href="update.do?msg=update" class="btn btn-outline-info mr-3">update.do(수정)</a>
		<a href="delete.do?msg=delete" class="btn btn-outline-secondary mr-3">delete.do(삭제)</a>
	</div>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>