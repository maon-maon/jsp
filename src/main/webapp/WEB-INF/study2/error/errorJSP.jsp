<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="/errorMSG/errorMessage.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>errorJSP.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	name 파라메터 값 : <font color="red"><%=request.getParameter("name") %></font> : 값이 없으므로 null이 찍힘.<br/><br/>
	<%-- name 파라메터 값 : <font color="red"><%=request.getParameter("name").toUpperCase() %></font> --%>
	<!-- jsp=뷰에서 출력하려고 할 때 서블릿에서 넘긴값이 없을 때 오류시 nullpoint오류가 발생함 -->
	<!-- 400error : 타입에러는 못 잡음 -->
	성명 : ${vo.name} <!-- 오류 발생 안 함 -->
	<c:forEach var="vo" items="${vos}">
		성명2 : ${vo.name}<br/>
		나이 : ${vo.nai}<br/>
	</c:forEach>
	<hr/>
	<div><a href="ErrorMenu.st" class="btn btn-warning">돌아가기</a></div>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>