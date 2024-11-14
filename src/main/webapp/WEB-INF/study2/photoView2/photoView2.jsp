<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>photoView2.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <script>
  	'use strist';
  	
  	// 이미지 여러장 미리보기
  	$(function() {
			$("#fName").on("change", multiImageCheck) //change이벤트 발생하면 함수 호출 multiImageCheck함수를 호출
		});
  	function multiImageCheck(e) {
			let files = e.target.files;
			let filesArr = Array.prototype.slice.call(files);
			//Array배열객체 꺼내옴.파일단위로 잘라서 배열에 담음 prototype:가져온 객체의 속성
			
			filesArr.forEach(function(f){
				if(!f.type.match("image.*")) {//이미지로파일에 있는 모든 파일을 검색해서 파일이 같지 않으면
				}
			});
			
			//멀티파일 이미지 미리보기
			let i = e.target.files.length; //e.target:특정 차일 가져오기
			for(let image of e.target.files) {
				let img = document.createElement("img"); //이미지 태그 생성=DOM객체. 파일리더 객체가 제어
				let reader = new FileReader();
				reader.onload = function (e) {
					img.setAttribute("src", e.target.result); //이미지속성 만들기
					img.setAttribute("width", 200) //크기 조절 px안 씀
				}
				reader.readAsDataURL(e.target.files[--i]); //마지막부터 하나씩 인덱스가 줄어들면서 꺼냄
				document.querySelector(".imgDemo").appendChild(img);
			}
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
	<h2>업로드 사진 미리보기2</h2>
	<form name="myform" id="myform" method="post" action="PhotoView2Ok.st" enctype="multipart/form-data">
		<div>
			<input type="file" name="fName" id="fName" multiple class="form-control-file border mb-2"/>
			<img id="demo" width="150" />
		</div>
		<div class="imgDemo"></div>
		<div>
			사진 설명
			<textarea rows="4" name="content" id="content" class="form-control mb-4" placeholder="사진 설명을 입력하세요"></textarea>
				<div class="row">
					<div class="col"><input type="button" value="저장(일반)" onclick="fCheck1()" class="btn btn-success mb-2"></div>
					<div class="col"><input type="button" value="저장(ajax)" onclick="fCheck2()" class="btn btn-secondary mb-2"></div>
					<div class="col"><input type="button" value="다시선택" onclick="location.reload()" class="btn btn-warning mb-2"></div>
					<div class="col"><input type="button" value="싱글파일저장" onclick="location.href='PhotoView2.st'" class="btn btn-primary mb-2"></div>
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