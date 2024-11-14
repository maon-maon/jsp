<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>fileUpload3.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    function fCheck() {
    	let fName = document.getElementById("file").value;
    	let fNames = "";
    	let ext = "";
    	let fileSize = 0;
    	let maxSize = 1024 * 1024 * 20; 	// 저장파일 최대용량을 20MByte까지로 제한
    	
    	//let ext = fName1.substring(fName.lastIndexOf(".")+1).toLowerCase();
    	
    	if(fName.trim() == "") {
    		alert("업로드할 파일을 선택하세요");
    		return false;
    	}
    	
    	let fileLength = document.getElementById("file").files.length;	// 선택(업로드)한 파일의 개수
    	for(let i=0; i<fileLength; i++) {
    		fileSize += document.getElementById("file").files[i].size;
    		fName = document.getElementById("file").files[i].name;
    		ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
    		if(ext != 'jpg' && ext != 'gif' && ext != 'png' && ext != 'hwp' && ext != 'zip' && ext != 'ppt' && ext != 'pptx' && ext != 'xlsx' && ext != 'txt' && ext != 'doc') {
      		alert("업로드 가능한 파일은 'jpg/gif/png/hwp/zip/ppt/pptx/xlsx/txt/doc'만 가능합니다.")
      		return false;
      	}
    		fNames += fName + "/";
    	}

    	if(fileSize > maxSize) {
    		alert("업로드할 전체 파일의 최대용량은 20MByte 입니다.");
    	}
    	else {
    		document.getElementById("fNames").value = fNames;
    		myform.submit();
    	}
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>파일 업로드 연습(멀티파일처리)</h2>
  <hr/>
  <form name="myform" method="post" action="FileUpload3Ok.st" enctype="multipart/form-data">
    파일명 :
    <input type="file" name="fName" id="file" multiple class="form-control-file border mb-2" />
    <input type="button" value="파일전송" onclick="fCheck()" class="btn btn-success form-control"/>
    <input type="hidden" name="nickName" value="${sNickName}" />
    <input type="hidden" name="fNames" id="fNames" />
  </form>
  <hr/>
  <div class="row">
    <div class="col"><a href="FileDownload.st" class="btn btn-primary form-control">다운로드폴더로 이동하기</a></div>
    <div class="col"><a href="FileUpload.st" class="btn btn-warning form-control">돌아가기</a></div>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>