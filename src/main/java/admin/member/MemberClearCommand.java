package admin.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminInterface;
import member.MemberDAO;
import member.MemberInterface;

public class MemberClearCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		//int idx = request.getParameter("idx")==null ? 0 :  Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		System.out.println("MemberClearComman mid: "+mid+", pag: "+pag);
		
		MemberDAO dao = new MemberDAO();

		int res = dao.setMemberClear(mid);
		//System.out.println("MemberClearComman res: "+res);
		
		if(res != 0) {
			request.setAttribute("message", "회원DB가 삭제되었습니다.");
			request.setAttribute("url", "MemberList.ad");
		}
		else {
			request.setAttribute("message", "회원DB 삭제에 실패하였습니다.");
			request.setAttribute("url", "MemberList.ad");
		}

	}

}
