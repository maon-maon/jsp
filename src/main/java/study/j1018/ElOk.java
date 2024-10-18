package study.j1018;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

@WebServlet("/1018/ElOk")
public class ElOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String[] hobbys = request.getParameterValues("hobby");
		String hobby = "";
		if(hobbys !=null) {
			for(String h : hobbys) {
				hobby += h + "/";
			}			
		}
		hobby = hobby.substring(0, hobby.length()-1);
		
		System.out.println("hobby1 : "+hobby );
		
		request.setAttribute("name2", name); //이걸로 넘기면 EL표기법으로 출력 $ { }
		request.setAttribute("hobby", hobby);
		
		String viewPage = "/study/1018_JSTL/el.jsp";
//		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
//		dispatcher.forward(request, response);
		request.getRequestDispatcher(viewPage).forward(request, response);
		
	}
}
