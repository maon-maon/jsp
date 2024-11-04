package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.member.MemberClearCommand;

@SuppressWarnings("serial")
@WebServlet("*.mem")
public class MemberController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인터페이스는 추상메소드 1개 뿐이라 돌러써도 됨 but 프로젝트마다 만들어서 씀: 나중에 기능 추가 될 수 있음=확장성
		MemberInterface command = null;
		String viewPage = "/WEB-INF/member";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
	// 인증처리...:공통코드
		HttpSession session = request.getSession();
	  int level = session.getAttribute("sLevel")==null ? 999 : (int)session.getAttribute("sLevel");
		
		if(com.equals("/MemberLogin")) {
			//241030아이디 저장버튼 생성
			command = new MemberLoginCommand(); //만들어야 함
			command.execute(request, response);
			viewPage += "/memberLogin.jsp";
		}
		else if(com.equals("/MemberLoginOk")) {
			command = new MemberLoginOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		} // ->커맨드 생성 -->DAO완성(싱글톤 포함) --->MemberLoginOkCommand 처리 작업
		else if(com.equals("/MemberJoin")) {
			viewPage += "/memberJoin.jsp";
		}
		else if(com.equals("/MemberLogout")) {
			command = new MemberLogoutCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		} 
		else if(com.equals("/MemberJoinOk")) {
			command = new MemberJoinOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		} 
		else if(com.equals("/MemberIdCheck")) {
			command = new MemberIdCheckCommand();
			command.execute(request, response);
			viewPage += "/memberIdCheck.jsp";
		} 
		else if(com.equals("/MemberNickNameCheck")) {
			command = new MemberNickNameCheckCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/member/memberNicknameCheck.jsp";
		} 
		else if(com.equals("/NickNameAjaxCheck")) {
			command = new NickNameAjaxCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(level > 4) { //하위 항목 전체에 접근 제한을 걸 수 있음
	  	request.setAttribute("message", "로그인 후 사용하세요");
	  	request.setAttribute("url", "/MemberLogin.mem");
	  	viewPage = "/include/message.jsp";
	  }
		else if(com.equals("/MemberMain")) {
			command = new MemberMainCommand();
			command.execute(request, response);
			viewPage += "/memberMain.jsp";
		}
		else if(com.equals("/MemberList")) {
			command = new MemberListCommand();
			command.execute(request, response);
			viewPage += "/memberList.jsp";
		}
	//241031	
		else if(com.equals("/MemberPasswordCheck")) {
			viewPage += "/memberPasswordCheck.jsp";
		}
		else if(com.equals("/MemberPwdCheckOk")) {
			command = new MemberPwdCheckOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberUpdate")) {
			command = new MemberUpdateCommand();
			command.execute(request, response);
			viewPage += "/memberUpdate.jsp";
		}
		else if(com.equals("/MemberUpdateOk")) {
			command = new MemberUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberPwdCheckAjax")) {
			command = new MemberPwdCheckAjaxCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/MemberPwdCheckAjaxOk")) {
			command = new MemberPwdCheckAjaxOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberPwdDeleteCheck")) {
			viewPage += "/memberPwdDeleteCheck.jsp";
		}
		else if(com.equals("/MemberDeleteCheckOk")) {
			command = new MemberDeleteCheckOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		
		
	
	RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
	dispatcher.forward(request, response);
	}
}
