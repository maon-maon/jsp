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
	<div>현재 <font color="blue"><b>${sNickName}(<font color="red">${sStrLevel}</font>)</b></font>님 로그인 중입니다.</div>
	<c:if test="${sLevel == 0}"><a href="AdminMain.ad"><font color="gray"><br/>관리자메뉴 바로가기</font></a></c:if>
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
  <!-- 241101 모달은 같은 창에서 뜨기 때문에 창의 이동이 없이 내용을 볼 수 있음
  			현재브라우저의 내용만 띄울 수 있음 -->
  <div>방명록에 작성한글 수 : <font color="blue">총 <b>${guestCnt}</b>건</font></div>
  <div>게시판에 작성한글 수 : <font color="blue">총 <b>${boardCnt}</b>건</font></div>
	
	<!-- The Modal 241101-->
	<div class="modal" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    
	      <!-- Modal Header -->
	    <div class="modal-header">
	      <h1 class="modal-title">Modal Heading</h1>
	      <button type="button" class="close" data-dismiss="modal">×</button>
	    </div>
	    
	    <!-- Modal body -->
	    <div class="modal-body">
	    </div>
	    
	    <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
  
	<hr/>
	<div>회원 사진 : <img src="${ctp}/images/member/${mVo.photo}" width="300px"></div>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>