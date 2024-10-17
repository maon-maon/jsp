<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t1_CookiesPwdDelete.jsp -->
<%
	Cookie[] cookies = request.getCookies();

	for(int i=0; i<cookies.length; i++) {
		if(cookies[i].getName().equals("cPwd"))
		cookies[i].setMaxAge(0); // 0이나 음수는 없는걸로 인식
		response.addCookie(cookies[i]); // 빈쿠키를 덮어써서 클리어
	}
%>
<script>
	alert("비밀번호 쿠키가 삭제되었습니다.");
	location.href = "t1_Cookies.jsp";
</script>