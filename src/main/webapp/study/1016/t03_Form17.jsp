<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t03_Form.jsp.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		'use strict';
		
		function fCheck(flag) {
			myform.flag.value = flag; /* flag라는 hidden함수에 값을 전달 */
			myform.submit();
		}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>폼태그를 이용한 값의 전달연습</h2>
	<hr/>
	<form name="myform" method="post" action="<%=request.getContextPath()%>/1016/T03Ok17">
	<!-- /1016/T03Ok17는 경로명(maapping)임. 파일명과 경로명은 원래 달라야 함 -->
		<div class="mb-3">성명
			<input type="text" name="name" value="홍길동" class="form-control mb-3" autofocus required placeholder="성명을 입력하세요" />
		</div>
		<div class="mb-3">나이
			<input type="number" name="age" value="23" class="form-control mb-3" />
		</div>
		<div class="mb-3">성별 &nbsp;&nbsp;
			<input type="radio" name="gender" value="남자" checked />남자&nbsp;&nbsp;
			<input type="radio" name="gender" value="여자" />여자
		</div>
		<div class="mb-3">취미 &nbsp;&nbsp;
			<input type="checkbox" name="hobby" value="등산" checked />등산 &nbsp;
			<input type="checkbox" name="hobby" value="낚시" checked />낚시 &nbsp;
			<input type="checkbox" name="hobby" value="수영" checked />수영 &nbsp;
			<input type="checkbox" name="hobby" value="배드민턴" checked />배드민턴 &nbsp;
			<input type="checkbox" name="hobby" value="바이크" checked />바이크 &nbsp;
			<input type="checkbox" name="hobby" value="바둑" checked />바둑 &nbsp;
		</div>
		<div class="mb-3">직업
			<select name="job" id="job">
				<option value="">선택</option>				
				<option>회사원</option>				
				<option>공무원</option>				
				<option>학생</option>				
				<option>군인</option>				
				<option>자영업</option>				
				<option>기타</option>				
			</select>
		</div>
		<div class="mb-3">가본 산
			<select name="mountain" id="mountain" size="5" multiple>
				<option>한라산</option>				
				<option>태백산</option>				
				<option>소백산</option>				
				<option>우암산</option>				
				<option>속리산</option>				
				<option>대둔산</option>				
				<option>북한산</option>				
			</select>
		</div>
		<div class="mb-3">자기소개
			<textarea rows="6" name="content" id="content" class="form-control"></textarea>
		</div>
		<div class="mb-3">첨부파일
		 <input type="file" name=fname id="fname" class="form-control-file border">
		</div>
		<div>
			<input type="button" value="전송" onclick='fCheck(1)' class="form-control btn-success" />
			<!-- 전송방식 2가지 모두 암기 필수 둘 다 많이 씀
			 	전제조건 : get/post방식은 클라이언트(.jsp)->서버(서블릿) 프론트사용
			 					서버->클라이언트 전송 : sendRidirect,dispatcher 가 있고, 변수에 담아서 전달
				1. sendRidirect는 get방식=url에 담음 / location.href와 같음=get방식을 사용함
				2. dispatcher는 post는 아니지만 비슷함. 대용량 전송가능
			-->
			<input type="button" value="전송" onclick='fCheck(2)' class="form-control btn-success" /><!-- sendRidirect -->
			<input type="button" value="전송" onclick='fCheck(3)' class="form-control btn-success" /><!-- dispatcher -->
		</div>
		<input type="hidden" name="flag"><!-- 사용자=화면엔 안 보임. 관리자만 확인 가능한 자료. -->
	</form>
</div>
<p><br/></p>
</body>
</html>