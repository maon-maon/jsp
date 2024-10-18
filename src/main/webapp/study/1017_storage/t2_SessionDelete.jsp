<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t2_SessionDelete.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <script>
  	'use strict';
  	
  	function sessionDelete() {
  		//let sessionFlag = document.getElementById("sessionFlag").value;
  		let sessionFlag = $("#sessionFlag").val();
  		
  		if(sessionFlag == "") {
				alert("삭제할 세션을 선택하세요");
				//return false; //else랑 공존할 수 없음
			}
  		else {
				location.href = "t2_SessionDeleteOk.jsp?sessionFlag="+sessionFlag;
  		}
		}
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>세션 부분 삭제</h2>
	<hr/>
	<select name="sessionFlag" id="sessionFlag" onchange="sessionDelete()">
		<option value="">선택</option>
		<option value="sMid">아이디</option>
		<option value="sNickName">닉네임</option>
		<option value="sName">성명</option>
	</select>
	<hr/>
	<p><a href="t2_Session.jsp" class="btn btn-info">돌아가기</a></p>
</div>
<p><br/></p>
</body>
</html>