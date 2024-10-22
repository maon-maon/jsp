package study.j1021;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/1021/T3_initOk")
public class T3_initOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 /1021/T3_initOk 입니다.");
		
		String logoName = getServletContext().getInitParameter("logoName"); 	//xml파일=컨텍스트파일은 서블릿 파일취급
		String homeAddess = getServletContext().getInitParameter("homeAddess");
		
		
		HttpSession session = request.getSession();
		
//		session.setAttribute("sLogoName", "그린주식회사"); // 값은 배포후 수정 안됨= 값을 xml로 주입하면 나중에 변경시 바꿀 수 있음 = 결합력이 낮음
//		session.setAttribute("sHomeAddess", "www.green.com");
		session.setAttribute("sLogoName", logoName);  // xml파일에서 logoName=값 을 가져옴 web.xml에서 설정(여기서는)
		session.setAttribute("sHomeAddess", homeAddess);
		
		// 자료가 없거나(단순실행), 적으면 sendRedirect를 쓰는게 편함
		// 서블릿(~Ok파일)에서 DB에 값을 넣음=새로고침하면 동일 자료가 계속 들어감 = dispatcher 안 씀
		response.sendRedirect(request.getContextPath()+"/study/1021_xml/t3_init.jsp");
	}
}
