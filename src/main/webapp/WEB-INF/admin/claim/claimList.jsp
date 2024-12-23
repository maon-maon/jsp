<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>claimList.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
<script>
	'use strict';
	
	function claimViewCheck(flag, partIdx) {
		$.ajax({
			type : "post",
			url : "ClaimViewCheck.ad",
			data : {
				flag : flag,
				idx : partIdx
			},
			success: function(res) {
			//alert("claimViewCheck res: "+res);
				if(res != "0") {
					if(flag=="NO") alert("게시글을 표시합니다.");
					else alert("게시글을 감춥니다.");
					location.reload();
				}
				else alert("작업실패");
			},
			error: function() {
				alert("전송오류");
			}
		});
	}
	
	// 신고글 삭제처리
	function claimDeleteOk(part, partIdx) {
		let ans = confirm("신고글 삭제할까요?");
		if(!ans) return false;
		//alert("claimDeleteOk part:partIdx "+part+":"+partIdx);
		$.ajax({
			type : "post",
			url : "ClaimDeleteOk.ad",
			data : {
				part : part,
				idx : partIdx
			},
			success: function(res) {
				if(res != 0) {
					alert("신고글 삭제 완료");
					location.reload();
				}
				else alert("신고글 삭제 실패");
			},
			error: function() {
				alert("전송오류");
			}
		});
	}
	
	// 사용자 페이지 설정
	function pageSizeCheck() {
		let pageSize = document.getElementById("pageSize").value;
		location.href="ClaimList.ad?pag=1&pageSize="+pageSize;
	}
	
	// 검색기 
	function cursorMove() {
		document.getElementById("searchString").focus();
	}
	
	//전체선택
	function allCheck() {
		for(let i=0; i<myForm.idxFlag.length; i++) {
			myForm.idxFlag[i].checked = true;
		}
	}
	//전체취소
	function allReset() {
		for(let i=0; i<myForm.idxFlag.length; i++) {
			myForm.idxFlag[i].checked = false;
		}
	}
	//선택반전
	function reverseCheck() {
		for(let i=0; i<myForm.idxFlag.length; i++) {
			myForm.idxFlag[i].checked = !myForm.idxFlag[i].checked;
		}
	}
	//선택항목삭제
	function selectDeleteCheck() {
		let idxSelectArray = "";
		
		for(let i=0; i<myForm.idxFlag.length; i++) {
			if(myForm.idxFlag[i].checked) idxSelectArray += myForm.idxFlag[i].value + "/";
		}
		idxSelectArray = idxSelectArray.substring(0,idxSelectArray.length-1);
		
		if(idxSelectArray == "") {
  		alert("삭제할 게시물을 선택하세요");
  		return false;
  	}
  	let ans= confirm("정말 삭제하시겠습니까?");
  	if(!ans) return false;
		
		$.ajax({
			type : "post",
			url : "ClaimSelectDelete.ad",
			data : {idxSelectArray : idxSelectArray},
			success: function(res) {
				if(res != '0') {
					alert("삭제 처리 완료");
					location.reload()
				}
				else alert("삭제 처리 실패");
			},
			error: function() {
				alert("전송오류");
			}
		});
	}
	
	
	
	
</script>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
	<h2>신 고 리 스 트</h2>
	<table class="table table-borderless">
		<tr class="text-right">
			<td class="text-left">
				<input type="button" value="전체선택" onclick="allCheck()" class="btn btn-success btn-sm mr-1">
				<input type="button" value="전체취소" onclick="allReset()" class="btn btn-primary btn-sm mr-1">
				<input type="button" value="선택반전" onclick="reverseCheck()" class="btn btn-warning btn-sm mr-1">
				<input type="button" value="선택항목삭제" onclick="selectDeleteCheck()" class="btn btn-danger btn-sm mr-1">
			</td>
			<td> 
				<select name="pageSize" id="pageSize" onchange="pageSizeCheck()">
					<option value="3" <c:if test="${pageSize == 3}">selected</c:if> >3</option>
					<option value="5" <c:if test="${pageSize == 5}">selected</c:if> >5</option>
					<option value="10" <c:if test="${pageSize == 10}">selected</c:if> >10</option>
					<option value="15" <c:if test="${pageSize == 15}">selected</c:if> >15</option>
					<option value="20" <c:if test="${pageSize == 20}">selected</c:if> >20</option>
					<option value="30" <c:if test="${pageSize == 30}">selected</c:if> >30</option>
				</select>
			</td>
		</tr>	
	</table>
	
	
<form name="myForm">	
	<table class="table tqble-hover text-center">
		<tr class="table-info">
			<th>번 호</th>
			<th>분 류</th>
			<th>글제목</th>
			<th>작성자</th>
			<th>신고자</th>
			<th>신고내역</th>
			<th>신고일</th>
			<th>처리결과</th>
		</tr>
		<c:set var="curScrStartNo" value="${curScrStartNo}"/>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<%-- <td>${st.count}</td> --%>
				<td><input type="checkbox" name="idxFlag" id="idxFlag${vo.idx}" value="${vo.idx}" />  ${curScrStartNo}</td>
				<td>${vo.part}</td>
				<td>${vo.title}</td>
				<td>${vo.mid}</td>
				<td>${vo.claimMid}</td>
				<td>${vo.claimContent}</td>
				<td>${fn:substring(vo.claimDate, 0, 19)}</td>
				<td>
					<a href="javascript:claimDeleteOk('${vo.part}','${vo.partIdx}')" class="badge badge-danger">삭제</a>
					<c:if test="${vo.claim == 'OK'}"><a href="javascript:claimViewCheck('NO','${vo.partIdx}')" class="badge badge-warning">신고글표시</a></c:if>
					<c:if test="${vo.claim != 'OK'}"><a href="javascript:claimViewCheck('OK','${vo.partIdx}')" class="badge badge-warning">신고글감추기</a></c:if>
				</td>
			</tr>
		<c:set var="curScrStartNo" value="${curScrStartNo -1}"/>
		</c:forEach>
		<tr><td colspan="8" class="m-0 p-0"></td></tr>
	</table>
</form>
<br/>
	
	<!-- 블록페이지 시작2  -->
	<div class="text-center">
	 <ul class="pagination justify-content-center">
	  <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="ClaimList.ad?pageSize=${pageSize}&pag=1">첫페이지</a></li></c:if>
	  <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="ClaimList.ad?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize +3}">이전블록</a></li></c:if>
	  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
	    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-dark border-secondary" href="ClaimList.ad?pageSize=${pageSize}&pag=${i}"><font color="white"><b>${i}</b></font></a></li></c:if>
	    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="ClaimList.ad?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
	  </c:forEach>
	 	<c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="ClaimList.ad?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize +1}">다음블록</a></li></c:if>
	 	<c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="ClaimList.ad?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li></c:if>
	  </ul>
	</div>
	<!-- 블록페이지 끝2  -->
	
	<!-- 검색기 시작: 미완성 -->
	<div class="container">
		<form name="searchForm" method="post" action="BoardSearchList.bo" onchange="cursorMove()">
			<b>검색 : </b>
			<select name="search" id="search">
				<option value="title">글제목</option> <!-- dao의 sql문 필드명을 value명으로 사용함 -->
				<option value="nickName">작성자</option>
				<option value="content">글내용</option>
			</select>
			<input type="text" name="searchString" id="searchString"  required />
			<input type="submit" value="검색" class="btn btn-outline-secondary btn-sm" />
		</form>
	</div>	
	<!--  -->	
	
</div>
<p><br/></p>
</body>
</html>