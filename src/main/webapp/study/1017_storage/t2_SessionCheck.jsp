<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = (String) session.getAttribute("sMid");
	String nickName = (String) session.getAttribute("sNickName");
	String name = (String) session.getAttribute("sName");
	
	pageContext.setAttribute("mid", mid);
	pageContext.setAttribute("nickName", nickName);
	pageContext.setAttribute("name", name);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t2_SessionCheck.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>세션값 출력</h2>
	<p>아이디 :${mid} </p>
	<p>닉네임 :${nickName} </p>
	<p>성명  :${name} </p>
	<hr/>
	<p><a href="t2_Session.jsp" class="btn btn-info">돌아가기</a></p>
</div>
<p><br/></p>
</body>
</html>