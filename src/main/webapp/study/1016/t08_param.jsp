<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t08_param.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>로그인</h2>
	<p>(부서명 : 인사과(I), 자재과(J), 생산과(S), 총무과(C))</p>
	<form name="myform" method="post" action="t08_paramOk.jsp">
		<div>아이디 : 
			<input type="text" id="mid" name="mid" value="adminI" class="form-control mb-2" required autofocus placeholder="아이디를 입력하세요" />
		</div>
		<div>비밀번호: 
			<input type="password" id="pwd" name="pwd" value="1234" class="form-control mb-2" required placeholder="비밀번호를 입력하세요"/>
		</div>
		<div>
			<button type="submit" class="btn btn-success form-control mb-2" >로그인</button>
			<button type="reset" class="btn btn-warning form-control" >다시입력</button>
		</div>
	</form>
</div>
<p><br/></p>
</body>
</html>