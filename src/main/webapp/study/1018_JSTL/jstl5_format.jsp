<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl5_format.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>JSTL Format연습</h2>
	<div>형식문자열(천단위쉼표, 화폐단위, 백분율, 날짜형식...)</div>
	<c:set var="won1" value="7654321"/>
	<c:set var="won2" value="7654.561"/>
	<hr/>
	<div>
		won1 : ${won1} / won2 : ${won2}<br/>
		1.천단위 쉼표 : <br/>
		<fmt:formatNumber value="${won1}"/> / <fmt:formatNumber value="${won2}"/>/<fmt:formatNumber value="7654321"/><br/> <!-- 7,654,321 / 7,654.561 -->
		<fmt:formatNumber value="${won1}" pattern="0,000"/> : <fmt:formatNumber value="${won2}" pattern="0,000"/><br/>
		<fmt:formatNumber value="${won1}" pattern="0,000.0"/> : <fmt:formatNumber value="${won2}" pattern="0,000.0"/><br/>
		<fmt:formatNumber value="123" pattern="0,000.0"/> : <fmt:formatNumber value="123.1234" pattern="0,000.0"/><br/> <!-- 의미없는0이 들어감 -->
		<fmt:formatNumber value="123" pattern="#,##0.0"/> : <fmt:formatNumber value="123.1234" pattern="#,##0.0"/><br/> <!-- 의미없는 0을 표시하지 않음 -->
		<hr/>
		
		2.통화량(화폐단위)표시<br>
		원화 : <fmt:formatNumber value="${won1}" type="currency"/><br> <!-- currency=화폐단위 타입으로 출력 -->
		US달러1 : <fmt:formatNumber value="${won2}" type="currency" currencyCode="USD"/><br/>
		US달러2 : $<fmt:formatNumber value="${won2}" pattern="#,##0.00"/><br/>
		<br/>
		
		3.백분율<br/>
		<c:set var="per" value="0.98765" />
		원본 : ${per}<br/>
		백분율1 : <fmt:formatNumber value="${per}" type="percent"/><br>
		백분율2 : <fmt:formatNumber value="${per}" type="percent" pattern="0.0%"/><br>
		<hr>
		
		<b>4. 날짜</b><br/>
		오늘날짜1 : <%=new Date() %><br/>
		<c:set var="today" value="<%=new Date() %>" />
		오늘날짜2 : ${today} : <font color="red"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/></font><br/><!-- 날짜혈ㅇ싱 패턴으로 편하게 출력 -->
		오늘날짜3 : ${today} : <font color="red"><fmt:formatDate value="${today}" pattern="yyyy-MM"/></font><br/>
		오늘날짜4 : ${today} : <font color="red"><fmt:formatDate value="${today}" pattern="MM-dd"/></font><br/>
		오늘날짜5 : ${today} : <font color="red"><fmt:formatDate value="${today}" pattern="yyyy년 MM월 dd일"/></font><br/>
		
		현재시간1 : <fmt:formatDate value="${today}" pattern="hh : mm : ss"/><br>
		현재시간2 : <fmt:formatDate value="${today}" pattern="hh시 mm분 ss초"/><br>
		<hr/><hr/>
		
		5.국가별설정(로케일)
		톰캣서버의 기본 로케일 : <%=response.getLocale() %><br/>
		미국식으로 변경 : <fmt:setLocale value="en_US" />
			<fmt:formatNumber value="${won1}" type="currency" /> <!--  -->
		<hr/><hr/>
			
		6.URL이동 : location.href / response.sendRedirect ==> redirect(core에 있음)<br/>
		<%-- < c:redirect url="https:www.naver.com">< /c:redirect> --%>  <!-- 값을 만나면 바로 이동함. 자동실행 -->
		< c : redirect url="https:www.naver.com">
			< c : param name="변수명" value="값" />
		</ c : redirect >
	</div>
</div>
<p><br/></p>
</body>
</html>