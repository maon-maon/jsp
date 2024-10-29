package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberIdCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");

		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberIdCheck(mid);
//		if(vo.getMid() == null ) {
//			vo.setTempMid(mid);
//		}
		if(vo.getMid() != null && !vo.getMid().equals("")) vo.setTempMid(mid);
		else vo.setMid(mid);
		
		//System.out.println("vo(아이디체크) : "+vo);
		
		request.setAttribute("vo", vo);
		
	}
}
