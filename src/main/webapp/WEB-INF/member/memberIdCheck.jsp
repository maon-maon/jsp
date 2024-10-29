<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberIdCheck.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <script>
  	'use strict';
  	let mid = '${vo.tempMid}';
  	let str = "";
  	
  	$(function() {
	  	if(mid == "") {
	  		str = "<font size='5px'><b>${vo.mid}<b/></font>은/는 사용가능합니다.";
	  	}
	  	else {
	  		str = mid+"는 사용중입니다.";
	  		str += '<form name="childForm" method="post" action="MemberIdCheck.mem">';
	  		str += '아이디 :';
	  		str += '<input type="text" name="mid" autofocus required />';
	  		str += '<input type="submit" value="아이디검색" class="btn btn-secondary" />';
	  		str += '</form>';
			}
	  	demo.innerHTML = str;
		}); 
  	
  	function winClose() {
			//alert("mid : ${vo.mid}");
  		opener.window.myform.mid.value = '${vo.mid}';
  		opener.window.myform.pwd.focus();
  		window.close()
		}
  	
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h3>아이디 검색결과</h3>
	<hr/>
	<div id="demo"></div>
	<hr/>
	<p><input type="button" value="창닫기" onclick="winClose()"/></p>
</div>
<p><br/></p>
</body>
</html>