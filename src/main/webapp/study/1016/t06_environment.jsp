<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String hostIp = request.getRemoteAddr(); /* 접속자의 주소 서버에 요청 */
	request.setAttribute("hostIp2", request.getRemoteAddr()); /* 변수=서버 저장소의 변수 담아서 사용 */
	pageContext.setAttribute("hostIp3", request.getRemoteAddr()); /* 담아서 사용 */
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t06_environment.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>서버의 환경변수값 확인</h2>
	<hr/>
	<div>호스트IP1 : <%=hostIp%></div>
	<div>호스트IP2 : ${hostIp2}</div>
	<div>호스트IP3 : ${hostIp3}</div>
	<div>전송방식 : <%=request.getMethod() %></div>
	<div>접속프로토콜 : <%=request.getProtocol() %></div>
	<div>접속(서버)포트 : <%=request.getServerPort() %></div>
	<div>접속(서버)이름 : <%=request.getServerName() %></div>
	<div>접속 Context이름 : <%=request.getContextPath() %></div>
	<div>접속 URL : <%=request.getRequestURL() %></div> <!-- URLocation : 위치 -->
	<div>접속 URI : <%=request.getRequestURI() %></div> <!-- URIdentify : 식별자 -->
</div>
<p><br/></p>
</body>
</html>