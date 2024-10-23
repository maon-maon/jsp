package study2.mapping;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/mapping/Test1Ok")
public class Test1Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int su1 = (request.getParameter("su1")==null || request.getParameter("su1").equals("")) ? 0 : Integer.parseInt(request.getParameter("su1"));
		int su2 = (request.getParameter("su2")==null || request.getParameter("su2").equals("")) ? 0 : Integer.parseInt(request.getParameter("su2"));
		String flag = request.getParameter("flag")==null ? "" : request.getParameter("flag");
		
		if(flag.equals("1")) {
			int hap = su1 + su2;
			int cha = su1 - su2;
			request.setAttribute("hap", hap);
			request.setAttribute("cha", cha);
		}
		else if(flag.equals("3")) {
			//int gop = su1 * su2;
			//int mok = 0;
			double gop = su1 * su2;
			double mok = 0.000;
			if(su2 != 0) mok = (su1 / su2);
			request.setAttribute("gop", gop);
			request.setAttribute("mok", mok);
		}
		else if(flag.equals("4")) {
			//Date today = new Date();
			//LocalDate today = LocalDate.now();
			LocalDateTime today = LocalDateTime.now(); // 2024-10-23T10:09:08.582347100
			String str = today.toString().substring(0, 10) + " / ";
			str += today.toString().substring(11, 19);
			//request.setAttribute("msg", today);
			request.setAttribute("msg", str);
			request.setAttribute("today", today);	// jsp에서 jstl을 이용한 날짜/시간 분리를 위한 준비
		}
		
		request.setAttribute("su1", su1);
		request.setAttribute("su2", su2);
		
		String viewPage = "/WEB-INF/study2/mapping/test1.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
