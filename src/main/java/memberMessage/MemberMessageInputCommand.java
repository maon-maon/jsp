package memberMessage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class MemberMessageInputCommand implements MemberMessageInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String senderId = request.getParameter("senderId")==null ? "" : request.getParameter("senderId");
		String receiverId = request.getParameter("receiverId")==null ? "" : request.getParameter("receiverId");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		
		MemberDAO dao = new MemberDAO();
		
		MemberMessageVO vo = new MemberMessageVO();
		vo.setSenderId(senderId);
		vo.setReceiverId(receiverId);
		vo.setContent(content);
		
		int res = dao.setMemberMessageInput(vo);

		response.getWriter().write(res +"");

	}

}
