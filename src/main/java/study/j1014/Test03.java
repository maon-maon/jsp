package study.j1014;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet({ "/Test3", "/T3" , "/T03"}) //mapping 여러개라서
public class Test03 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 Test3 서블릿 파일 입니다.(Get)");
		response.getWriter().append("Served at3: ").append(request.getContextPath()).append("<br/> : Hello~~~");
	}//getWriter():브라우저 출력 메소드
	//HttpServlet에 속해있는 HttpServletRequest를 받은 변수 response의 속에 있는getWriter()메소드
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 Test3 서블릿 파일 입니다.(Post)");
		doGet(request, response);
	}

}
