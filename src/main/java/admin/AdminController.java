package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.board.BoardListCommand;
import admin.board.BoardSelectDeleteCommand;
import admin.claim.BoardClaimInputCommand;
import admin.claim.ClaimDeleteOkCommand;
import admin.claim.ClaimListCommand;
import admin.claim.ClaimSelectDeleteCommand;
import admin.claim.ClaimViewCheckCommand;
import admin.member.MemberClearCommand;
import admin.member.MemberDeteilViewCommand;
import admin.member.MemberLevelChangeCommand;
import admin.member.MemberListCommand;
import member.MemberMainCommand;
import study2.ajax.AjaxIdCheck0Command;
import study2.ajax.AjaxIdCheck1Command;
import study2.ajax.AjaxPointCheckCommand;
import study2.password.PassCheckOkCommand;

@SuppressWarnings("serial")
@WebServlet("*.ad")
public class AdminController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminInterface command = null;
		String viewPage = "/WEB-INF/admin";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		// 인증처리...(spring에서는 aop의 개념)
		HttpSession session = request.getSession();
	  int level = session.getAttribute("sLevel")==null ? 999 : (int)session.getAttribute("sLevel");
		
	  if(com.equals("/BoardClaimInput")) {
	  	command = new BoardClaimInputCommand();
	  	command.execute(request, response);
	  	return;
	  }
	  else if(level != 0) { 
			request.setAttribute("message", "로그인후 사용하세요");
			request.setAttribute("url", "/MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/AdminMain")) {
			viewPage += "/adminMain.jsp";
		}
		else if(com.equals("/AdminLeft")) {
			viewPage += "/adminLeft.jsp";
		}
		else if(com.equals("/AdminContent")) {
			command = new AdminContentCommand();
			command.execute(request, response);
			viewPage += "/adminContent.jsp";
		}
		else if(com.equals("/MemberList")) {
			command = new MemberListCommand();
			command.execute(request, response);
			viewPage += "/member/memberList.jsp";
		}
		else if(com.equals("/MemberLevelChange")) {
			command = new MemberLevelChangeCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/MemberDeteilView")) {
			command = new MemberDeteilViewCommand();
			command.execute(request, response);
			viewPage += "/member/memberDeteilView.jsp";
		}
//		else if(com.equals("/MemberLevelViewCheck")) {
//			command = new Memb erLeve lViewCheckC ommand();
//			command.execute(request, response);
//			viewPage += "/member/memberList.jsp";
//		} //안 만드어쓰고 MemberList에 level을 넘김
		else if(com.equals("/MemberClear")) {
			command = new MemberClearCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/ClaimList")) {
			command = new ClaimListCommand();
			command.execute(request, response);
			viewPage += "/claim/claimList.jsp";
		}
		else if(com.equals("/ClaimViewCheck")) {
			command = new ClaimViewCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ClaimDeleteOk")) {
			command = new ClaimDeleteOkCommand();
			command.execute(request, response);
			return;
		}
	  //241106
		else if(com.equals("/BoardList")) {
			command = new BoardListCommand();
			command.execute(request, response);
			viewPage += "/board/boardList.jsp";
		}
		else if(com.equals("/BoardSelectDelete")) {
			command = new BoardSelectDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ClaimSelectDelete")) {
			command = new ClaimSelectDeleteCommand();
			command.execute(request, response);
			return;
		}
	  
	
	RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
	dispatcher.forward(request, response);
	}
}
