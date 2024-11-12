package pds;

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
@WebServlet("*.pds")
public class PdsController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PdsInterface command = null;
		String viewPage = "/WEB-INF/pds";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		HttpSession session = request.getSession();
	  int level = session.getAttribute("sLevel")==null ? 999 : (int)session.getAttribute("sLevel");
		
	  if(level > 4) { //렙4이상은 접속못함
			request.setAttribute("message", "로그인후 사용하세요");
			request.setAttribute("url", "/MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
	  else if(com.equals("/PdsList")) {
	  	command = new PdsListCommand();
	  	command.execute(request, response);
	  	viewPage += "/pdsList.jsp";
	  }
	  else if(com.equals("/PdsContent")) {
	  	command = new PdsContentCommand();
	  	command.execute(request, response);
	  	viewPage += "/pdsContent.jsp";
	  }
//	  else if(com.equals("/PdsSearchList")) {
//	  	command = new PdsSearchListCommand();
//	  	command.execute(request, response);
//	  	viewPage += "/pdsList.jsp";
//	  }
	  else if(level > 1 && com.equals("/DownNumCheck")) {
	  	command = new DownNumCheckCommand();
	  	command.execute(request, response);
	  	return;
	  }
	  else if(level > 4) { 
	  	request.setAttribute("message", "우수회원부터 업로드가능합니다");
	  	request.setAttribute("url", "/MemberLogin.mem");
	  	viewPage = "/include/message.jsp";
	  }
	  else if(com.equals("/PdsInput")) {
	  	command = new PdsInputCommand();
	  	command.execute(request, response);
	  	viewPage += "/pdsInput.jsp";
	  }
	  else if(com.equals("/PdsInputOk")) {
	  	command = new PdsInputOkCommand();
	  	command.execute(request, response);
	  	viewPage = "/include/message.jsp";
	  }
	  else if(com.equals("/PdsDeleteCheck")) {
	  	command = new PdsDeleteCheckCommand();
	  	command.execute(request, response);
	  	return;
	  }
	  else if(com.equals("/PdsTotalDown")) {
	  	command = new PdsTotalDownCommand();
	  	command.execute(request, response);
	  	viewPage = "/include/message.jsp";
	  }
	  
	  
	  
	
	RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
	dispatcher.forward(request, response);
	}
}
