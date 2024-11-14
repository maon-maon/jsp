package memberMessage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDAO;
import member.MemberVO;

public class MemberMessageCommand implements MemberMessageInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberVO> vos = dao.getMemberList(0, 0, 888);

		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		
		MemberMessageDAO messageDao = new MemberMessageDAO();
		ArrayList<MemberMessageVO> messageVos = messageDao.getMemberMassageSeach("r",mid);
		
		request.setAttribute("vos", vos);
		request.setAttribute("messageVos", messageVos);
		request.setAttribute("msgFlag", "r");
	}

}
