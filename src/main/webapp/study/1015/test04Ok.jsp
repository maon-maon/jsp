<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@page import="java.util.Date"%> --%>
<% 
	//new Date();
	java.util.Date today = new java.util.Date();
	out.println("<div><a href='test04.jsp' class='btn btn-success'>test04.jsp</a></div>");
	out.println("<hr/>");
	out.println("오늘 날짜는? " + today);
	
	LocalDate currentDate = LocalDate.now();
	out.println("<br/>오늘 날짜는? " + currentDate);

	LocalDateTime currentTime = LocalDateTime.now();
	out.println("<br/>1현재 시간은? " + currentTime);
	out.println("<br/>2현재 시간은? " + currentTime.toString().substring(11, 19));
	out.println("<div><input type='button' value='새로고침' onclick='location.reload()'></div>");
	/* MVC1패턴 */
%>

