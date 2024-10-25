package guest;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.gu")
public class GuestController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestInterface command = null;
		String viewPage = "/WEB-INF/guest";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		if(com.equals("/GuestList")) {
			command = new GuestListCommand(); //인터페이스GuestInterface 안에있는GuestListCommand 커멘드클래스
			command.execute(request, response);
			viewPage +="/guestList.jsp";
		}
		else if(com.equals("/GuestInput")) { //뷰만 보이면 됨= 커맨드객체 필요 없음
			viewPage +="/guestInput.jsp";
		}
		else if(com.equals("/GuestInputOk")) { 
			command = new GuestInputOkCommand(); 
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/GuestAdmin")) { //뷰만 보이면 됨= 커맨드객체 필요 없음
			viewPage +="/guestAdmin.jsp";
		}
		else if(com.equals("/GuestAdminOk")) { 
			command = new GuestAdminOkCommand(); 
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/GuestAdminOut")) { 
			command = new GuestAdminOutCommand(); 
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/GuestDeleteOk")) { 
			command = new GuestDeleteOkCommand(); 
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
