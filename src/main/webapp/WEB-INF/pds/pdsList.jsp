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
			alert("partChecklet part   "+part);
			if(part != '') location.href = "PdsSearchList.pds?part="+part;
			if(part == '전체') location.href = "PdsList.pds";
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
			<td><a href="PdsInput.pds" class="btn btn-secondary btn-sm">자료올리기</a></td>
			<td class="text-right">
				<form name="partform">
					<select name="part" id="part" onchange="partCheck()"> <!-- 테이블로 유동적으로 처리가능 -->
						<option ${part == '' ? 'selected' : '' } >전체</option>
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
      <th>자료제목</th>
      <th>올린이</th>
      <th>올린날짜</th>
      <th>분류</th>
      <th>파일명(크기)</th>
      <th>다운수</th>
      <th>비고</th>
		</tr>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr> <!-- 일괄저장=압축파일 -->
				<td>${vo.idx}</td>
				<td>
					<a href="PdsContent.pds?idx=${vo.idx}&part=${part}">${vo.title}</a>
				</td><!-- 24시간new 1,2,3처리 -->
				<td>${vo.nickName}</td>
				<td>${fn:substring(vo.fDate, 0,19)}</td>
				<td>${vo.part}</td>
				<!-- <td>${vo.fName}/(${vo.fSize})</td> -->
				<td>
					<c:set var="fNames" value="${fn:split(vo.fName, '/')}"/>
					<c:set var="fSNames" value="${fn:split(vo.fSName, '/')}"/>
					<c:forEach var="fName" items="${fNames}" varStatus="st">
						<a href="${ctp}/images/pds/${fSNames[st.index]}" download="${fName}" onclick="downNumCheck(${vo.idx})" >${fName}</a><br/>
					</c:forEach>
						(<fmt:formatNumber value="${vo.fSize/1024}" pattern="#,##0" /> KByte)
				</td>
				<td>${vo.downNum}</td >
				<td>
					<c:if test="${vo.mid == sMid || sLevel == 0}">
						<a href="javascript:pdsDeleteCheck('${vo.idx}','${vo.fSName}')" class="badge badge-danger">삭제</a><br/>
					</c:if>
					<a href="PdsTotalDown.pds" class="badge badge-primary">전체다운로드</a><br/>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>