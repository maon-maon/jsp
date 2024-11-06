<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>boardList(admin).jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
<script>
	'use strict';
	
	function pageSizeCheck() {
		let pageSize = document.getElementById("pageSize").value;
		location.href = "BoardList.ad?pag=1&pageSize="+pageSize;
	}
	
	function cursorMove() {
		document.getElementById("searchString").focus();
	}
	
	function contentView(content) {
    $("#myModal #modalContent").html(content);
  }
	
	// 전체선택
	function allCheck() {
		for(let i=0; i<myForm.idxFlag.length; i++) {
			myForm.idxFlag[i].checked = true;
		}
	}
	
	// 전체해제
	function allReset() {
		for(let i=0; i<myForm.idxFlag.length; i++) {
			myForm.idxFlag[i].checked = false;
		}
	}
	
	// 선택반전
	function reverseCheck() {
		for(let i=0; i<myForm.idxFlag.length; i++) {
			myForm.idxFlag[i].checked = !myForm.idxFlag[i].checked;
    	}
	}
	
	// 선택항목삭제
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
			url : "BoardSelectDelete.ad",
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
	<h2 class="text-center">게 시 판 리 스 트</h2>
	<table class="table table-boderless">
		<tr>
			<td class="text-left">
				<input type="button" value="전체선택" onclick="allCheck()" class="btn btn-success btn-sm mr-1">
				<input type="button" value="전체취소" onclick="allReset()" class="btn btn-primary btn-sm mr-1">
				<input type="button" value="선택반전" onclick="reverseCheck()" class="btn btn-warning btn-sm mr-1">
				<input type="button" value="선택항목삭제" onclick="selectDeleteCheck()" class="btn btn-danger btn-sm mr-1">
			</td>
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
	
	<form name="myForm">
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
				<tr>
					<td><input type="checkbox" name="idxFlag" id="idxFlag${vo.idx}" value="${vo.idx}"/> ${curScrStartNo}(${vo.idx})</td>
					<td class="text-left">
						<c:if test="${vo.claim == 'NO' || sMid == vo.mid || sLevel == 0}"><a href="BoardContent.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}">${vo.title}</c:if> 
						<c:if test="${vo.claim != 'NO' && sMid == vo.mid && sLevel == 0}"><a href="javascript:alert('신고된 글입니다');">${vo.title}</c:if> 
						<%-- <c:if test="${vo.date_diff == 0}"><img src="${ctp}/images/new.gif" /></c:if> --%>
						<c:if test="${vo.time_diff <= 24}"><img src="${ctp}/images/new.gif" /></c:if>
						<c:if test="${vo.replyCnt != 0}">(${vo.replyCnt})</c:if>
					</td>
					<td><a href="#" onclick='contentView("${vo.content}")' data-toggle="modal" data-target="#myModal">${vo.nickName}</a></td>
					<%-- <td><a href="#">${vo.nickName}</a></td> --%>
					<td>
					 ${vo.time_diff > 24 ? fn:substring(vo.wDate,0,10) : vo.date_diff == 0 ? fn:substring(vo.wDate,11,19) : fn:substring(vo.wDate,0,19)}
					</td> 
					<td>
						<c:if test="${vo.good < 20 && vo.good >= 0}">${vo.readNum}(${vo.good})</c:if>
						<c:if test="${vo.good >= 20}">${vo.readNum}(<font color="red">${vo.good}</font>)</c:if>
						<c:if test="${vo.good < 0}">${vo.readNum}(<font color="blue">${vo.good}</font>)</c:if>
					</td>
				</tr>
			<c:set var="curScrStartNo" value="${curScrStartNo -1}"/>
			</c:forEach>
			
			<tr><td colspan="5" class="p-0 m-0"></td></tr>
		</table>
	</form>
	<br/>
</div>
	
	<!-- 페이징처리 -->
	<div class="text-center">
		<ul class="pagination justify-content-center">
	  <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="BoardList.ad?pageSize=${pageSize}&pag=1">첫페이지</a></li></c:if>
	  <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="BoardList.ad?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize +3}">이전블록</a></li></c:if>
	  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
	    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-dark border-secondary" href="BoardList.ad?pageSize=${pageSize}&pag=${i}"><font color="white"><b>${i}</b></font></a></li></c:if>
	    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="BoardList.ad?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
	  </c:forEach>
	 	<c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="BoardList.ad?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize +1}">다음블록</a></li></c:if>
	 	<c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="BoardList.ad?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li></c:if>
	  </ul>
	</div>
<!-- 블럭페이지 끝 -->
<br/>	
<!-- 검색기 시작 -->
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
	
	
<!-- The Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title">글내용</h3>
        <button type="button" class="close" data-dismiss="modal">×</button>
      </div>
      <div class="modal-body">
        <span id="modalContent"></span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- The Modal -->

	
	
<p><br/></p>
</body>
</html>