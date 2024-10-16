<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t01_forword.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>Forword를 통한 값의 전달/이동</h2>
	<!-- 포워드=직렬화 : 중간에 멈추지 않음 -->
	<hr/>
	<form name="myform" method="post" action="t01Ok.jsp">
	<!-- 직렬화는 중간에 멈추면 값이 소멸되서 끝까지 가져가지 못 함 -->
		<div>아이디: 
			<input type="text" id="mid" name="mid" value="hkd1234" class="form-control mb-2" required autofocus placeholder="아이디를 입력하세요" />
		</div>
		<div>비밀번호: 
			<input type="password" id="pwd" name="pwd" value="1234" class="form-control mb-2"  placeholder="비밀번호를 입력하세요"/>
		</div>
		<div>
			<button type="submit" class="btn btn-info form-control mb-2" >로그인</button>
			<button type="reset" class="btn btn-warning form-control mb-2" >다시입력</button>
		</div>
	</form>
</div>
<p><br/></p>
</body>
</html>