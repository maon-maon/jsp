package admin.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminInterface;
import member.MemberDAO;
import member.MemberVO;

public class MemberDeteilViewCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		//System.out.println("idx :"+idx);
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberIdxCheck(idx);
		
		String strLevel = "";
		if(vo.getLevel() == 0) strLevel ="관리자";
		else if(vo.getLevel() == 1) strLevel ="준회원";
		else if(vo.getLevel() == 2) strLevel ="정회원";
		else if(vo.getLevel() == 3) strLevel ="우수회원";
		else if(vo.getLevel() == 99) strLevel ="탈퇴신청회원";
		//System.out.println("strLevel:" +strLevel);
		
		vo.setStrLevel(strLevel);
		
		request.setAttribute("vo", vo);
		//request.setAttribute("strLevel", strLevel);
	}

}