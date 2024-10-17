<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String flag = request.getParameter("flag")==null ? "" : request.getParameter("flag");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t02_Dispatcher.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		'use strict';
		
		if('<%=flag%>' == 'no') alert("회원정보를 확인하세요");
		
		function fCheck() {
			let mid =  document.getElementById("mid").value;
			let pwd =  document.getElementById("pwd").value;
			
			if(mid.trim() == "") {
				alert("아이디를 입력하세요.");
				document.document.getElementById("mid").focus();
				return false;
			}
			else if(pwd.trim() == "") {
				alert("비밀번호를 입력하세요.");
				document.document.getElementById("pwd").focus();
				return false;
			}
			else {
				myform.action = "<%=request.getContextPath() %>/1016/T01Ok2"; /* 별도로 경로를 지정했으니 여기로 감.myform의 액션을 무시 */
				myform.submit(); /* 위에 행이 없으면 myform에 있는 경로:/1016/T01Ok1 여기로 전달됨 */
			}
		}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>RequestDispatcher 객체를 통한 값의 전달/이동</h2>
	<!-- 포워드=직렬화 : 중간에 멈추지 않음 -->
	<hr/>
	<form name="myform" method="post" action="<%=request.getContextPath() %>/1016/T01Ok1">
	<!-- 직렬화는 중간에 멈추면 값이 소멸되서 끝까지 가져가지 못 함 -->
		<div>아이디: 
			<input type="text" id="mid" name="mid" value="hkd1234" class="form-control mb-2" required autofocus placeholder="아이디를 입력하세요" />
		</div>
		<div>비밀번호: 
			<input type="password" id="pwd" name="pwd" value="1234" class="form-control mb-2"  placeholder="비밀번호를 입력하세요"/>
		</div>
		<div>
			<button type="submit" class="btn btn-success form-control mb-2" >로그인Ok1</button>
			<button type="button" onclick="fCheck()" class="btn btn-info form-control mb-2" >로그인Ok2(dispatcher)</button>
			<button type="reset" class="btn btn-warning form-control mb-2" >다시입력</button>
		</div>
	</form>
</div>
<p><br/></p>
</body>
</html>