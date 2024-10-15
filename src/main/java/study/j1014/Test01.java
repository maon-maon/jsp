package study.j1014;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Test1")///Test1로 바로 접속함. 접속 경로다 타고가지 않음
//@WebServlet : jsp에서의 컨트롤러 : URLmappig 시켜줌=접속경로 숨겨서 보안처리
public class Test01 extends HttpServlet {
//	HttpServlet을 상속받음= main이 필요 없음. HTTP통신이 연결되면 바로 화면에 뜸. 연결하고 자료받고 끊음. 필요시 다시 요청-연결-끊음
	private static final long serialVersionUID = 1L;
	
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
//	request : 요청을 변수로 받음
//	post방식으로 받으면 GET으로 보내서 get이 처리함

}
//1)서블릿은 무조건 리스타트를 해주거나 2)Run as로 돌림