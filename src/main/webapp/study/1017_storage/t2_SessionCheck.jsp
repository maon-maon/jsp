<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = (String) session.getAttribute("sMid");
	String nickName = (String) session.getAttribute("sNickName");
	String name = (String) session.getAttribute("sName");
	/* 저장한 sMid를 get(읽어)서 mdi변수에 저장함 */
	
	pageContext.setAttribute("mid", mid); // 위에서 생성한 mid를 "mid"변수에 담음 
	pageContext.setAttribute("nickName", nickName);
	pageContext.setAttribute("name", name);
	//화면에 EL표기법${}을 쓰려면 page~에 담아줘여함

	//저장된 세션값들 확인하기
	Enumeration enumCk = session.getAttributeNames();
	String sessionName = "";
	String sessionName_ = "";
	String sessionValue = "";
	
	while(enumCk.hasMoreElements()) {  //hasMoreElements() 자료가 있으면 참 없으면=거짓
		sessionName_ = enumCk.nextElement().toString(); //투스트링으로 타입 맞추기
		sessionName += sessionName_ + "/";		
		sessionValue += session.getAttribute(sessionName_)+ "/";
	}
	System.out.println(sessionName +"\n"+ sessionValue);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t2_SessionCheck.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>세션값 출력</h2>
	<p>아이디 :${mid} </p>
	<p>닉네임 :${nickName} </p>
	<p>성명  :${name} </p>
	<hr/>
	<p>세션 아이디 : <%=session.getId() %></p>
	<hr/>
	<p><a href="t2_Session.jsp" class="btn btn-info">돌아가기</a></p>
</div>
<p><br/></p>
</body>
</html>