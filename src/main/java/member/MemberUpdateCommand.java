package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberUpdateCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//세션에서 정보 받아오기 : 아이디를 넘긴적 없어도 세션에 올려놓은게 있음
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
				
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberIdCheck(mid);
		
		// 전화번호 분리(-)
		String[] tel = vo.getTel().split("-"); //분리해서 받으면 배열로 받게 됨
		if(tel[1].equals(" ")) tel[1] = "";
		if(tel[2].equals(" ")) tel[2] = "";
		request.setAttribute("tel1", tel[0]);
		request.setAttribute("tel2", tel[1]);
		request.setAttribute("tel3", tel[2]);
		
		// 주소 분리(/)
		String[] address = vo.getAddress().split("/"); //분리해서 받으면 배열로 받게 됨
		if(address[0].equals(" ")) address[0] = "";
		if(address[1].equals(" ")) address[1] = "";
		if(address[2].equals(" ")) address[2] = "";
		if(address[3].equals(" ")) address[3] = "";
		request.setAttribute("postcode", address[0]);
		request.setAttribute("address1", address[1]);
		request.setAttribute("detailAddress", address[2]);
		request.setAttribute("extraAddress", address[3]);
		
		// 이메일주소 분리(-)
		String[] email = vo.getEmail().split("@"); //분리해서 받으면 배열로 받게 됨
		if(email[0].equals(" ")) email[0] = "";
		if(email[1].equals(" ")) email[1] = "";
		request.setAttribute("email1", email[0]);
		request.setAttribute("email2", email[1]);
			
		
		
		

		request.setAttribute("vo", vo);
	}

}
