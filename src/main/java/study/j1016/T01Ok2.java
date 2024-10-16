package study.j1016;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/1016/T01Ok2")
public class T01Ok2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		//넘어온 아이디와 비밀번호가 DB에 저장된 회원정보와 같은지를 비교...
		
		String viewPage ="";
		RequestDispatcher dispatcher = null;
		if((mid.equals("admin") && pwd.equals("1234")) || (mid.equals("hkd1234") && pwd.equals("1234"))) {
			viewPage ="/study/1016/t02_Member.jsp";
			request.setAttribute("mid", mid); //서블릿변수의 값(데이터)mid를 리퀘스트 변수"mid"에 담음
			//request.setAttribute 포워드에 값을 담는 명령어
			//RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
//			dispatcher = request.getRequestDispatcher(viewPage);
//			/* 서버 저장소 객체 = request : 저장소 메소드도 가지고 있음 */
//			dispatcher.forward(request, response); //dispatcher=직렬화객체. 멈추지 않고 값을 싣고 그대로 마지막까지 보냄 
//			// dispatcher.forward: url에 담기지 않음. 보안철저
		} 
		else {
			viewPage ="/study/1016/t02_Dispatcher.jsp";
			request.setAttribute("flag", "no"); //flag=변수 no=문자데이터
//			dispatcher = request.getRequestDispatcher(viewPage);
//			dispatcher.forward(request, response);
		}
		dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
}
