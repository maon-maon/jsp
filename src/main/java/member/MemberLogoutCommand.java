package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLogoutCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String nickName = (String)session.getAttribute("sNickName");
		
		session.invalidate(); // 로그아웃 = 세션을 완전히 끊음
		
		request.setAttribute("message", nickName+"님 로그아웃되었습니다."); // 역슬2개\가 붙어야 제어코드로 인식함
		request.setAttribute("url", "MemberLogin.mem");
	}
}
