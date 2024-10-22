<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t3_Application.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
	<jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>어플리케이션 연습 메인 메뉴</h2>
	<!-- 어플리케이션은 관련된 모든 접속을 관리함. 전체삭제가 없음=삭제시 모든 접속자가 튕김.
			 	서버 관리자가 서버 종료시 사용함. -->
	<form name="myform" method="post" action="t3_ApplicationSave.jsp">
		<div>아이디 : 
			<input type="text" id="mid" name="mid" value="${aMid}" class="form-control mb-2" required autofocus placeholder="아이디를 입력하세요" />
		</div>
		<div>닉네임: 
			<input type="text" id="nickName" name="nickName" value="${aNickName }" class="form-control mb-2" required placeholder="닉네임을 입력하세요"/>
		</div>
		<div>성명: 
			<input type="text" id="name" name="name" value="${aName }" class="form-control mb-2" required placeholder="이름을 입력하세요"/>
		</div>
		<div class="row">			
			<div class="col"><button type="submit" class="btn btn-success form-control mb-2" >어플리케이션저장(post)</button></div>
			<div class="col"><a href="t3_ApplicationCheck.jsp" class="btn btn-primary">어플리케이션확인(get)</a></div>
			<div class="col"><a href="t3_ApplicationDelete.jsp" class="btn btn-danger">부분어플리케이션삭제(get)</a></div>
		</div>
	</form>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>