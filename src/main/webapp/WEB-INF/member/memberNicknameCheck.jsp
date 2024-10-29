<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberNicknameCheck.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <script>
  	'use strict';

  	let nickName = '${vo.tempnickName}';
  	let str = "";
		/* alert("nickName : $ { vo.nickName}"); */
  	$(function() {
	  	if(nickName == "") {
	  		str = "<font size='5px'><b>${vo.nickName}</b></font>은/는 사용가능합니다.";
	  	}
	  	else {
	  		str = nickName+"는 사용중입니다.";
	  		str += '<form name="childForm" method="post" action="MemberNickNameCheck.mem">';
	  		str += '닉네임 :';
	  		str += '<input type="text" name="nickName" autofocus required />';
	  		str += '<input type="submit" value="닉네임검색" class="btn btn-secondary" />';
	  		str += '</form>';
			}
	  	demo.innerHTML = str;
		}); 
  	
  	function winClose() {
			//alert("mid : ${vo.mid}");
  		opener.window.myform.nickName.value = '${vo.nickName}';
  		opener.window.myform.pwd.focus();
  		window.close()
		}   	
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h3>닉네임 검색결과</h3>
	<hr/>
	<div id="demo"></div>
	<hr/>
	<p><input type="button" value="창닫기" onclick="winClose()"/></p>
</div>
<p><br/></p>
</body>
</html>