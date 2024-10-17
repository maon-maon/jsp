<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- SessionAllDelete.jsp -->
<%
	session.invalidate(); //세션 삭제 명령어 : invalidate()
%>
<script>
	alert("모든 세션이 삭제되었습니다.");
	location.href = "t2_Session.jsp";
</script>