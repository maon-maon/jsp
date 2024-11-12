<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>pdsList.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <script>
  	'use strict';
  	
  	function partCheck() {
			
		}
  	
  	// 다운로드수 증가
  	function downNumCheck(idx) {

  		$.ajax({
				type : "post",
				url : "DownNumCheck.pds",
				data : {idx : idx} ,
				success: function() {
					location.reload();
				} ,
				error: function() {
					alert("전송실패");
				} 
			});
		}
  	
  	// 자료실 삭제(DB + 자료)
  	function pdsDeleteCheck(idx,fSName) {
			let ans =  confirm("자료를 삭제하시겠습니까?");
			if(!ans) return false;
  		
  		$.ajax({
				type : "post",
				url : "PdsDeleteCheck.pds",
				data : {
					idx : idx,	
					fSName : fSName
				},
				success: function(res) {
					if(res != "0") {
						alert("자료 삭제 완료");
						location.reload();
					}
					else {
						alert("자료 삭제 실패");
					}
				} ,
				error: function() {
					alert("전송실패");
				} 
			});
		}
  	
  	//분류별 검색하기
  	function partCheck() {
			let part = $("#part").val();
			//alert("partChecklet part   "+part);
			//if(part != '') location.href = "PdsSearchList.pds?part="+part;
			//if(part != '') location.href = "PdsList.pds?pag=${pag}&pageSize=${pageSize}&part="+part;
			//if(part == '전체') location.href = "PdsList.pds";
			
			location.href = "PdsList.pds?pag=${pag}&pageSize=${pageSize}&part="+part;
		}
  	
  	
  	
  	
  	
  </script>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>자 료 실 리 스 트</h2>
	<br/>
	<table class="table table-borderless">
		<tr >
			<td>
				<c:if test="${sLevel > 2 || sLevel == 0}">
					<a href="PdsInput.pds?part=${part}&pag=${pag}&pageSize=${pageSize}" class="btn btn-secondary btn-sm">자료올리기</a>
				</c:if>
			</td>
			<td class="text-right">
				<form name="partform">
					<select name="part" id="part" onchange="partCheck()"> <!-- 테이블로 유동적으로 처리가능 -->
						<option ${part == '전체' ? 'selected' : '' } >전체</option>
						<option ${part == '학습' ? 'selected' : '' } >학습</option>
						<option ${part == '여행' ? 'selected' : '' } >여행</option>
						<option ${part == '음식' ? 'selected' : '' } >음식</option>
						<option ${part == '기타' ? 'selected' : '' } >기타</option>
					</select>
				</form>
			</td>
		</tr>	
	</table>
			
	<table class="table table-hover text-center">
		<tr style="background-color: #E5E5E5;">
			<th>번호</th>
      <th>올린이</th>
      <!-- 이 부분 비공개면 안 보임 -->
      <th>자료제목</th>
      <th>올린날짜</th>
      <th>분류</th>
      <th>파일명(크기)</th>
      <th>다운수</th>
      <th>비고</th>
		</tr>
		<c:set var="curScrStartNo" value="${curScrStartNo}"/>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr> <!-- 일괄저장=압축파일 -->
				<td>${curScrStartNo}</td>
				<td>${vo.nickName}</td>
				
				<!-- 241111 비공개일때 처리 -->
				<c:if test="${vo.openSw == '공개' || sMid == vo.mid || sLevel == 0}">
					<td>
						<%-- <a href="PdsContent.pds?idx=${vo.idx}&part=${part}">${vo.title}</a> --%>
						<c:if test="${sLevel != 1}"><a href="PdsContent.pds?idx=${vo.idx}&part=${part}">${vo.title}</a></c:if>
						<c:if test="${sLevel == 1}">${vo.title}<br/></c:if>
					</td><!-- 24시간new 1,2,3처리 -->
					<td>${fn:substring(vo.fDate, 0,19)}</td>
					<td>${vo.part}</td>
					<!-- <td>${vo.fName}/(${vo.fSize})</td> -->
					<td>
						<c:set var="fNames" value="${fn:split(vo.fName, '/')}"/>
						<c:set var="fSNames" value="${fn:split(vo.fSName, '/')}"/>
						<c:forEach var="fName" items="${fNames}" varStatus="st">
						<!-- 241111 -->
							<c:if test="${sLevel != 1}"><a href="${ctp}/images/pds/${fSNames[st.index]}" download="${fName}" onclick="downNumCheck(${vo.idx})" >${fName}</a><br/></c:if>
							<c:if test="${sLevel == 1}">${fName}<br/></c:if>
						</c:forEach>
							(<fmt:formatNumber value="${vo.fSize/1024}" pattern="#,##0" /> KByte)
					</td>
					<td>${vo.downNum}</td >
					<td>
						<c:if test="${vo.mid == sMid || sLevel == 0}">
							<a href="javascript:pdsDeleteCheck('${vo.idx}','${vo.fSName}')" class="badge badge-danger">삭제</a><br/>
						</c:if>
						<c:if test="${sLevel != 1}"><a href="PdsTotalDown.pds?idx=${vo.idx}" class="badge badge-primary">전체다운로드</a><br/></c:if>
						<c:if test="${sLevel == 1}">정회원메뉴<br/></c:if>
					</td>
				</c:if>
				<c:if test="${vo.openSw != '공개' && sMid != vo.mid && sLevel != 0}">
					<td colspan="6" class="text-center">비공개파일</td>
				</c:if>
			</tr>
			<c:set var="curScrStartNo" value="${curScrStartNo-1}"/>
		</c:forEach>
	</table>
</div>

<!-- 블록페이지 시작2  -->
<div class="text-center">
 <ul class="pagination justify-content-center">
  <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="PdsList.pds?part=${part}&pageSize=${pageSize}&pag=1">첫페이지</a></li></c:if>
  <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="PdsList.pds?part=${part}&pageSize=${pageSize}&pag=${(curBlock-1)*blockSize +3}">이전블록</a></li></c:if>
  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-dark border-secondary" href="PdsList.pds?part=${part}&pageSize=${pageSize}&pag=${i}"><font color="white"><b>${i}</b></font></a></li></c:if>
    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="PdsList.pds?part=${part}&pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
  </c:forEach>
 	<c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="PdsList.pds?part=${part}&pageSize=${pageSize}&pag=${(curBlock+1)*blockSize +1}">다음블록</a></li></c:if>
 	<c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="PdsList.pds?part=${part}&pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li></c:if>
  </ul>
</div>	
<!-- 블록페이지 시작2  -->


<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>