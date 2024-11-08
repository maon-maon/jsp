<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>PdsInput.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
	<script>
		'use strict';
		
		// 파일 박스 추가하기
		let cnt = 1;
		function fileBoxAppend() {
			cnt++;
			let fileBox = '';
			fileBox += '<div id="fBox'+cnt+'">';
			fileBox += '<input type="file" name="fName'+cnt+'" id="fName'+cnt+'" class="form-control-file mb-2" style="float:left; width:85%;" />';
			fileBox += '<input type="button" value="삭제" onclick="deleteBox('+cnt+')" class="btn btn-danger mb-2 ml-2" style="width:10%;" />';
			fileBox += '</div>';
			$("#fileBox").append(fileBox);
		}
		// 파일박스 삭제처리
		function deleteBox(cnt) {
			$("#fBox"+cnt).remove();
		}
		
		function fCheck() {
    	let fName1 = document.getElementById("file").value;
    	//let ext1 = fName1.substring(fName1.lastIndexOf(".")+1).toLowerCase();
    	let maxSize = 1024 * 1024 * 30; 	// 저장파일 최대용량을 10MByte까지로 제한
    	let title = $("#title").val();
    	
    	if(fName1.trim() == "") {
    		alert("업로드할 파일을 선택하세요");
    		return false;
    	}
    	else if(title.trim() == ""){
    		alert("제목을 입력하세요");
    		return false;
			}
    	
    	//let fileSize = document.getElementById("file1").files[0].size;
    	let fileSize = 0;
    	for(let i=1; i<=cnt; i++) {
				let imsiFile = "file"+i;
				if(isNaN(document.getElementById(imsiFile))) { /* 숫자여부 판단 */
    			let fName = document.getElementById(imsiFile).value;
    			if(fName !="") { //공백이 아닐때 처리
	    			fileSize += document.getElementById(imsiFile).files[0].size;
	    			let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
	    			alert(fName+" : "+ext);
	    			if(ext != 'jpg' && ext != 'gif' && ext != 'png' && ext != 'hwp' && ext != 'zip' && ext != 'ppt' && ext != 'pptx' && ext != 'xlsx' && ext != 'txt' && ext != 'doc') {
	      			alert("업로드 가능한 파일은 'jpg/gif/png/hwp/zip/ppt/pptx/xlsx/txt/doc'만 가능합니다.")
	      			return false;
	      		}
    			}
				}
    	}
    	
    	if(fileSize > maxSize) {
    		alert("업로드할 파일의 총용량은 30MByte 이하 입니다.");
    	}
    	else {
    		myform.fSize.value = fileSize;
    		myform.submit();
    	}
		}
	</script>
	<style>
		th {
			text-align: center;
			background-color: #e5e5e5;
		}
	</style>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>자 료 올 리 기</h2>
	<form name="myform" method="post" action="PdsInputOk.pds" enctype="multipart/form-data">
		<table class="table table-bordered">
			<tr>
				<th>분류</th>
				<td>
					<select name="part" id="part" class="form-control"> 
							<option>학습</option>
							<option>여행</option>
							<option>음식</option>
							<option>기타</option>
						</select>
				</td>
			</tr>
			<tr>
				<th>자료파일</th>
				<td>
					<div class="input-group">
						<input type="file" name="fName" id="fName" class="form-control-file border mb-2"/>
						<div class="input-group-append">
							<input type="button" value="파일박스추가" onclick="fileBoxAppend()" class="btn btn-dark btn-sm">
						</div>
					</div>
					<div id="fileBox"></div>
				</td>
			</tr>
			<tr>
				<th>올린이</th>
				<td>${sNickName}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" id="title" required placeholder="제목입력" class="form-control" /></td>
			</tr>
			<tr>
				<th>상세내역</th>
				<td><textarea rows="4" name="content" id="content"  placeholder="내용입력" class="form-control" ></textarea></td>
			</tr>
			<tr >
	      <th >공개여부</th>
	      <td>
	        <input type="radio" name="openSw" id="openSw1" value="공개" class="mr-1" ${vo.openSw =='공개' ? 'checked' : ''} /><label for="openSw1">공개</label> &nbsp;&nbsp;
	        <input type="radio" name="openSw" id="openSw2" value="비공개" class="mr-1" ${vo.openSw =='비공개' ? 'checked' : ''} /><label for="openSw2">비공개</label>
	      </td>
			</tr>
			<tr>
				<td colspan="2" class="text-center" >
					<input type="button" value="자료올리기" onclick="fCheck()" class="btn btn-success" />
					<input type="reset" value="다시쓰기"  class="btn btn-success" />
					<input type="button" value="돌아가기" onclick="location.href='${ctp}/PdsList.pds'" class="btn btn-success" />
				</td>
			</tr>
		</table>
		<input type="hidden" name="mid" value="${sMid}"/>
    <input type="hidden" name="nickName" value="${sNickName}"/>
    <input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}"/>
    <input type="hidden" name="fSize" />
	</form>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>