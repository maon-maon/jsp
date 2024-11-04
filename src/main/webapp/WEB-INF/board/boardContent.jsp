<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% pageContext.setAttribute("newLine", "\n"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>boardContent.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
	<style>
	  th {
	    text-align: center;
	    background-color: #eee;
	  }
	</style>
	<script>
		'use strict';
		
		function boardDelete() {
			let ans = confirm("해당 게시글을 삭제하시겠습니까?");
			if(ans)	location.href="BoardDelete.bo?idx=${vo.idx}"; // 함수에서 idx를 받아서 넘김
		}
	</script>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2 class="text-center">글 내용 보기</h2>
	<table class="table table-bordered mt-5">
    <tr>
      <th>글쓴이</th>
      <td>${vo.nickName}</td>
      <th>글조회수</th>
      <td>${vo.readNum}</td>
    </tr>
    <tr>
      <th>글쓴날짜</th>
      <td>${vo.wDate}</td>
      <th>접속IP</th>
      <td>${vo.hostIp}</td>
    </tr>
    <tr>
      <th>글제목</th>
      <td colspan="3">${vo.title}</td>
    </tr>
    <tr>
      <th>글내용</th>
      <td colspan="3" style="height:240px;">${fn:replace(vo.content, newLine, '<br/>')}</td>
    </tr>
    <tr>
  </table>  
  <table class="table table-borderless"> 
    	<c:if test="${sMid == vo.mid || sLevel == 0}">
	      <td colspan="2" class="text-left">
	      	<c:if test="${sMid == vo.mid}">
		        <input type="button" value="수정하기" onclick="location.href='BoardUpdate.bo?idx=${vo.idx}&pag=${pag}'" class="btn btn-primary"/>
		      </c:if>
	        <input type="button" value="삭제하기" onclick="boardDelete()" class="btn btn-dark"/> <!-- 수정=바로보내니까 idx붙임 / 삭제는 스크립트 처리하니까 거기서 넣음 -->
	      </td>
	      <td colspan="2" class="text-right">
	        <input type="button" value="돌아가기" onclick="location.href='BoardList.bo?pag=${pag}'" class="btn btn-warning"/>
	      </td>
	    </c:if>
      
      <c:if test="${sMid != vo.mid && sLevel != 0}">
	      <td colspan="4" class="text-center">
	        <input type="button" value="돌아가기" onclick="location.href='BoardList.bo?pag=${pag}'" class="btn btn-warning"/>
	      </td>
      </c:if>
    </tr>
  </table>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>