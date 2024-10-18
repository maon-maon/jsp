<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_SessionSave.jsp -->
<%
	request.setCharacterEncoding("utf-8");
	
	session.setAttribute("sMid", request.getParameter("mid"));
	session.setAttribute("sNickName", request.getParameter("nickName"));
	session.setAttribute("sName", request.getParameter("name"));
	
%>
<script>
	alert("세션이 생성/저장되었습니다.");
	location.href = "t2_Session.jsp";
</script>