package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestInputOkCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//방명록 등록시 입력한 자료를 받아서 처리
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		String homePage = request.getParameter("homePage")==null ? "" : request.getParameter("homePage");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String hostIp = request.getParameter("hostIp")==null ? "" : request.getParameter("hostIp");
		
		name = name.replace("<", "&lt");
		name = name.replace(">", "&gt");
		
		GuestVO vo = new GuestVO();
		
		vo.setName(name);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setContent(content);
		vo.setHostIp(hostIp);

		guestDAO dao = new guestDAO();
		
		int res = dao.setGuestInputOk(vo); // 등록성공하면 반환값이 1ㅡ 실패하면 0으로 들어오기 때문에 res는 int타입이다
		
		if(res != 0) {
			request.setAttribute("message", "방명록이 등록되었습니다.");
			request.setAttribute("url", "/GuestList.gu");
		}
		else {
			request.setAttribute("message", "방명록에 등록 실패되었습니다.");
			request.setAttribute("url", "/GuestInput.gu");
		}
	}
}
