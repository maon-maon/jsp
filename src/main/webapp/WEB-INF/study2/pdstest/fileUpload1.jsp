<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>fileUpload1.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <script>
  	'use strict';
  	
  	function fCheck() {
		//유효성검사 필수. exe파일은 다운과 동시에 실행. 판드시 걸러야 함. 
			let fName = document.getElementById("file").value; 
			let maxSize = 1024 * 1024 * 10; 	// 저장파일 최대용량을 10MByte까지로 제한  // 사이즈 지정필수, 
			let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase(); // 올리는 파일의 확장자를 검색
			
			// 올린거 먼저 체크한 다음에 파일 진행해야 오류가 없음
			if(fName.trim() == "") {
	    		alert("업로드할 파일을 선택하세요");
	    		return false;
	    	}
			
			let fileSize = document.getElementById("file").files[0].size; //파일의 속성을 가져와야 함.여러개일수 있음=배열:명령어=file[0].size 
			if(fileSize > maxSize) {
    		alert("업로드할 파일의 최대용량은 10MByte 입니다.");
    	}
    	else if(ext != 'jpg' && ext != 'gif' && ext != 'png' && ext != 'hwp' && ext != 'zip' && ext != 'ppt' 
    			&& ext != 'pptx' && ext != 'xlsx' && ext != 'txt' && ext != 'doc' && ext != 'mp4') {
    		alert("업로드 가능한 파일은 'jpg/gif/png/hwp/zip/ppt/pptx/xlsx/txt/doc'만 가능합니다.")
    	}
    	else {
    		myform.submit();
    	}
		}
  </script>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>파일 업로드 연습 (싱글파일처리)</h2>
	<hr/>
	<form name="myform" method="post" action="FileUpload1Ok.st" enctype="multipart/form-data"> 
	<!-- enctype:파일사용시 무조건 필요 : enctype="multipart/form-data"예약어임 -->
	<!-- http통신(헤더를통해) 가지만 multipart객체가 받아줌 -->
	<!-- 외부서버접속시 저장소 필요 -->
		파일명:
		<input type="file" name="fName" id="file" class="form-control-file mb-2" />
		<input type="button" value="파일전송" onclick="fCheck()" class="btn btn-success form-control mb-2">
		<input type="hidden" name="nickName" value="${sNickName}"> <!-- 가입시폼에 이 부분이 있어야함 -->
	</form>
	<hr/>
	<div class="row">
		<div class="col"><a href="FileDownload.st" class="btn btn-outline-dark">다운로드폴더 이동</a></div>
		<div class="col"><a href="FileUpload.st" class="btn btn-warning">돌아가기</a></div>
	</div>	
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>