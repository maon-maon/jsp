<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberList.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
<style>
	th {
		text-align: center;
		background-color: #eee;
	}
</style>
<script>
	'use strict';
	
	function contentView(content) {
		$("#myModal #modalContent").text(content);
	}
	
</script>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2 class="text-center">회 원 리 스 트</h2>
	
	<!-- 테이블로 출력 -->
	<table class="table tqble-bordered">
		<tr>
			<th>번 호</th>
			<th>닉네임</th>
			<th>아이디</th>
			<th>성 명</th>
			<th>성 별</th>
			<th>생 일</th>
			<th>이메일</th>
			<th>최종방문일</th>
		</tr>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td class="text-center">${st.count}</td>
				<td>${vo.nickName}</td>
				<c:if test="${vo.userInfo == '공개'}">
				<!-- 241101 -->
					<td><a href="#" onclick="contentView('${ vo.content}')" data-toggle="modal" data-target="#myModal">${vo.mid}</a></td>
					<%-- <td><a href="#" onclick="contentView('내용이 출력됩니다')" data-toggle="modal" data-target="#myModal">${vo.mid}</a></td> --%>
					<td>${vo.name}</td>
					<td>${vo.gender}</td>
					<td>${fn:substring(vo.birthday,0,10)}</td>
					<td>${vo.email}</td>
					<td>
						<c:if test="${sMid == vo.mid}">${fn:substring(sLastDate,0,16)}</c:if>
						<c:if test="${sMid != vo.mid}">${fn:substring(vo.lastDate,0,16)}</c:if>
					</td>
				</c:if>
				<c:if test="${vo.userInfo != '공개'}">
					<td colspan="6" class="text-center">비공개</td>
				</c:if>
			</tr>
		</c:forEach>
		<tr><td colspan="8" class="m-0 p-0"></td></tr>
	</table>
	<!-- 블록페이지 시작2  -->
	<div class="text-center">
	 <ul class="pagination justify-content-center">
	  <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="MemberList.mem?pag=1">첫페이지</a></li></c:if>
	  <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="MemberList.mem?pag=${(curBlock-1)*blockSize +3}">이전블록</a></li></c:if>
	  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
	    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-dark border-secondary" href="MemberList.mem?pag=${i}"><font color="white"><b>${i}</b></font></a></li></c:if>
	    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="MemberList.mem?pag=${i}">${i}</a></li></c:if>
	  </c:forEach>
	 	<c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="MemberList.mem?pag=${(curBlock+1)*blockSize +1}">다음블록</a></li></c:if>
	 	<c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="MemberList.mem?pag=${totPage}">마지막페이지</a></li></c:if>
	  </ul>
	</div>	
	 <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h3 class="modal-title">자기소개</h3>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	<span id="modalContent">${vo.content}</span>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
	    </div>
    </div>
  </div>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>