package study2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study2.ajax.AjaxIdCheck0Command;
import study2.ajax.AjaxIdCheck1Command;
import study2.ajax.AjaxIdCheck2_6Command;
import study2.ajax.AjaxPointCheckCommand;
import study2.calendar.CalendarCommand;
import study2.errorPage.ErrorJSPCommand;
import study2.password.PassCheckOkCommand;
import study2.pdstest.FileDeleteCommand;
import study2.pdstest.FileDownloadCommand;
import study2.pdstest.FileUpload1OkCommand;
import study2.pdstest.FileUpload2OkCommand;
import study2.pdstest.FileUpload3OkCommand;
import study2.pdstest.FileUpload4OkCommand;
import study2.pdstest.FileUpload5Ok;
import study2.pdstest.JavaFileDownloadCommand;
import study2.pdstest2.javaFileDownloadCommand;
import study2.photoView.PhotoStorageListCommand;
import study2.photoView.PhotoView1OkCommand;
import study2.photoView.PhotoView2OkCommand;
import study2.photoView.PhotoViewDeleteCommand;
import study2.uuid.UuidFormOkCommand;

@SuppressWarnings("serial")
@WebServlet("*.st")
public class StudyController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인터페이스는 추상메소드 1개 뿐이라 돌러써도 됨 but 프로젝트마다 만들어서 씀: 나중에 기능 추가 될 수 있음=확장성
		StudyInterface command = null;
		String viewPage = "/WEB-INF/study2";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		// 인증처리...(spring에서는 aop의 개념)
		HttpSession session = request.getSession();
	  int level = session.getAttribute("sLevel")==null ? 999 : (int)session.getAttribute("sLevel");
		
	  if(level > 4) { //하위 항목 전체에 접근 제한을 걸 수 있음
			request.setAttribute("message", "로그인후 사용하세요");
			request.setAttribute("url", "/MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
		else if(level == 1) {
			request.setAttribute("message", "정회원부터 사용하실수 있습니다.");
			request.setAttribute("url", "/MemberMain.mem");
			viewPage = "/include/message.jsp";
		}
	  else if(com.equals("/PassCheckForm")) {
			viewPage += "/password/passCheck.jsp";
		}
		else if(com.equals("/PassCheckOk")) {
			command = new PassCheckOkCommand();
			command.execute(request, response);
			viewPage += "/password/passCheck.jsp";
		}
		else if(com.equals("/AjaxTest")) {
			viewPage += "/ajax/ajaxTest.jsp";
		}
		
		else if(com.equals("/AjaxIdCheck0")) {
			command = new AjaxIdCheck0Command();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/AjaxIdCheck1")) {
			command = new AjaxIdCheck1Command();
			command.execute(request, response);
			return; //비동기식은 여기서 끊어야 함. 보낸곳에서 다시 받는 코드까지 이미 있기 때문에 돌아갈 곳 지정안해도 됨
			//viewPage = "/include/message.jsp"; //뷰페이지 필요없음
		}
		else if(com.equals("/AjaxPointCheck")) {
			command = new AjaxPointCheckCommand();
			command.execute(request, response);
			return; //비동기식은 여기서 끊어야 함
		}
		else if(com.equals("/AjaxTest2")) {
			viewPage += "/ajax/ajaxTest2.jsp";
		}
		else if(com.equals("/AjaxIdCheck2_6")) {
			command = new AjaxIdCheck2_6Command();
			command.execute(request, response);
			//return;
			//System.out.println("컨트롤러");
			viewPage += "/ajax/ajaxTest2_6.jsp";
		}
		else if(com.equals("/FileUpload")) {
			viewPage += "/pdstest/fileUpload.jsp";
			//viewPage += "/pdstest/file.jsp";
		}
		else if(com.equals("/FileUpload1")) {
			viewPage += "/pdstest/fileUpload1.jsp";
		}
		else if(com.equals("/FileUpload2")) {
			viewPage += "/pdstest/fileUpload2.jsp";
		}
		else if(com.equals("/FileUpload3")) {
			viewPage += "/pdstest/fileUpload3.jsp";
		}
		else if(com.equals("/FileUpload4")) {
			viewPage += "/pdstest/fileUpload4.jsp";
		}
		else if(com.equals("/FileUpload5")) {
			viewPage += "/pdstest/fileUpload5.jsp";
		}
		else if(com.equals("/FileUpload6")) {
			viewPage += "/pdstest/fileUpload6.jsp";
		}
		else if(com.equals("/FileUpload1Ok")) {
			command = new FileUpload1OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/FileUpload2Ok")) {
			command = new FileUpload2OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/FileUpload3Ok")) {
			command = new FileUpload3OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/FileUpload4Ok")) {
			command = new FileUpload4OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
//		else if(com.equals("/FileUpload5Ok")) {
//			command = new FileUpload5OkCommand();
//			command.execute(request, response);
//			viewPage = "/include/message.jsp";
//		} //디렉토리 방식으로 변경함
		else if(com.equals("/FileDownload")) {
			command = new FileDownloadCommand();
			command.execute(request, response);
			viewPage += "/pdstest/fileDownload.jsp";
		}
		else if(com.equals("/FileDelete")) {
			command = new FileDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/javaFileDownload")) {
			command = new javaFileDownloadCommand();
			command.execute(request, response);
			return; //다운로드는 ajax아니더라도 원래 페이지에서 끝남
		}
		else if(com.equals("/Calendar")) {
			command = new CalendarCommand();
			command.execute(request, response);
			viewPage += "/calendar/calendar.jsp";
		}
		else if(com.equals("/UuidForm")) {
			viewPage += "/uuid/uuidForm.jsp";
		}
		else if(com.equals("/UuidFormOk")) {
			command = new UuidFormOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/UuidFormOk")) {
			command = new UuidFormOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/PhotoView")) {
			viewPage += "/photoView/photoView1.jsp";
		}
		else if(com.equals("/PhotoView1Ok")) {
			command = new PhotoView1OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/PhotoView2")) {
			viewPage += "/photoView/photoView2.jsp";
		}
		else if(com.equals("/PhotoView2Ok")) {
			command = new PhotoView2OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/PhotoStorageList")) {
			command = new PhotoStorageListCommand();
			command.execute(request, response);
			viewPage += "/photoView/photoStorageList.jsp";
		}
		else if(com.equals("/PhotoViewDelete")) {
			command = new PhotoViewDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ErrorMenu")) {
			viewPage += "/error/errorMenu.jsp";
		}
		else if(com.equals("/ErrorJSP")) {
			command = new ErrorJSPCommand();
			command.execute(request, response);
			viewPage += "/error/errorJSP.jsp";
		}
		else if(com.equals("/Error400")) {
			String vo = request.getParameter("vo");
			System.out.println("vo: "+vo);
			viewPage += "/error/errorJSP.jsp";
		}
		else if(com.equals("/Error500")) {
			System.out.println("5 / 0: "+(5/0));
			viewPage += "/error/errorJSP.jsp";
		}
		
	
	
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
