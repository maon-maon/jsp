package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/study2/mapping/Test2") //프론트 컨트롤러는 이 주소가 1개만 생김 여기서 나뉨, 하단의 로직=코딩처리는 커멘드 객체로 보내서 전송: 컨트롤러 개수 줄임
public class Test2 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage = "/WEB-INF/study2/mapping/test2.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
