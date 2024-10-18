<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t4_ApplicationClear.jsp -->
<%
	application.removeAttribute("aCount");
%>
<script>
	alert("모든 어플리케이션이 삭제되었습니다.");
	location.href = "t4_StorageTest.jsp";
</script>