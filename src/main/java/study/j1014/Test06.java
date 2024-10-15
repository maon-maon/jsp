package study.j1014;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
//@WebServlet({"/Test06", "/T06"})
public class Test06 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		System.out.println("이곳은 Test06 서블릿의 Get");
		
		PrintWriter out = response.getWriter();
//		response.getWriter():웹에 출력시키는 메소드
		out.println("<p><a href='/javaGroup/study/1014/test06.jsp'>돌아가기(test06.jsp)</a></p>");
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 Test06 서블릿의 Post");
		doGet(request, response);
	}
}
