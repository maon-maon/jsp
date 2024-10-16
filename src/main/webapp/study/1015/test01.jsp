<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 
 	지시자(directive) - < % @   % >  : page 현 페이지의 환경설정에 관계된 사항처리(page, include, taglib)
 	스크립틀릿(scriptlet) - < %   % > : JSP코드 안에서 java 코드를 사용할때 처리
 	선언문(declaration) - < % !   % > : JSP코드 안에서 java 코드나 메소드의 선언문을 선언할때 기술
 	표현식(expression) - < % =   % > : JSP코드 안에서 값(변수값)을 브라우저에 출력할때 기술
 -->
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test01.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>JSP 학습</h2> <!-- 웹화면에 출력됨 -->
	<%
		System.out.println("1.이곳은 test1.jsp입니다."); //자바코드사용. 콘솔에 출력됨
	%>
	<div>앞의 문장을 표현식으로 표시</div>
	<div><%="2.이곳은 test1.jsp입니다." %></div> <!-- 표현식으로 쓰면 브라우저에 출력됨 -->
	<%
		int i = 100;
		out.println("i = "+ i); //자바코드를 사용함. 화면에 출력
	%>
	<div>선언문을 이용한 j변수 선언</div>
	<%!
		int j = 200;
	%>
	<%
		out.println("j = "+ j);	
	%>
	<div><%="j = "+ j %></div>
</div>
<p><br/></p>
</body>
</html>