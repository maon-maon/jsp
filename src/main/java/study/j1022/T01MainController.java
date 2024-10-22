package study.j1022;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet({"/Main1","/main1"})
public class T01MainController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("1번");
		// 컨트로러는 URL타고 이동. 무조건
		
		// dispatcher만 사용가능. sendRidirect는 사용 불가: URL타고 갈 수 없음
		// 모든 파일은 컨트롤러를 통해서만 들어갈 수 있음(단축키적용안됨. 1)서버 리스타트 2)URL에 mapping주소 직접 입력해야함)
		String viewPage = "/WEB-INF/main/main.jsp";
		//String viewPage = "/WEB-INF/main/255.jpg";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
