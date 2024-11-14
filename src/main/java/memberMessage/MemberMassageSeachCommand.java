package memberMessage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class MemberMassageSeachCommand implements MemberMessageInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String msgFlag = request.getParameter("msgFlag")==null ? "" : request.getParameter("msgFlag");

		MemberMessageDAO dao = new MemberMessageDAO();
		ArrayList<MemberMessageVO> messageVos = dao.getMemberMassageSeach(msgFlag,mid);
		
		MemberDAO memberDao = new MemberDAO();
		ArrayList<MemberVO> vos = memberDao.getMemberList(0, 0, 888);
		
		request.setAttribute("vos", vos);
		request.setAttribute("messageVos", messageVos);
		request.setAttribute("msgFlag", msgFlag);
		
	}

}
