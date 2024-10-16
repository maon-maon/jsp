package study.j1015;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/1015/Test10Ok2") 
public class Test10Ok2 extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		// 값이 null이면 ""=공백 을 입력. mid가 없으면 null이 들어오게 됨
		// 3항 연산자 :  조건식 ? 참수행 : 거짓수행
		
		System.out.println("아이디 : " +mid);
		System.out.println("비밀번호 : " +pwd);
		
		// 하드코딩 : 직접 자료 보냄. 원래는DB로 들어가서 검색해야 함
		if(mid.equals("admin") && pwd.equals("1234")) {
			response.sendRedirect(request.getContextPath() + "/study/1015/test10Admin.jsp?mid="+mid);
			// request.getContextPath() : 서버에 올라가 있는 컨텍스트명(=javaGroup)을 부름. 경로에서 삭제 가능
		}
		else if((mid.equals("hkd1234") && pwd.equals("1234")) || (mid.equals("kms1234") && pwd.equals("1234"))) {
			response.sendRedirect(request.getContextPath() + "/study/1015/test10Member.jsp?mid="+mid);
			//?mid="+mid : get방식으로 mid데이터를 넘김
		}
		else {
			response.sendRedirect(request.getContextPath() + "/study/1015/test10.jsp?flag=no");
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
//	404에러를 방지. GUI방식이 아닌 주소입력방식=GET방식 으로 접속해도 오류가 나지 않도록 주소 입력한 사용자를 post로 보냄
}
