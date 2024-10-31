<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberPwdDeleteCheck.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
<script>
	'use strict';
	
	function pwdCheck() {
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
				if(res != 0) {
					let ans = confirm("회원 탈퇴를 신청하시겠습니까?")
					if(ans) {
						ans = confirm("회원 탈퇴하시면 1개월간 동일 아이디로 가입하실 수 없습니다. \n계속 진행하시겠습니까?")
						if(ans) myform.submit();
					}
				}
				else alert("비밀번호를 다시 확인하세요");
			},
			error: function(res) {
				alert("전송 오류");
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
	<h3>비밀번호 확인</h3>
	<div>(회원 탈퇴를 위해 현재 비밀번호를 입력해주세요.)</div>
	<form name="myform" method="post" action="MemberDeleteCheckOk.mem">
		<table class="table table-bordered">
			<tr>
				<td colspan="2" class="text-center">
					<h4>비밀번호 확인</h4>
					<div>(회원 탈퇴를 위해 현재 비밀번호는 입력해주세요.)</div>
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
		      <button type="button" onclick="pwdCheck()" class="btn btn-outline-primary  mb-2" >회원탈퇴</button>
		      <button type="reset" class="btn btn-outline-warning  mb-2" >다시입력</button>
		      <button type="button" onclick="location.href='MemberMain.mem'" class="btn btn-outline-secondary" >돌아가기</button>
		    </td>
		  </tr> 
		</table>
	</form>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>