<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t2_Session.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>세션 연습 메인 메뉴</h2>
	<form name="myform" method="post" action="t2_SessionSave.jsp">
		<div>아이디 : 
			<input type="text" id="mid" name="mid" value="" class="form-control mb-2" required autofocus placeholder="아이디를 입력하세요" />
		</div>
		<div>닉네임: 
			<input type="text" id="nickName" name="nickName" value="" class="form-control mb-2" required placeholder="닉네임을 입력하세요"/>
		</div>
		<div>성명: 
			<input type="text" id="name" name="name" value="" class="form-control mb-2" required placeholder="이름을 입력하세요"/>
		</div>
		<div class="row">			
			<div class="col"><button type="submit" class="btn btn-success form-control mb-2" >세션저장(post)</button></div>
			<div class="col"><a href="t2_SessionCheck.jsp" class="btn btn-primary">세션확인(get)</a></div>
			<div class="col"><a href="t2_SessionAllDelete.jsp" class="btn btn-danger">전제세션삭제(get)</a></div>
			<div class="col"><a href="t2_SessionDelete.jsp" class="btn btn-warning">부분세션삭제(get)</a></div>
		</div>
	</form>
</div>
<p><br/></p>
</body>
</html>