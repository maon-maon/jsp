<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t03_Form2.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
  	'use strict';
  	
  	function fCheck(flag) {
			myform.flag.value = flag;
  		myform.submit();
  	}
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>폼태그를 이용한 값의 전달연습</h2>
  <hr/>
  <form name="myform" method="post" action="<%=request.getContextPath()%>/1016/T03Ok2">
  	<div class="input-group mb-3">
  	  <div class="input-group-prepend">
  	    <div class="input-group-text">성명</div>
  	  </div>
  	  <input type="text" name="name" value="홍길동" class="form-control" placeholder="성명을 입력하세요" autofocus required />
  	</div>
  	<div class="input-group mb-3">
  	  <div class="input-group-prepend">
  	  	<div class="input-group-text">나이</div>
  	  </div>
  	  <input type="number" name="age" value="23" class="form-control" />
  	</div>
  	<div class="input-group mb-3 border border-left-0 rounded-left">
  	  <div class="input-group-prepend">
  	    <div class="input-group-text mr-3">성별</div>
  	  </div>
  	  <div class="form-check-inline mr-3">
  	  	<input type="radio" name="gender" value="남자" checked class="mr-1" />남자
  	  </div>
  	  <div class="form-check-inline">
  	  	<input type="radio" name="gender" value="여자" class="mr-1" />여자
  	  </div>
  	</div>
  	<div class="input-group mb-3 border border-left-0 rounded-left">
  	  <div class="input-group-prepend">
  	    <div class="input-group-text mr-3">취미</div>
  	  </div>
  	  <div class="form-check-inline mr-3">
  	  	<input type="checkbox" name="hobby" value="등산" class="mr-1" checked />등산
  	  </div>
  	  <div class="form-check-inline mr-3">
  	  	<input type="checkbox" name="hobby" value="낚시" class="mr-1" />낚시
  	  </div>
  	  <div class="form-check-inline mr-3">
  	  	<input type="checkbox" name="hobby" value="수영" class="mr-1" />수영
  	  </div>
  	  <div class="form-check-inline mr-3">
  	  	<input type="checkbox" name="hobby" value="배드민턴" class="mr-1" />배드민턴
  	  </div>
  	  <div class="form-check-inline mr-3">
  	  	<input type="checkbox" name="hobby" value="바이크" class="mr-1" />바이크
  	  </div>
  	  <div class="form-check-inline">
  	  	<input type="checkbox" name="hobby" value="바둑" class="mr-1" />바둑
  	  </div>
  	</div>
  	<div class="input-group mb-3">
  	  <div class="input-group-prepend">
  	    <div class="input-group-text">현재직업</div>
  	  </div>
  	  <select name="job" id="job" class="form-control">
  	  	<option value="">선택</option>
  	  	<option>회사원</option>
  	  	<option>공무원</option>
  	  	<option>학생</option>
  	  	<option>군인</option>
  	  	<option>자영업</option>
  	  	<option selected>기타</option>
  	  </select>
  	</div>
  	<div class="input-group mb-3">
  	  <div class="input-group-prepend">
  	    <div class="input-group-text">다녀온산</div>
  	  </div>
  	  <select name="mountain" id="mountain" size="5" multiple class="form-control">
  	  	<option>한라산</option>
  	  	<option>태백산</option>
  	  	<option>소백산</option>
  	  	<option>우암산</option>
  	  	<option selected>속리산</option>
  	  	<option>대둔산</option>
  	  	<option>북한산</option>
  	  </select>
  	</div>
  	<div class="input-group mb-3">
  	  <div class="input-group-prepend">
  	    <div class="input-group-text">자기소개</div>
  	  </div>
  	  <textarea rows="6" name="content" id="content" class="form-control">안녕하세요.</textarea>
  	</div>
  	<div class="mb-3">
	  	<input type="file" name="fName" id="fName" class="form-control-file border p-1" />
  	</div>
  	<div class="row">
  	  <div class="col"><input type="button" value="전송1(기본)" onclick="fCheck(1)" class="form-control btn-success" /></div>
  	  <div class="col"><input type="button" value="전송2(response)" onclick="fCheck(2)" class="form-control btn-primary" /></div>
  	  <div class="col"><input type="button" value="전송3(request)" onclick="fCheck(3)" class="form-control btn-info" /></div>
  	</div>
  	<input type="hidden" name="flag" />
  </form>
</div>
<p><br/></p>
</body>
</html>