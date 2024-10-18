<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
 int aCount = application.getAttribute("aCount")==null ? 0 : (int)application.getAttribute("aCount"); //처음 0표시
 int sCount = session.getAttribute("sCount")==null ? 0 : (int)session.getAttribute("sCount");
 
 aCount++;
 sCount++;
  
 application.setAttribute("aCount", aCount); //저징된
 session.setAttribute("sCount", sCount);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t4_StorageTest.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>방문카운트 비교하기</h2>
	<hr/>
	<p>어플리케이션 카운트 :${aCount}</p> <!-- 모든 브라우저가 값을 공유함 -->
	<hr/>
	<p>세션 카운트 :${sCount}</p> <!-- 브라우저별 따로 세션이 증가됨 -->
	<hr/>
	<p>
		<a href="t4_ApplicationClear.jsp" class="btn btn-success">어플리케이션 카운트 초기화</a>
		<a href="t4_SessionClear.jsp" class="btn btn-primary">세션 카운트 초기화</a>
		<a href="javascript:location.reload()" class="btn btn-info">방문수 증가1</a>
		<a href="t4_StorageTest.jsp" class="btn btn-info">방문수 증가2</a>
	</p>
</div>
<p><br/></p>
</body>
</html>