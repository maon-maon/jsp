package study2.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;
import study2.StudyInterface;

public class AjaxIdCheck2_6Command implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		MemberDAO dao = new MemberDAO();
		
		ArrayList<MemberVO> vos = dao.getMemberMidList(mid);
		
		//System.out.println("vos : " + vos);
		request.setAttribute("vos", vos);
		request.setAttribute("mid", mid);

	}

}
