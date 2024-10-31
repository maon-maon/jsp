<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberMain.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>회 원 전 용 방</h2>
	<hr/>
	<div>현재 <font color="blue"><b>${sNickName}(<font color="red">${strLevel}</font>)</b></font>님 로그인 중입니다.</div>
	<hr/>
  <c:if test="${sLevel == 1}">
  	<div><font color="red">정회원 등업조건 : <u>총 방문횟수 <b>10회</b>이상</u>, <u>방명록에 글쓰기 <b>2회</b> 이상</u></font></div>
  </c:if>
	<hr/>
	<div>총 방문횟수 : <font color="blue"><b>${mVo.visitCnt}</b></font></div>
  <div>오늘 방문횟수 : <font color="blue"><b>${mVo.todayCnt}</b></font></div>
  <div>최종 방문일 : <font color="blue"><b>${fn:substring(sLastDate,0,19)}</b></font></div>
  <div>총 보유 포인트 : <font color="blue"><b>${mVo.point}</b></font></div>
	<hr/>
  <!-- 방명록 작성자의 이름/닉네임/아이디으로 검색 -->
  <div>방명록에 작성한글 수 : <font color="blue">총 <b>${guestCnt}</b>건</font></div>
	<hr/>
	<div>회원 사진 : <img src="${ctp}/images/member/${mVo.photo}" width="300px"></div>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>