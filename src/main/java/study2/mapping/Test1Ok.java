package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mapping/Test1Ok")
public class Test1Ok extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int su1 = request.getParameter("su1")== null ? 0 : Integer.parseInt(request.getParameter("su1"));
		int su2 = request.getParameter("su2")== null ? 0 : Integer.parseInt(request.getParameter("su2"));
		
		int hap = su1 + su2;
		int cha = su1 - su2;
		int gop = su1 * su2;
		int mok = su1 / su2;
		
		request.setAttribute("su1", su1);
		request.setAttribute("su2", su2);
		request.setAttribute("hap", hap);
		request.setAttribute("cha", cha);
		request.setAttribute("gop", gop);
		request.setAttribute("mok", mok);
		
		String viewPage = "/WEB-INF/study2/mapping/test1.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
