<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_SessionDeleteOk.jsp -->
<%
	String sessionFlag = request.getParameter("sessionFlag");
	session.removeAttribute(sessionFlag);
%>
<script>
	alert("<%=sessionFlag%> 세션이 삭제되었습니다.");
	location.href = "t2_Session.jsp";
</script>