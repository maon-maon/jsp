<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_ApplicationSave.jsp -->
<%
	request.setCharacterEncoding("utf-8");
	
	application.setAttribute("aMid", request.getParameter("mid"));
	application.setAttribute("aNickName", request.getParameter("nickName"));
	application.setAttribute("aName", request.getParameter("name"));
	
%>
<script>
	alert("어플리케이션이 생성/저장되었습니다.");
	location.href = "t3_Application.jsp";
</script>