<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- test06Ok.jsp -->
<%
	/* 뷰가 아니라 체크용도. 콘솔에 뜸 */
	String mid = request.getParameter("mid");
	String pwd = request.getParameter("pwd");
	
	System.out.println("아이디 : " +mid);
	System.out.println("비밀번호 : " +pwd);
		
	if(mid.equals("admin") && pwd.equals("1234")) {
		out.println("<script>");
		out.println("location.href='test06Admin.jsp';");
		out.println("</script>");
	}
	else if(mid.equals("hkd1234") && pwd.equals("1234")) {
		out.println("<script>");
		out.println("location.href='test06Member.jsp';");		
		out.println("</script>");
	}
	else {
		out.println("<script>");
		out.println("alert('아이디를 확인하시고 다시 로그인해주세요.');");
		/* out.println("location.href='test06.jsp';"); */
		out.println("history.back();");
		out.println("</script>");
	}
%>