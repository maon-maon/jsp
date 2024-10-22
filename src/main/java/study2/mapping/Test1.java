package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mapping/Test1")
public class Test1 extends HttpServlet {
//이제부턴 컨트롤러에서 뷰(.jsp)를 부름 1.서버리스타트 2.RUN
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.setAttribute("msg", "Hello~~~안녕~~~");
		
		//request.setAttribute("msg", request.getParameter("mid")+"님 로그인중...");
		
		RequestDispatcher dispatcher = null;
		String viewPage ="";
		
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		if(!mid.equals("") && mid.substring(0,1).toLowerCase().equals("h")) {
			viewPage = "/WEB-INF/main/main.jsp";
		}
		else {
			viewPage = "/WEB-INF/study2/mapping/test1.jsp";
		}
		request.setAttribute("msg", mid +"님 로그인중...");
		
		//viewPage = "/WEB-INF/study2/mapping/test1.jsp";
		dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
