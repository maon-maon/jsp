<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <script>
  	'use strict';
  	
  	function imgPrtBtn() {
			let choice = myform.imgPrt.value;
  		demo.innerHTML = "<img src='<%=request.getContextPath() %>/images/"+choice+".jpg' width='400px' />";
		}
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
	<pre>
		콤보상자에 출력할 그림파일명을 보여주고, 그 그림파일명을 선택하면
		demo레이어에 선택된 그림파일을 출력해 주시오.
	</pre>
	<hr/>
	<h2>이미지 출력</h2>
	<form name="myform" method="post" action="<%=request.getContextPath()%>/1016/T05_imgTestOK">
		<div class="input-group">
  	  <div class="input-group-prepend mr-3">
				<select name="imgPrt" id="imgPrt">
					<option value="">선택</option>
					<option value="245">1번 이미지</option>
					<option value="246">2번 이미지</option>
					<option value="247">3번 이미지</option>
					<option value="248">4번 이미지</option>
					<option value="249">5번 이미지</option>
				</select>
			</div>
			<div>
				<input type="button" value="출력" onclick="imgPrtBtn()" class="btn btn-dark"/>
			</div>
		</div>
	</form>
</div>
<hr/>
<div class="text-center" id=demo></div>
<p><br/></p>
</body>
</html>