<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>dbInput.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <style>
  	th {
  		text-align: center;
  		background-color: #eee; 
  	}
  </style>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2 class="text-center">회 원 가 입</h2>
	<form name="myform" method="post" action="${ctp}/study2/database/DbInputOk">
		<table class="table table-bordered">
			<tr>
				<th>성명</th>
				<td><input type="text" id="name" name="name" class="form-control" required autofocus placeholder="이름를 입력하세요" /></td>
			</tr>
			<tr>
				<th>나이</th> 
				<td><input type="number" id="age" name="age" class="form-control" required placeholder="나이를 입력하세요"/></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio"  name="gender"  value="남자" checked/> 남자 &nbsp;
					<input type="radio"  name="gender"  value="여자" /> 여자 
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" id="address" name="address" class="form-control" placeholder="주소를 입력하세요"/></td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<button type="submit" class="btn btn-outline-success  mr-2" >회원가입</button>
					<button type="reset" class="btn btn-outline-warning  mr-2" >다시입력</button>
					<button type="button" onclick="location.href='${ctp}/study2/database/DbList'" class="btn btn-outline-primary" >돌아가기</button>
				</td>
			</tr>
		</table>
	</form>
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>