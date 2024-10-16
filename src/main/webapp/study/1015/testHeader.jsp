<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- testHeader.jsp : 조각코드는 내용이 필요 없음 -->
<% String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid"); %>

<script>
	'use strict';
	
	/* 세션을 처리하지 않았을 떄 로그인하지 않은 회원의 접근을 차단 */
	if('<%=mid %>' ==  '') {
		alert("로그인 후 사용하세요");
		location.href = "<%=request.getContextPath() %>/study/1015/test10.jsp";
	}
	
	function logoutCheck() {
		alert("로그아웃합니다.");
		location.href = "test10.jsp";
	}
</script>

<div style="width:100%; height:100px; background-color: skyblue">
	<div style="text-align: right;">접속자 : <font color="red"><b><%=mid %></b></font></div>
	<nav style="text-align: center; padding-top:17px;">
		| <a href="test10Member.jsp?mid=<%=mid%>">홈으로</a> | <a href="test10Board.jsp?mid=<%=mid%>">게시판</a> | <a href="test10Guest.jsp?mid=<%=mid%>">방명록</a> | <a href="test10Pds.jsp?mid=<%=mid%>">자료실</a> | <a href="javascript:logoutCheck()">로그아웃</a> |
	<!-- mid=< %=mid%>에러 : html이라 단순히 출력함. mid2로 서버에 요청해서 변수 받아줌 -->
	</nav>
</div>