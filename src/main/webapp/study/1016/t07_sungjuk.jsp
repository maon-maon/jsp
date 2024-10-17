<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t07_sungjuk.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>성적 자료</h2>
	<form name="myform" method="post" action="<%=request.getContextPath() %>/1016/T07_sungjuk">
		<p>성명 : <input type="text" name="name" value="홍길동" class="form-control" autofocus required /> </p>
		<p>학번 : <input type="text" name="hakbun" value="G1234" class="form-control" required /> </p>
		<p>국어 : <input type="number" name="kor" value="100" class="form-control" required /> </p>
		<p>영어 : <input type="number" name="eng" value="90" class="form-control" required /> </p>
		<p>수학 : <input type="number" name="mat" value="80" class="form-control" required /> </p>
		<p>사회 : <input type="number" name="soc" value="70" class="form-control" required /> </p>
		<p>과학 : <input type="number" name="sci" value="60" class="form-control" required /> </p>
		<p>
			<div class="row text-center" >
				<div class="col text-left"><input type="submit" value="계산" class="btn btn-success mb-3" /></div>
				<div class="col text-right"><input type="reset" value="다시입력" class="btn btn-warning" /></div>
			</div>
		</p>
		<input type="hidden" name="hostIp" value="<%=request.getRemoteAddr()%>" />
	</form>
</div>
<p><br/></p>
</body>
</html>