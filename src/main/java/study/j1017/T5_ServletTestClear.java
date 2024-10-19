package study.j1017;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/1017/T5_ServletTestClear")
public class T5_ServletTestClear extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//세션삭제
		HttpSession session = request.getSession();		
		session.invalidate();
		
	//어플리케이션삭제
		ServletContext application = request.getServletContext();
		application.removeAttribute("aMid");
		
		response.sendRedirect(request.getContextPath()+"/study/1017_storage/t5_ServletTest.jsp");
	}

}
