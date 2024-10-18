<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = (String) application.getAttribute("aMid");
	String nickName = (String) application.getAttribute("aNickName");
	String name = (String) application.getAttribute("aName");
	/* 저장한 sMid를 get(읽어)서 mdi변수에 저장함 */
	
	pageContext.setAttribute("mid", mid); // 위에서 생성한 mid를 "mid"변수에 담음 
	pageContext.setAttribute("nickName", nickName);
	pageContext.setAttribute("name", name);
%>
<!-- 전역변수라서 타 브라우저에서도 동일하게 적용됨. 브라우저 구분 없음(크롬/엣지 등등)
		 전체삭제시 관련된 모든 값이 사라지기 때문에 사용하지 않음
		 전송방식 = 통신의 전송방식 : 단방향통신, 반이중방식, 전이중방식(전화기), 브로드캐스팅
 -->
	<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t3_ApplicationCheck.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>저장된 어플리케이션 확인</h2>
	<p>아이디 :${mid} </p>
	<p>닉네임 :${nickName} </p>
	<p>성명  :${name} </p>
	<hr/>
	<p>세션 아이디 : <%=session.getId() %></p>
	<hr/>
	<p><a href="t3_Application.jsp" class="btn btn-info">돌아가기</a></p>
</div>
<p><br/></p>
</body>
</html>