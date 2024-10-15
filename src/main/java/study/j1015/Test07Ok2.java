package study.j1015;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/1015/Test07Ok2") 
public class Test07Ok2 extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		// 서버에서 웹으로 보낼때 한글오류고침. 서버에서 가져올때 오류=request
		
		String mid = request.getParameter("mid");
		String pwd = request.getParameter("pwd");
		
		System.out.println("아이디 : " +mid);
		System.out.println("비밀번호 : " +pwd);
		
//		PrintWriter out = response.getWriter();
		//!!브라우저에 출력하는 객체!!:유저가 보는 화면이 아님. 서버에서 해석
			
		if(mid.equals("admin") && pwd.equals("1234")) {
//			out.println("<script>");
//			out.println("location.href='/javaGroup/study/1015/test07Admin.jsp';");
//			out.println("</script>");
			response.sendRedirect("/javaGroup/study/1015/test07Admin.jsp");
			// !!이동할 곳의 경로 요청 객체 sendRedirect=location.href같은 명령어
		}
		else if(mid.equals("hkd1234") && pwd.equals("1234")) {
//			out.println("<script>");
//			out.println("location.href='/javaGroup/study/1015/test07Member.jsp';");		
//			out.println("</script>");
			response.sendRedirect("/javaGroup/study/1015/test07Member.jsp");
		}
		else {
//			out.println("<script>");
//			out.println("alert('아이디를 확인하시고 다시 로그인해주세요.');");
//			out.println("history.back();");
//			out.println("</script>");
			response.sendRedirect("/javaGroup/study/1015/test07.jsp?flag=no");
		}
	}
}
