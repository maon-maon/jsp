<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberLogin.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <script>
  
  /* 아이디 유효성 검사 */
  
  </script>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2 class="text-center">회 원 로 그 인</h2>
	<form name="myform" method="post" action="MemberLoginOk.mem">
		<div>아이디 : 
			<input type="text" id="mid" name="mid" value="${cookieMid}" class="form-control mb-2" required autofocus placeholder="아이디를 입력하세요" />
		</div>
		<div>비밀번호: 
			<input type="password" id="pwd" name="pwd" value="" class="form-control mb-2" required placeholder="비밀번호를 입력하세요"/>
		</div>
		<div class="row text-center">
      <div class="col"><button type="submit" class="btn btn-outline-success form-control mb-2" >로그인</button></div>
      <div class="col"><button type="reset" class="btn btn-outline-warning form-control mb-2" >다시입력</button></div>
      <div class="col"><button type="button" onclick="location.href='${ctp}/'" class="btn btn-outline-primary form-control">돌아가기</button></div>
      <div class="col"><button type="button" onclick="location.href='MemberJoin.mem'" class="btn btn-outline-secondary form-control" >회원가입</button></div>
    </div>
	</form>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>