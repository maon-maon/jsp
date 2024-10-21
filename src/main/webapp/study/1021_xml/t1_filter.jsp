<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t1_filter.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <script>
  	'ust strict';
  	
  	function fCheck(flag) {
			if(flag == 'OK') myform.action = "${ctp}/1021/T1_filterOk1";
			else myform.action = "${ctp}/1021/T1_filterOk2";
			myform.submit();
		}
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>Filter한글처리 연습</h2>
	<form name="myform" method="post" action="">
		<div><input type="text" name="content" value="간단한 소개글입니다." class="form-control" /></div>
		<div><textarea rows="5" name="introduce" class="form-control">자기소개 작성...</textarea></div>
		<div><input type="button" value="전송1" onclick="fCheck('OK')" class="form-control btn btn-success mb-1"></div>
		<div><input type="button" value="전송2" onclick="fCheck('NO')" class="form-control btn btn-warning mb-1"></div>
	</form>
</div>
<p><br/></p>
</body>
</html>