<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberPasswordCheck.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
<script>
	'use strict';
	
	$(function() {
		$("#pwdDemo").hide();
	})
	
	function pwdReCheck() {
		let pwd = $("#pwd").val().trim();
		if(pwd == "" ) {
			alert("현재 비밀번호를 입력하세요");
			$("#pwd").focus();
			return false;
		}
		
		$.ajax({
			type : "get",
			url  : "MemberPwdCheckAjax.mem",
			data : {"pwd" : pwd},
			
			success: function(res) {
				if(res != 0) {$("#pwdDemo").show();}
				else alert("비밀번호를 다시 확인하세요");
			},
			error: function(res) {
				alert("전송 오류");
			}
		});
	}
	
	// 비밀번호 변경처리
	function pwdChangCheck() {
		let pwdCheck = $("#pwdCheck").val();
		let pwdCheckRe = $("#pwdCheckRe").val();
		/* alert("pwdChangCheck pwdCheck : "+pwdCheck);
		alert("pwdChangCheck pwdCheckRe : "+pwdCheckRe); */
		
		if(pwdCheck == "" || pwdCheckRe == "" || pwdCheck.length < 2 || pwdCheckRe.length < 2) {
			alert("변경할 비밀번호 2글자를 이상 입력하세요");
			$("pwdCheck").focus();
			return false;
		}
		else if(pwdCheck != pwdCheckRe){
			alert("입력한 비밀번호가 틀립니다");
			$("pwdCheck").focus();
			return false;
		}
		else pwdForm.submit();
	}
</script>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2 class="text-center mb-4">회원 비밀번호 체크</h2>
	<form name="myform" method="post" action="MemberPwdCheckOk.mem">
		<table class="table table-bordered">
			<tr>
				<td colspan="2" class="text-center">
					<h4>비밀번호 확인</h4>
					<div>(회원 정보 수정을 위해 현재 비밀번호를 확인합니다.)</div>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" id="pwd" name="pwd" class="form-control mb-2" required autofocus placeholder="비밀번호를 입력하세요" />
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
		      <button type="button" class="btn btn-outline-success  mb-2" onclick="pwdReCheck()">비밀번호변경</button>
		      <button type="submit" class="btn btn-outline-primary  mb-2" >회원정보변경</button>
		      <button type="reset" class="btn btn-outline-warning  mb-2" >다시입력</button>
		      <button type="button" onclick="location.href='MemberMain.mem'" class="btn btn-outline-secondary " >돌아가기</button>
		    </td>
		  </tr> 
		</table>
	</form>
			<!-- 비밀번호 변결 동적폼 생성 241031 -->
	<div class="text-center" id="pwdDemo">
		<h4>변경할 비밀번호</h4>
		<form name="pwdForm" method="post" action="MemberPwdCheckAjaxOk.mem" class="was-validated">
			<div class="form-group">
				<div class="text-left">변경할 비밀번호를 입력하세요</div>
				<input type="password" id="pwdCheck" name="pwdCheck" class="form-control mb-2" required placeholder="변경할 비밀번호를 입력하세요" />
				<div class="valid-feedback">입력완료</div>
				<div class="invalid-feedback">입력해주세요</div>
			</div>
			
			<!-- <div class="form-group">
	      <label for="uname">Username:</label>
	      <input type="text" class="form-control" id="uname" placeholder="Enter username" name="uname" required>
	      <div class="valid-feedback">Valid.</div>
	      <div class="invalid-feedback">Please fill out this field.</div>
	    </div -->>
			
			<div class="text-left">변경할 비밀번호를 확인하세요
				<input type="password" id="pwdCheckRe" name="pwdCheckRe" class="form-control mb-2" required placeholder="변경할 비밀번호를 다시 입력하세요" />
			</div>
			<div>
				<input type="button" value="비밀번호변경" onclick="pwdChangCheck()" class="btn btn-outline-secondary"/>
			</div>
		</form>
	</div>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>