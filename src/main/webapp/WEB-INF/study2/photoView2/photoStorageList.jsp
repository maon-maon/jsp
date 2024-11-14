<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>photoStorageList.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <script>
  
	// 전체선택
	function allCheck() {
		for(let i=0; i<myform.fileFlag.length; i++) {
			myform.fileFlag[i].checked = true;
		}
	}
	
	// 전체해제
	function allReset() {
		for(let i=0; i<myform.fileFlag.length; i++) {
			myform.fileFlag[i].checked = false;
		}
	}
	
	// 선택반전
	function reverseCheck() {
		for(let i=0; i<myform.fileFlag.length; i++) {
			myform.fileFlag[i].checked = !myform.fileFlag[i].checked;
  	}
	}

	// 한개 파일 삭제 처리
	function fileDelete(fileName) {
		let ans = confirm("파일을 삭제하시겠습니까?");
		if(!ans) return false;
		
		$.ajax({
			type : "post",
			url : "PhotoViewDelete.st",
			data : {
				flag : "s",
				fileName : fileName
			},
			success: function(res) {
				if(res != "0") {
					alert("삭제완료");
					location.reload();
				}
				else alert("파일이 존재하지 않습니다");
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
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>저장된 파일 정보</h2>
	<hr/>
	<div class="row">
		<div class="col"><a href="FileUpload.st" class="btn btn-warning">돌아가기</a></div>
		<div class="col"><input type="button" value="전체선택" onclick="allCheck()" class="btn btn-success btn-sm mr-1"></div>
		<div class="col"><input type="button" value="전체취소" onclick="allReset()" class="btn btn-primary btn-sm mr-1"></div>
		<div class="col"><input type="button" value="선택반전" onclick="reverseCheck()" class="btn btn-warning btn-sm mr-1"></div>
		<div class="col"><input type="button" value="선택항목삭제" onclick="selectDeleteCheck()" class="btn btn-danger btn-sm mr-1"></div>
	</div>
	<br/>
	<div>
		<form name="myform">
			<c:forEach var="file" items="${files}" varStatus="st">
				<input type="checkbox" name="fileFlag" id="fileFlag${st.index}" value="file"/>
				${st.count} : <a href="${ctp}/images/photoView/${file}" title="다운로드" download="${file}"> ${file}</a>
				<!-- download="${file}: 다운로드 가능하게 함.+파일 속성을 원래 파일로 해 줌 -->
				<c:set var="fNameArr" value="${fn:split(file,'.')}" />
				<c:set var="extName" value="${fn:toLowerCase(fNameArr[fn:length(fNameArr)-1])}" /> <!-- 확장자 구하기 -->
				<c:if test="${extName == 'zip'}"><font color="blue">압축파일</font></c:if>
				<c:if test="${extName == 'ppt' || extName == 'pptx'}">파워포인트</c:if>
				<c:if test="${extName == 'xlsx'}">엑셀파일</c:if>
				<c:if test="${extName == 'txt'}">텍스트파일</c:if>
				<c:if test="${extName == 'jpg' || extName == 'gif' || extName == 'png'}">
					<img  src="${ctp}/images/photoView/${file}" width="50px" />
				</c:if>
				<a href="javascript:fileDelete('${file}')" class="btn btn-danger btn-sm">삭제</a>
				<a href="javaFileDownload.st?file=${file}" class="btn btn-primary btn-sm ml-3">자바다운로드</a>
				<!-- 바이너리타입으로 전송 -->
				<br/><br/>
			</c:forEach>
		</form>
	</div>
	<hr/>
		<table></table>
		<div></div>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>