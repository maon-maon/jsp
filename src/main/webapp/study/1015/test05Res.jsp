<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- test05Res.jsp -->
<%
	request.setCharacterEncoding("utf-8");
	/* 서버에 요청할 때 윈도우로 해석된 내용을 utf-8로 인코딩 요청(request)함 */
	
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	/* 서버에서 값을 가져옮 : request.getParameter() */
	
	out.println("성명 : " +name);
	out.println("<br/>나이 : " +age);
	out.println("<br/><a href='test05.jsp'>돌아가기</a>");
	
	//out.println("<div><a href='test05Res.jsp?name="+name+"&age="+age+"'>값전송</a></div>");
	/* form 사용 안 하면 무조건 get방식 */
%>