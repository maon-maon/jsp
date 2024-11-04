<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>boardList.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
<script>
	'use strict';
	
	function pageSizeCheck() {
		let pageSize = document.getElementById("pageSize").value;
		location.href = "BoardList.bo?pag=1&pageSize="+pageSize;
	}
</script>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2 class="text-center">게 시 판 리 스 트</h2>
	<table class="table table-boderless">
		<tr>
			<td><a href="BoardInput.bo" class="btn btn-success btn-sm">글쓰기</a></td>
			<td class="text-right" >
				<select name="pageSize" id="pageSize" onchange="pageSizeCheck()" style="width: 50px; height: 30px;" class="text-center"> 
					<option value="3" <c:if test="${pageSize == 3}">selected</c:if> >3</option>
					<option value="5"  <c:if test="${pageSize == 5}">selected</c:if> >5</option>
					<option value="10"  <c:if test="${pageSize == 10}">selected</c:if> >10</option>
					<option value="15"  <c:if test="${pageSize == 15}">selected</c:if> >15</option>
					<option value="20"  <c:if test="${pageSize == 20}">selected</c:if> >20</option>
					<option value="30"  <c:if test="${pageSize == 30}">selected</c:if> >30</option>
				</select>
			</td>
		</tr>
	</table>
	<table class="table table-hover text-center">
		<tr style="background-color: #eee">
			<th>글번호</th>
			<th>글제목(댓글)</th>
			<th>글쓴이</th>
			<th>글쓴날짜</th>
			<th>조회수(좋아요)</th>
		</tr>
		<c:set var="curScrStartNo" value="${curScrStartNo}" />
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<c:if test="${vo.openSw == '공개' || sMid == vo.mid || sLevel == 0}">
				<tr>
					<td>${curScrStartNo}</td>
					<td class="text-left"><a href="BoardContent.bo?idx=${vo.idx}&pag=${pag}">${vo.title}</td>
					<td>${vo.nickName}</td>
					<%-- <td>$ { vo.wD ate}</td> --%>
					<td>
					${fn:substring(vo.wDate,0,19)}
						<%-- <c:if test="${fn:substring(vo.wDate,0,10) != strToday }">${fn:substring(vo.wDate,0,10)}</c:if>
						<c:if test="${fn:substring(vo.wDate,0,10) == strToday }">${fn:substring(vo.wDate,0,19)}</c:if> --%>
					</td>
					<td>${vo.readNum}</td>
				</tr>
			</c:if>
		<c:set var="curScrStartNo" value="${curScrStartNo -1}"/>
		</c:forEach>
		
		<tr><td colspan="5" class="p-0 m-0"></td></tr>
	</table>
	<br/>
</div>
	
	<!-- 페이징처리 -->
	<div class="text-center">
		<ul class="pagination justify-content-center">
	  <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="BoardList.bo?pageSize=${pageSize}&idx=${vo.idx}&pag=1">첫페이지</a></li></c:if>
	  <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="BoardList.bo?pageSize=${pageSize}&idx=${vo.idx}&pag=${(curBlock-1)*blockSize +3}">이전블록</a></li></c:if>
	  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
	    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-dark border-secondary" href="BoardList.bo?pageSize=${pageSize}&idx=${vo.idx}&pag=${i}"><font color="white"><b>${i}</b></font></a></li></c:if>
	    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="BoardList.bo?pageSize=${pageSize}&idx=${vo.idx}&pag=${i}">${i}</a></li></c:if>
	  </c:forEach>
	 	<c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="BoardList.bo?pageSize=${pageSize}&idx=${vo.idx}&pag=${(curBlock+1)*blockSize +1}">다음블록</a></li></c:if>
	 	<c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="BoardList.bo?pageSize=${pageSize}&idx=${vo.idx}&pag=${totPage}">마지막페이지</a></li></c:if>
	  </ul>
	</div>
	
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>