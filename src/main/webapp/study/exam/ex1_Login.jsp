<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")) {
				pageContext.setAttribute("mid", cookies[i].getValue()); //쿠키에 있는 value를 읽어옴
				break;
			}
		}
	}
%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ex1_Login.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
   <style>
  	th, td {
  		text-align: center;
  	}
  	th {background-color: #eee}
  </style>
  <script>
  	'use strict';
  	
  	if('${message}' != "") alert("${message}");
  	
  	function fCheck() {
		alert("다녀옵니다.");
		myform.submit();
	}
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2 class="text-center">로그인</h2>
	<form name="myform" method="post" action="${ctp}/exam/Ex1LoginOk">
		<table class="table table-bordered">
			<tr>
				<th>아이디</th>
				<td><input type="text" id="mid" name="mid" value="${mid}" class="form-control mb-2" required autofocus placeholder="아이디를 입력하세요" /></td>
			</tr>
			<tr>
				<th>비밀번호:</th> 
				<td><input type="password" id="pwd" name="pwd" value="1234" class="form-control mb-2" required placeholder="비밀번호를 입력하세요"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<!-- <button type="submit" class="btn btn-success  mr-2" >로그인</button> -->
					<button type="button" onclick="fCheck()" class="btn btn-success  mr-2" >로그인</button>
					<button type="reset" class="btn btn-warning  mr-2" >다시입력</button>
					<button type="button" onclick="location.href=''" class="btn btn-primary  mr-4" >회원가입</button>
					<input type="checkbox" name="idSave" checked />아이디 저장
				</td>
			</tr>
		</table>
	</form>
</div>
<p><br/></p>
</body>
</html>