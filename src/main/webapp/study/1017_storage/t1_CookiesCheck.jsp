<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t1_CookiesCheck.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>저장된 쿠키 확인하기</h2>
	<hr/>
	<p>
	<!-- 쿠키는 여러개 저장가능 = 무조건 배열로 받음 -->
<%
	Cookie[] cookies = request.getCookies(); // 서버가 클라이언트의 자료를 배열로 모두 가져옴
	
	out.println("저장된 쿠키는?<br/>");
	for(int i=0; i<cookies.length; i++) {
		out.println("쿠키명 : " + cookies[i].getName() + " , ");
		out.println("쿠키값 : " + cookies[i].getValue() + " , ");
		out.println("쿠키만료시간 : " + cookies[i].getMaxAge() + "<br/><br/> ");/* 브라우저 정책상 표시안됨 */
	}
%>
	</p>
	<hr/>
	<p><a href="t1_Cookies.jsp" class="btn btn-info">돌아가기</a></p>
</div>
<p><br/></p>
</body>
</html>