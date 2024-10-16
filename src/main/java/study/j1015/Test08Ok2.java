package study.j1015;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/1015/Test08Ok2") 
public class Test08Ok2 extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		// null이 들어가면 널포인트익셉션 오류남. null값을 입력받지 않아서 오류 방지.
//		String mid = request.getParameter("mid");
//		if(mid == null) mid = "";
//		String pwd = request.getParameter("pwd");
//		if(pwd == null) pwd = "";
		
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		// 값이 null이면 ""=공백 을 입력. mid가 없으면 null이 들어오게 됨
		// 3항 연산자 :  조건식 ? 참수행 : 거짓수행
		
		System.out.println("아이디 : " +mid);
		System.out.println("비밀번호 : " +pwd);
		
		if(mid.equals("admin") && pwd.equals("1234")) {
			response.sendRedirect("/javaGroup/study/1015/test08Admin.jsp");
			// !!이동할 곳의 경로 요청 객체 sendRedirect=location.href같은 명령어
		}
		else if(mid.equals("hkd1234") && pwd.equals("1234")) {
			response.sendRedirect("/javaGroup/study/1015/test08Member.jsp");
		}
		else {
			response.sendRedirect("/javaGroup/study/1015/test08.jsp?flag=no");
		}
	}
}
