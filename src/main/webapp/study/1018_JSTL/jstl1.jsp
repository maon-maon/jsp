<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 태그라이브러리 : 외부 라이브러리 사용 선언. 외부 라이브러리를 뽑아 내꺼에 저장해서 사용함(jdbc처럼 파일추가)
			동일 이름이면 가장 위에 것이 최신파일임
			prefix : 접두어-->
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl1.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>JSTL(Java Standard Tag Library)</h2>
	<div>
	
	</div>
	<table class="table table-bordered">
		<tr>
			<th>라이브러리</th>
			<td>주소(URL)</td>
			<td>접두어</td>
			<td>기본문법</td>
		</tr>
		<tr>			
			<td>Core</td>
			<td>http://java.sun.com/jsp/jstl/core</td>
			<td>c</td>
			<td>< c : 태그명... ></td>
		</tr>
		<tr>			
			<td>Formatting</td> <!-- 태그로 쓸 특수문자를 재정의 해서 사용할수 있게 함 -->
			<td>http://java.sun.com/jsp/jstl/fmt</td>
			<td>fmt</td>
			<td>< fmt : 태그명... ></td>
		</tr>
		<tr>			
			<td>Function</td>
			<td>http://java.sun.com/jsp/jstl/function</td>
			<td>fn</td>
			<td>$ { fn : 태그명... }</td> <!-- 펑션만 EL표기법 사용 -->
		</tr>
		<tr>			
			<td>SQL</td> <!-- SQL명령어를 사용하지 이건 사용 안 함 -->
			<td>http://java.sun.com/jsp/jstl/sql</td>
			<td>sql</td>
			<td>< sql : 태그명... ></td> 
		</tr>
	</table>
	<hr/>
	<div>
		앞의 기술된 라이브러리를 사용할 경우에는 반드시 상단에 jsp지시자 'taglib'를 사용하여 CDN을 기록해야한다.(선언한다)
	</div>
	<hr/>
	<h2>Core 라이브러리 사용예</h2>
	<pre>
		<h4>용도 : 변수제어(선언/값(일반,객체)할당/출력/제거), 제어문(조건문, 반복문)</h4> <!-- html 안에서 동적프로그램 가능해짐 -->
		변수선언 : < c : set var="변수명" value="값" >< / c : set> <!-- 타입무시하고 변수설정. 변수에 값을 기억함. 필수! -->
		변수출력 : < c : out value="값/변수/수식" /> <!-- /로 바로 마무라태그 대신 가능. 생략가능-->
		변수제거 : < c : remove var="변수명" /> <!-- 생략가능 -->
	</pre>
	<hr/>

	su1변수를 선언후 초기값으로 100을 할당? <c:set var="su1" value="100"></c:set><br/>
	값을 출력1? <c:out value="200"></c:out><br/>
	값을 출력2? <c:out value="${200}"></c:out><br/>
	su1변수값을 출력1? <c:out value="${su1}" /><br/> <!-- 무조건 EL로 적어야 함. /로 닫는태그 대신 사용 -->
	su1변수값을 출력2? ${su1}<br/> <!-- 태그없이 EL만 적어도 됨. remove없어도 페이지가 넘어가면 삭제됨 -->
	<% String name = "홍길동"; %>
	문자열 출력1? <%=name %><br/>
	<% pageContext.setAttribute("name", name); %>
	문자열 출력2? <c:out value="${name}"></c:out><br/>
	문자열 출력3? ${name}<br/>
	<hr/>

	<h4>JSTL 제어문(조건문:if, 반복문:foreach)</h4>	
	<pre>
	사용법 : < c : if test= " $ {조건식}" > 조건식이 참일때 수행내용 < / c : if >
	단점 : else문이 없다. 숫자데이터라도 문자형식으로 비교한다. 
	<!-- jstl은 else구문이 없음. 항상 배타적(상반되게)으로 질문해야함.(나머지가 장점) -->
	</pre>
	<p>su3=300, su4=400</p>
	<c:set var="su3" value="${300}"/> 
	<c:set var="su4" value="400"/>	<!-- 수식이나 객체는 무조건 EL표기법 사용 -->	
	<div>su3 : ${su3} / su4 : ${su4}</div>
	<div>1-1. su3 == su4 : <c:if test="${su3 == su4}">1-1.su3와 su4는 같다</c:if> </div> <!-- 조건이 거짓이면 출력 안됨: 1. su3 == su4 : -->
	<div>1-2. su3 eq su4 : <c:if test="${su3 == su4}">1-2.su3와 su4는 같다</c:if> </div>
	<div>2-1. su3 != su4 : <c:if test="${su3 != su4}">2-1.su3와 su4는 같지 않다</c:if> </div> <!-- 참이면 출력됨 : 2. su3 != su4 : 1.su3와 su4는 같지 않다  -->
	<div>2-2. su3 ne su4 : <c:if test="${su3 != su4}">2-2.su3와 su4는 같지 않다</c:if> </div>
	<div>3-1. su3 > su4 : <c:if test="${su3 > su4}">3-1.su3가 su4보다 크다</c:if> </div> <!-- 거짓은 수행(출력)안됨 -->
	<div>3-2. su3 gt su4 : <c:if test="${su3 gt su4}">3-2.su3가 su4보다 크다</c:if> </div> <!-- gt(g) : great than --> 
	<div>4-1. su3 >= su4 : <c:if test="${su3 >= su4}">4-1.su3가 su4보다 크거나 같다</c:if> </div>
	<div>4-2. su3 ge su4 : <c:if test="${su3 >= su4}">4-2.su3가 su4보다 크거나 같다</c:if> </div>
	<div>5-1. su3 < su4 : <c:if test="${su3 < su4}">5-1.su3가 su4보다 작다</c:if> </div>
	<div>5-2. su3 lt su4 : <c:if test="${su3 lt su4}">5-2.su3가 su4보다 작다</c:if> </div> <!-- lt : less than -->
	<div>6-1. su3 <= su4 : <c:if test="${su3 <= su4}">6-1.su3가 su4보다 작거나 같다</c:if> </div>
	<div>6-2. su3 le su4 : <c:if test="${su3 le su4}">6-2.su3가 su4보다 작거나 같다</c:if> </div>
	<br/>
	여기서부터 작동 안 됨
	<hr/>
	<p>su5=500, su6=60</p>
	<c:set var="su5" value="500"/>
	<c:set var="su6" value="60"/>
	
	<div>su5 : ${su5} / su6 : ${su6}</div>
	<div>7. su5 > su6 : <c:if test="${su5 > su6}">7.su5가 su6보다 크다</c:if></div>
	<div>8. su5 <= su6 : <c:if test="${su5 <= su6}">8.su5가 su6보다 작거나 같다</c:if></div>
	<!-- 7.과 8.이 배타적 문법. 문자비교라서 앞에서부터 비교 -->
	<div>9. su5 > su6 : <c:if test="${su5+0 > su6+0}">9.su5가 su6보다 크다</c:if></div>
	<div>10. su5 <= su6 : <c:if test="${su5+0 <= su6+0}">10.su5가 su6보다 작거나 같다</c:if></div>
	<hr/>
	
	<p>su7=500, su8=60</p>
	<c:set var="su7" value="${500}"/> 
	<c:set var="su8" value="${60}"/>
	<div>su7 : ${su7} / su8 : ${su8}</div>
	<div>7. su7 > su8 : <c:if test="${su7 > su8}">7.su7가 su8보다 크다</c:if></div>
	<div>8. su7 <= su8 : <c:if test="${su7 <= su8}">8.su7가 su8보다 작거나 같다</c:if></div>
	<div>9. su7 > su8 : <c:if test="${su7+0 > su8+0}">9.su7가 su8보다 크다</c:if></div>
	<div>10. su7 <= su8 : <c:if test="${su7+0 <= su8+0}">10.su7가 su8보다 작거나 같다</c:if></div>
	<hr/>
	
	<div>예제1 : URL에 점수(jumsu)를 QueryString방식으로 입력후 학점을 구하시오.</div>
	<div>변수명 : 입력점수는 jum, 학점은 grade로 처리</div>
	<div>
		<c:set var="jum" value="${param.jumsu}"/>
		<c:if test="${jum >= 60}"><c:set var="grade" value="D"/> </c:if>
		<c:if test="${jum >= 70}"><c:set var="grade" value="C"/> </c:if>
		<c:if test="${jum >= 80}"><c:set var="grade" value="B"/> </c:if>
		<c:if test="${jum >= 90}"><c:set var="grade" value="A"/> </c:if>
		<c:if test="${jum < 60}"><c:set var="grade" value="F"/> </c:if>
		입력받은 점수는${jum}의 학점은 ${grade} 입니다.
	</div>
	<br/>
	
	<h4>다중조건비교 : choose ~ when</h4>
	<pre>사용법:
		< c : choose >
			< c : when test="조건식1">수행할내용1< / c : when >
			< c : when test="조건식2">수행할내용2< / c : when >
			< c : when test="조건식3">수행할내용3< / c : when >
			< c : when test="조건식4">수행할내용4< / c : when >
			~~ ~~ ~~ ~~
			< c : otherwise > 기타 수행할 내용 < / c : otherwisw > 
		< / c : choose >
	</pre>
	<div>점수 ${jum}의 학점은?
		<c:choose>
			<c:when test="${jum >= 90}">A</c:when>
			<c:when test="${jum >= 80}">B</c:when>
			<c:when test="${jum >= 70}">C</c:when>
			<c:when test="${jum >= 60}">D</c:when>
			<c:otherwise>F</c:otherwise>
		</c:choose>
		학점입니다.
	</div>
	<hr/>
	<div>예제2 : url에 직급코드(code)를 QueryString방식으로 입력후 직급명을 출력하시오</div>
	<div>직급코드(kCode): B(부장), K(과장), D(대리), S(사원) / 직급명(kName)</div>
	<div>직급코드가 앞의 코드 외의 값이 들어오면 '파견근로자'라고 출력한다.</div>
	~~~~~<br/>
	<c:set var="kCode" value="${param.code}"/>
	<c:choose>
	 	<c:when test="${kCode == 'B'}"><c:set var="kName" value="부장"/></c:when>
	 	<c:when test="${kCode == 'K'}"><c:set var="kName" value="과장"/></c:when>
	 	<c:when test="${kCode == 'D'}"><c:set var="kName" value="대리"/></c:when>
	 	<c:when test="${kCode == 'S'}"><c:set var="kName" value="사원"/></c:when>
	 	<c:otherwise><c:set var="kName" value="파견근로자"/></c:otherwise>
	 </c:choose>
	 <div>직급코드 : ${kCode} / 직급명 : ${kName}</div>
		
	<hr/>
</div>
<p><br/></p>
</body>
</html>