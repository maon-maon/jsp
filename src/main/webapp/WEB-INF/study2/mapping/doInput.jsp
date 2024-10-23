<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>doInput.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>doInput.jsp</h2>
	<hr>
	<div><img src="${ctp}/images/253.jpg" width="500px"></div>	
	<hr>
	<%-- <div>
		<a href="${ctp}/study2/mapping/inputOk.do" class="btn btn-outline-primary">회원가입</a>
		<a href="inputOk.do" class="btn btn-outline-primary">회원가입</a>
		<a href="${ctp}/study2/mapping/Test2" class="btn btn-outline-success">돌아가기</a>
	</div> --%>
	<div class="row">
		<div class="col"><a href="inputOk.do" class="btn btn-outline-primary">회원가입하기</a></div> <!-- 파라메터에 inputOk.do를 넘김 ->DoController파일로 -->
		<div class="col"><a href="${ctp}/study2/mapping/Test2" class="btn btn-outline-success">돌아가기</a></div>
	</div>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>