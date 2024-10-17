<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t1_CookiesSave.jsp -->
<!-- 선행조건 : 이미 로그인했을 때  -->
<%
	String mid = "hkd1234";
	Cookie cookieMid =  new Cookie("cMid", mid);
	/* 쿠키객체는 생성=저장임 */
	cookieMid.setMaxAge(60); //쿠키의 만료시간(초) : 1일 = 60 * 60 * 24 = ?
	response.addCookie(cookieMid); //이렇게 저장함. response
	
	String pwd = "1234";
	Cookie cookiePwd = new Cookie("cPwd", pwd);
	cookiePwd.setMaxAge(60*60);
	response.addCookie(cookiePwd);
%>
<script>
	alert("쿠키가 생성/저장되었습니다.");
	location.href = "t1_Cookies.jsp";
</script>