<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t07_res2.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>성적처리 결과</h2>
	<hr/>
	<!-- 필드변수 안에 있는 값은 못 읽음 -> "vo"로 넘겨받은 변수 vo객체안에서 값을 불러줘야 함 -->
	<p>성명 : ${vo.name} </p>
	<p>학번 : ${vo.hakbun} </p>
	<p>국어 : ${vo.kor} </p>
	<p>영어 : ${vo.eng} </p>
	<p>수학 : ${vo.mat} </p>
	<p>사회 : ${vo.soc} </p>
	<p>과학 : ${vo.sci} </p>
	<p>총점 : ${vo.tot} </p>
	<p>평균 : ${vo.avg} </p>
	<p>학점 : ${vo.grade}</p>
	<p>접속IP : ${vo.hostIp}</p>
	<hr/>
	<p><a href="<%=request.getContextPath() %>/study/1016/t07_sungjuk.jsp" class="btn btn-success">돌아가기</a></p>
</div>
<p><br/></p>
</body>
</html>