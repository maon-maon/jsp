<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!-- core라이브러리 사용하려면 필요 -->
<!-- prefix : 앞에서부터불러옴=접두어. Root->L->R왼쪽에서 오른쪽(정방향 검색) -->
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl2.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>JSTL 반복문(core라이브러리 사용 : forEach문)</h2>
	<pre>
		사용법1 : < c : forEach var="변수" begin="초기값" end="최종값" step="증감값" varStatus="매개변수" > ~~< / c : forEach >
						step 이 1인 경우는 생략가능. varStatus="변수"는 매개값을 필요로할 경우에만 표기하면 됨.
		사용법2 : < c : forEach var="변수" items="$ { 객체명 }" varStatus="매개변수" > ~~< / c : forEach >
		<!-- 향상된 for문과 비슷 -->
		사용법3 : < c : forTokens var="변수" items="$ { 객체명 }" delims="구분기호"> ~~< / c : forTokens >
		<!-- .split()함수와 비슷한 기능 -->
	</pre>
	<p>사용법1</p>
	<c:forEach var="i" begin="1" end="10" step="1" >
		${i} / 
	</c:forEach> <!-- for문처럼 반복횟수가 정해진 반복에 사용 -->
	<br/><br/>
	<p>사용법2</p>
<%
	String[] cards = {"국민","BC","LG","현대","삼성","농협","신한"};
	pageContext.setAttribute("cards", cards);
%>
	<c:forEach var="card" items="${cards}">
		${card} /
	</c:forEach>
	<p>사용법3</p>
	<c:set var="hobbys" value="등산/수영/낚시/바둑/독서/승마/바이크"/>
	취미 : ${hobbys}<br/>
	'/'를 구분기호로 분리해서 ','로 출력 : 
	<c:forTokens var="hobby" items="${hobbys}" delims="/">
		${hobby} ,
	</c:forTokens>
	<p>사용법4(상태변수 사용예)</p>
	<div>count / index / current / first / last</div>
	<!-- count:현재번호  current:현재아이템/아이템의 첫번째/마지막-->
	<c:forEach var="card" items="${cards}" varStatus="st">
		${st.count}(${st.index}) : ${card} 카드 , 조건? a.${st.current} , b.${st.first} , c.${st.last}<br/> <!--  1(0) : 국민 카드 -->
		<!-- st.current:현재값을 변수에 안 담고 아이템을 바로 꺼냄
				  b.${st.first} : 첫번째가 맞으면 true 출력 -->
		<!-- varStatus의 예약어count / index / current / first / last를 사용하려면 "변수"가 필요함
				 이걸 쓸 때는 var이 없어도 작동 가능 -->
	</c:forEach>
	<hr/>
	<h5>1.구구단 5단을 출력하세요</h5>
	* 5 단 *<br/>
	<c:forEach var="i" begin="1" end="9">
	  5 * ${i} = ${5 * i}<br/>
	</c:forEach>
	<br/><br/>
	
	<h5>2. 2단~5단까지 출력</h5>
	<c:forEach var="i" begin="2" end="5">
	${i}단 : 
		<c:forEach var="j" begin="1" end="9">
	   ${i} *${j} = ${i * j} / 
		</c:forEach>
		<br/>
	</c:forEach>
	<br/>
	
	<h5>3. 저장된 6장의 사진을 출력하시오.</h5>
	<c:forEach var="i" begin="250" end="255">
		<%-- <img src="<%=request.getContextPath()%>/images/${i}.jpg" width="100px"> &nbsp; --%>
		<!-- 링크 EL표기법 변경 : < %% >를$ {}로 / get삭제 / 첫글자소문자 / ()삭제 / pageContext.삽입  -->
		<%-- <img src="${pageContext.request.contextPath}/images/${i}.jpg" width="100px"> &nbsp; --%>
		<img src="${ctp}/images/${i}.jpg" width="100px"> &nbsp;
		<!-- 변수에 담아서< c :set 사용 -->
	</c:forEach>
	<br/><br/>

	<h5>3. 저장된 6장의 사진을 배열에 저장시킨후 1줄에 3장씩 출력하시오.</h5>
	<c:set var="images" value="250/251/252/253/254/255"/>
	<c:forTokens var="i" items="${images}" delims="/" varStatus="st">
		<%-- <img src="<%=request.getContextPath()%>/images/${i}.jpg" width="100px"> &nbsp; --%>
		<img src="${ctp}/images/${i}.jpg" width="100px"> &nbsp;
		<c:if test="${st.count % 3 == 0}"><br/><br/></c:if>		
	</c:forTokens>
	
	<h5>4. 2차원형식의 배열에 저장된 자료를 한행에 3개씩 출력해보자</h5>
<%
	String[][] members = {
			{"홍길동","서울","23"},
			{"김말숙","청주","31"},
			{"이기자","제주","40"},
			{"오하늘","서울","20"},
			{"강감찬","인천","50"}
	};
	pageContext.setAttribute("members", members);
%>
	<!--items:객체를 넣을 떄 사용 $ { 로 표시}  -->
	<c:forEach var="member" items="${members}"> <!-- members는 전체행이 저장,  member에는 1행이 들어가 있음 -->
		<c:forEach var="m" items="${member}"> <!-- member에는 문자3개가 있음=배열 -->
			${m} /
		</c:forEach>
		<br/>
	</c:forEach>
	<br/><br/>
	
	<h5>5. 2차원형식의 배열에 저장된 자료를 한행에 3개씩 출력해보자('서울'에 사는 자료만 빨강색으로 출력하시오.)</h5>
	<c:forEach var="member" items="${members}"> 
		<c:forEach var="m" items="${member}">
			<c:if test="${m =='서울'}"><font color="red">${m}</font> / </c:if>
			<c:if test="${m !='서울'}">${m} /</c:if>			
		</c:forEach>
		<br/>
	</c:forEach>
	<br/><br/>
	
	<h5>6. 2차원형식의 배열에 저장된 자료를 한행에 3개씩 출력해보자(나이가 25세 미만은 굵고 파랑색 출력)</h5>
	<c:forEach var="member" items="${members}"> 
		<c:forEach var="m" items="${member}">
			<c:if test="${m <'25'}"><font color="blue"><b>${m}</b></font> / </c:if>
			<c:if test="${m >='25'}">${m} /</c:if>			
		</c:forEach>
		<br/>
	</c:forEach>
	<br/><br/>
	
	<h5>7. cards의 내용중, 첫번째 카드의 배경색은 노랑, 마지막카드의 배경색은 하늘색으로 출력하세요</h5>
	<c:forEach var="card" items="${cards}" varStatus="st">
		<%-- <c:forEach var="c" items="${card}"> --%>
		<c:forEach items="${card}">
			<c:if test="${st.first}"><span style="background-color:yellow">${card}</span></c:if>
			<c:if test="${st.last}"><span style="background-color:skyblue">${card}</span></c:if>
			<c:if test="${!st.first && !st.last}">${card}</c:if>
		</c:forEach>
	</c:forEach>
	<br/><br/>
	
	<h5>8. cards의 내용중, '국민'카드는 파랑색, '삼성'카드'는 빨강색, 첫번째카드의 배경은 '노랑', 마지막카드배경은 '하늘'색 출력하시오.</h5>
	<!-- 셀프완성 -->
	<c:forEach var="card" items="${cards}" varStatus="st">
		<c:forEach var="c" items="${card}">
			<c:if test="${c == '국민' }"><font color="blue">${card}</font></c:if>
			<c:if test="${c == '삼성' }"><font color="red">${card}</font></c:if>
			<c:if test="${st.first}"><span style="background-color:lime">${card}</span></c:if>
		</c:forEach>
	</c:forEach>
	
	<br/><br/>
</div>
<p><br/></p>
</body>
</html>