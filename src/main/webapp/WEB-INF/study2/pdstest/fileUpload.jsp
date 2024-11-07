<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>fileUpload.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h2>파일 업로드 연습(싱글/멀티파일)</h2>
	<hr/>
	<h4>COS라이브러리를 이용한 파일 업로드</h4>
	<pre>
		http://www.servlets.com/
		https://mvnrepository.com/artifact/servlets.com/cos/05Nov2002
	</pre>
	<hr/>
	<div class="row text-center">
		<div class="col"><a href="FileUpload1.st" class="btn btn-success" >업로드연습1</a></div>
		<div class="col"><a href="FileUpload2.st" class="btn btn-primary" >업로드연습2</a></div>
		<div class="col"><a href="FileUpload3.st" class="btn btn-secondary" >업로드연습3</a></div>
		<div class="col"><a href="FileUpload4.st" class="btn btn-warning" >업로드연습4</a></div>
	</div>	
	<hr/>
	<div class="row">
		<div class="col"><a href="FileDownload.st" class="btn btn-outline-dark form-control">다운로드폴더 이동</a></div>
		<div class="col"><a href="MemberMain.mem" class="btn btn-outline-warning form-control">돌아가기</a></div>
	</div>	
</div>
<p><br/></p>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>