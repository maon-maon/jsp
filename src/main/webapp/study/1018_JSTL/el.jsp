<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>el.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>EL(Expression Language)</h2>
	<p>저장소(서버 저장소 : ServletContext컨테이너)에 기록되어 있는 자료에 대한 처리를 담당</p>
	<hr/>
	<pre>
		용도 : 사용자가 '변수/값/수식/객체'등을 서버에 전송받은 후에 저장(request/session/applicartion) 또는 처리한 후 Client로 전송된 자료를 화면에 표시한다.
		표기법 : $ {변수/값/수식/객체}
	</pre>
	<hr/>
	<p>사용할 변수 선언</p>
<%
	String atom = "Seoul";
	String name = "홍길동";
	int su1 = 100, su2 =200;
	int res = su1 * su2;
	String su3 = "300", su4 = "400";
%>
	<h2>스크립틀릿을 이용한 출력</h2>
	<div>
		<%="안녕!!" %><br/>
		atom = <%=atom %><br/>
		name = <%=name %><br/>
		su1 = <%=su1 %><br/>
		su2 = <%=su2 %><br/>
		res = <%=res %><br/>
		su1 * su2 = <%= su1 * su2%><br/> <!-- su1 * su2 = 20000 -->
		su1 +  su2 = <%=su1 + su2 %><br/> <!-- su1 + su2 = 300 -->
		su3 + su4 = <%= su3 + su4%><br/> <!-- su3 + su4 = 300400 -->
	</div>
	<hr/>
	<p>스크릿틀릿의 값을 EL표기법으로 사용하기 위해</p>
<%
	pageContext.setAttribute("atom", atom);
	pageContext.setAttribute("name", name);
	pageContext.setAttribute("su1", su1);
	pageContext.setAttribute("su2", su2);
	pageContext.setAttribute("su3", su3);
	pageContext.setAttribute("su4", su4);
	pageContext.setAttribute("res", res);
%>
	<h2>EL을 이용한 출력</h2>
	<div>
		${"안녕"}<br/>
		atom = ${atom}<br/>
		name = ${name}<br/>
		su1 = ${su1}<br/>
		su2 = ${su2}<br/>
		res = ${res}<br/>
		su1 * su2 = ${su1 * su2}<br/>
		su3 + su4 = ${su3 + su4}<br/> <!-- 값이 없는 문자=0출력  : 0+0=0 / 변수를 담았을 때는 값이 붙이기나열이 아니라 계산이 됨 -->
		su3 * su4 = ${su3 * su4}<br/> <!-- su3 * su4 = 120000 : 문자형식의 숫자를 문자가 아닌 숫자로 계산 -->
	</div>
	<hr/>
	<h4>파라메터(parameter)를 통해서 넘어온 값의 처리(?변수1=값1&변수2=값2 ==QueryString형식)</h4> <!-- PathVariable형식(경로로처리) -->
	<div>주소창에 현재주소 뒤에 '?mbc=200&kbs=50'을 입력수 확인하시오<br/>
<%
	String mbc = request.getParameter("mbc");
	String kbs = request.getParameter("kbs");
	//pageContext.setAttribute("mbc",	mbc);
	//pageContext.setAttribute("kbs",	kbs);
%>
		mbc = <%=mbc %><br/>
		kbs = <%=kbs %><br/>

		mbc = ${param.mbc}<br/> <!-- EL표기법은 param.으로 바로 파라메터에 쿼리스트링형식의 값을 가져올 수 있음 -->
		kbs = ${param.kbs}<br/>
		mbc - kbs = ${param.mbc - param.kbs}<br/>
	</div>
	<hr/>
	<div>
		<%-- <form name="myform" method="get" action="<%=request.getContextPath()%>/1018/ElOk"> --%>
		<form name="myform" method="post" action="<%=request.getContextPath()%>/1018/ElOk">
		 <!-- post방식을 사용해도 url에 보이지 않을 뿐 파라메터에 넘어감. 
		 			파라메터 : url에 보이는게 아니라 전송되어 넘어 온 값임 -->
			<h3 class="text-center mb-5">Form 자료 전송 연습</h3>
				<div>성명 :
					<input type="text" name="name" id="name" value="홍길동" class="form-control mb-3">
				</div>
				<div class="mb-3">취미 :&nbsp; &nbsp; 
					<input type="checkbox" name="hobby" id="hobby" value="등산" checked/>등산 &nbsp; 
					<input type="checkbox" name="hobby" id="hobby" value="낚시" />낚시 &nbsp; 
					<input type="checkbox" name="hobby" id="hobby" value="바둑" />바둑 &nbsp; 
					<input type="checkbox" name="hobby" id="hobby" value="수영" />수영 &nbsp; 
					<input type="checkbox" name="hobby" id="hobby" value="승마" />승마 &nbsp; 
					<input type="checkbox" name="hobby" id="hobby" value="바이크" />바이크
				</div>
				<div>
					<input type="submit" value="전송" class="form-control btn btn-success" />
				</div>
		</form>
	</div>
<%
	String name2 = request.getParameter("name")==null ? "" : request.getParameter("name");
	String hobby = request.getParameter("hobby")==null ? "" : request.getParameter("hobby");
	System.out.println("hobby2 : " +hobby );
	
	if(!name2.equals("") && (!hobby.equals(""))) {
%>
		<p>성명 : <%=name2 %> (x) - getAttribute("변수") </p> <!-- 서블릿에서 setAtri~~로 넘김->getAttribute를 사용해야 출력 가능 -->
		<p>취미 : <%=hobby %> (x) </p>
		<p>성명 : ${name2} (o)</p>
		<p>취미 : ${hobby} (o)</p>
		<!-- url에 보이는 값이 아니라 서버에 전송된 파라메터가 있어야 param.으로 출력됨
					서블릿에서 값이 넘겼어야 출력됨 -->
		<p>성명(param) : ${param.name2} (o)</p>
		<p>취미(param) : ${param.hobby} (o)</p>
<%}%>
	<div>작업끝..............</div>
	<hr/>
</div>
<p><br/></p>
</body>
</html>