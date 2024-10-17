<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
	String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
	
	pageContext.setAttribute("mid", mid);
	pageContext.setAttribute("pwd", pwd);
	/* 현재페이지에서 출력할 때 사용. 서버저장소에 담았기 때문에 EL표기법 사용가능 */
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t08_resC.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>총무과 방</h2>
	<hr/>
	<h2>회원정보</h2>
	<p>아이디 : ${mid}</p>
	<p>비밀번호 : ${pwd}</p>
	<hr/>
	<p><a href="t08_param.jsp" class="btn btn-success">돌아가기</a></p>
	<hr/>
</div>
<p><br/></p>
</body>
</html>