<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t08_paramOk.jsp -->
<%
	String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
	String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
	
	pageContext.setAttribute("mid", mid);
	pageContext.setAttribute("pwd", pwd);
	/* 현재페이지에서 출력할 때 사용. 서버저장소에 담았기 때문에 EL표기법 사용가능 */
%>
<h2>회원정보</h2>
<p>아이디 : ${mid}</p>
<p>비밀번호 : ${pwd}</p>
<hr/>

<%if(mid.substring(mid.length()-1).equals("I")) {%>
		<jsp:forward page="t08_resI.jsp">
			<jsp:param name="mid" value="${mid}" />
			<jsp:param name="pwd" value="${pwd}" />
		</jsp:forward>
<%} else if(mid.substring(mid.length()-1).equals("J")) { %>
		<jsp:forward page="t08_resJ.jsp">
			<jsp:param name="mid" value="${mid}" />
			<jsp:param name="pwd" value="${pwd}" />
		</jsp:forward>
<%} else if(mid.substring(mid.length()-1).equals("S")) { %>
		<jsp:forward page="t08_resS.jsp">
			<jsp:param name="mid" value="${mid}" />
			<jsp:param name="pwd" value="${pwd}" />
		</jsp:forward>
<%} else if(mid.substring(mid.length()-1).equals("C")) { %>
		<jsp:forward page="t08_resC.jsp">
			<jsp:param name="mid" value="${mid}" />
			<jsp:param name="pwd" value="${pwd}" />
		</jsp:forward>
<%}%>