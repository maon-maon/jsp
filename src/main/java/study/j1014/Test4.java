package study.j1014;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet({ "/Test4", "/T4" , "/T04"}) //mapping 여러개라서
public class Test4 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		//서블릿에서 한글변환 방법 : text타입으로/html을 올린건데 utf-8로 문자를인코딩한다.
		System.out.println("이곳은 Test4 서블릿 파일 입니다.(Get)");
//		response.getWriter().append("Served at4: ").append(request.getContextPath()).append("<br/> : Hello~~~");
		
		PrintWriter out = response.getWriter();
		//브라우저에 출력하기 위함 PrintWriter객체의 변수out에 있는 println을 이용함
		out.println("<p><a href='/javaGroup/study/1014/test2.jsp'>test2.jsp로 복귀</a></p>");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 Test4 서블릿 파일 입니다.(Post)");
		doGet(request, response);
	}

}
