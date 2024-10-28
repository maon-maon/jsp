package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.mem")
public class MemberController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인터페이스는 추상메소드 1개 뿐이라 돌러써도 됨 but 프로젝트마다 만들어서 씀: 나중에 기능 추가 될 수 있음=확장성
		MemberInterface command = null;
		String viewPage = "/WEB-INF/member";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		if(com.equals("/MemberLogin")) {
			viewPage += "/memberLogin.jsp";
		}
		else if(com.equals("/MemberLoginOk")) {
			command = new MemberLoginOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		} // ->커맨드 생성 -->DAO완성(싱글톤 포함) --->MemberLoginOkCommand 처리 작업
		else if(com.equals("/MemberLogout")) {
			command = new MemberLogoutCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		} 
		else if(com.equals("/MemberMain")) {
			command = new MemberMainCommand();
			command.execute(request, response);
			viewPage += "/memberMain.jsp";
		}
	
	
	
	
	RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
	dispatcher.forward(request, response);
	}
}
