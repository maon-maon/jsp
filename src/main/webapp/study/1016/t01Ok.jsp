<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
	//String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
%><!-- 값을 받아오지 않아도 t01의 데이터가 res로 연결됨 -->
<!-- t01Ok.jsp -->

<!-- <script>
	location.href = "t01Res.jsp"
	/* Ok에서 멈췄다가 재정비하고 Res로 이동. 멈출 떄 ok페이지에는 데이터가 없으니 그냥 이동. 중간에 데이터가 단절됨 */
</script> -->

<!-- url은 현재페이지, 브라우저에 뜨는건 Res페이지 = 해커가 종착지의 주소를 알 수 없음 -->
<jsp:forward page="t01Res.jsp">
	<jsp:param name="member" value="memberOk" />
</jsp:forward>