package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;

public class MemberPwdCheckAjaxCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
				
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberIdCheck(mid);
		
		
		//DB에 저장된 비밀번호에서 salt키를 분리해서, 현재 입력받은 암호와 결합하여 다시 암호화 시켜서 비교할수 있게한다.
		String salt = vo.getPwd().substring(0,3); // 난수발생한 3자리 숫자를 분리
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(salt+pwd); // 암호화된 비번 생성
		
		String str = "";
		if(!vo.getPwd().substring(3).equals(pwd)) str = "0"; 
		else str = "1";

		response.getWriter().write(str);
	}

}
