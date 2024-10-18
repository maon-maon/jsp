package study.j1017;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/1017/T5_ServletTestOk")
public class T5_ServletTestOk extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String mid = request.getParameter("mid");
		System.out.println("T5_ServletTestOk : mid = " + mid);
		
		//세션객체 생성 : 세션타입=HttpSession!!(암기)
		HttpSession session = request.getSession();
		session.setAttribute("sMid", mid);
		
		//어플리케이션객체 생성 : 타입ServletContext 사용!!
		//ServletContext application = session.getServletContext(); //어플리케이션 객체는 세션에 들어가 있음. 먼저 세션을 불러야함
		//ServletContext application = request.getSession().getServletContext(); //편법1
		ServletContext application = request.getServletContext(); //세션객체 생성 안 하고 바로 불러서 사용함(이걸 사용)
		application.setAttribute("aMid", mid);
		
		response.sendRedirect(request.getContextPath()+"/study/1017_storage/t5_ServletTest.jsp");
	}

}
