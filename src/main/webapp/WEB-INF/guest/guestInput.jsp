<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>guestInput.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">

<!--이메일 홈페이지 유효성 검사 
		버튼 인풋으로 바꿔서 온클릭 사용 -->

	<h2>방 명 록 글 쓰 기</h2>
	<form name="" method="post" action="GuestInputOk.gu" class="was-validated">
    <div class="form-group">
      <label for="uname">성명</label>
      <input type="text" class="form-control" id="name" value="${sNickName}" placeholder="Enter username" name="name" autofocus required>
      <div class="valid-feedback">Ok!!!</div>
      <div class="invalid-feedback">성명을 입력하세요</div>
    </div>
    <div class="form-group">
      <label for="email">Email</label>
      <input type="text" class="form-control" id="email" placeholder="Enter email" name="email" >
    </div>
    <div class="form-group">
      <label for="email">홈페이지</label>
      <input type="text" class="form-control" id="homePage" value="http://" placeholder="Enter homePage" name="homePage" >
    </div>
    <div class="form-group">
      <label for="content">방문소감</label>
      <textarea rows="5" class="form-control" id="content" placeholder="Enter content" name="content" required></textarea>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group text-center">
    	<button type="submit" class="btn btn-outline-primary mr-3">방명록 등록</button> 
    	<!-- <button type="submit" class="btn btn-outline-primary mr-3">방명록 등록</button> --> 
    	<button type="reset" class="btn btn-outline-warning mr-3">다시입력</button>
    	<button type="button" onclick="location.href='GuestList.gu'" class="btn btn-outline-dark">돌아가기</button>
    </div>
    <input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}" /> <!-- remoteAddr:클라이언트 아이피 표시 명령어 -->
  </form>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>