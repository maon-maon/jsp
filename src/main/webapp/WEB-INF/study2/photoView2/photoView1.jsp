<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>photoView1.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <script>
  	'use strist';
  	
  	//이미지 미리보기
  	function imgCheck(input) {
			/* if(input.files) { */
			/* if(input.files[0]) { */
			if(input.files && input.files[0]) {
				//파일리더클래스 : 외부에서 들어오는 객체의 껍데기 생성
				let reader = new FileReader();
				reader.onload = function(e) { //콜백으로 확인 여기서 감ㄱ지되는 내용을
					document.getElementById("demo").src = 	e.target.result; //확인되는 감지대상의 결과를 이미지 속성으로 넘김
				}
				reader.readAsDataURL(input.files[0]) //리더가 임시공간 위치에서 데이터 읽어옴. ㅇ리더기가 감해서 위에 demo에 넣어줌
			}
			else document.getElementById("demo").src = "";
		}
  	
  	
  	//이미지 일반저장하기
  	function fCheck1() {
			let fName = document.getElementById("fName").value; 
			let maxSize = 1024 * 1024 * 10; 	// 저장파일 최대용량을 10MByte까지로 제한  // 사이즈 지정필수, 
			let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase(); // 올리는 파일의 확장자를 검색
			
			// 올린거 먼저 체크한 다음에 파일 진행해야 오류가 없음
			if(fName.trim() == "") {
	    		alert("업로드할 파일을 선택하세요");
	    		return false;
	    	}
			
			let fileSize = document.getElementById("fName").files[0].size; //파일의 속성을 가져와야 함.여러개일수 있음=배열:명령어=file[0].size 
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
  	
  	//이미지 AJAX저장하기
  	function fCheck2() {
			let fName = document.getElementById("fName").value; 
			let maxSize = 1024 * 1024 * 10; 	// 저장파일 최대용량을 10MByte까지로 제한  // 사이즈 지정필수, 
			let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase(); // 올리는 파일의 확장자를 검색
			
			// 올린거 먼저 체크한 다음에 파일 진행해야 오류가 없음
			if(fName.trim() == "") {
	    		alert("업로드할 파일을 선택하세요");
	    		return false;
	    	}
			
			let fileSize = document.getElementById("fName").files[0].size; //파일의 속성을 가져와야 함.여러개일수 있음=배열:명령어=file[0].size 
			if(fileSize > maxSize) {
    		alert("업로드할 파일의 최대용량은 10MByte 입니다.");
    		return false;
    	}
    	else if(ext != 'jpg' && ext != 'gif' && ext != 'png' && ext != 'hwp' && ext != 'zip' && ext != 'ppt' 
    			&& ext != 'pptx' && ext != 'xlsx' && ext != 'txt' && ext != 'doc' && ext != 'mp4') {
    		alert("업로드 가능한 파일은 'jpg/gif/png/hwp/zip/ppt/pptx/xlsx/txt/doc'만 가능합니다.")
    		return false;
    	}
			
			let query = new FormData(myform); //form에 있는 데이터를 모두 받아주는 객체사용해서 한번에 넘김
			
			$.ajax({
				type : "post",
				url : "PhotoViewAjax", //ajax는 확장자패턴 사용할 수 없음
				enctype : "multipart/form-data", //데이터는 필수로 적어야 함
				data : query,
				processData : false, //false=편집없이 있는그대로 바이너리타입으로 전송. FormData 사용시 데이터처리 헤더의 명령 필수로 적어야 함
				contentType : false, //false=윈도우의 내용 기본타입으로 전송됨
				/*cache : false,
				timeout : 6000 */  //일정시간 넘어가면 전송 차단
				success: function(res) {
					if(res != "0") {
						alert("파일 업로드 성공");
						let str = "서버에 저장된 파일명 "+res; 
						$("#ajaxDemo").html(str);
					}
					else alert("파일 업로드 실패");
				} ,
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
	<h2>업로드 사진 미리보기1</h2>
	<form name="myform" id="myform" method="post" action="PhotoView1Ok.st" enctype="multipart/form-data">
		<div>
			<input type="file" name="fName" id="fName" onchange="imgCheck(this)" class="form-control-file border mb-2"/>
			<img id="demo" width="150" />
		</div>
		<div>
			사진 설명
			<textarea rows="4" name="content" id="content" class="form-control mb-4" placeholder="사진 설명을 입력하세요"></textarea>
				<div class="row">
					<div class="col"><input type="button" value="저장(일반)" onclick="fCheck1()" class="btn btn-success mb-2"></div>
					<div class="col"><input type="button" value="저장(ajax)" onclick="fCheck2()" class="btn btn-secondary mb-2"></div>
					<div class="col"><input type="button" value="다시선택" onclick="location.reload()" class="btn btn-warning mb-2"></div>
					<div class="col"><input type="button" value="다중파일저장" onclick="location.href='PhotoView2.st'" class="btn btn-primary mb-2"></div>
					<div class="col"><input type="button" value="업로드 사진보기" onclick="location.href='PhotoStorageList.st'" class="btn btn-outline-dark mb-2"></div>
				</div>
		</div>
	</form>
	<hr/>
	<div id="ajaxDemo"></div>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>