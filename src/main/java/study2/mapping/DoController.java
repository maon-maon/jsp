package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
//@WebServlet("/study2/mapping/list.do") //디렉토리패턴 //디렉토리는 무조선 '/'부터 시작
@WebServlet("*.do") //확장자패턴(FrontController)  //확장자는 뒤에가 중요 확장자가.do로 된건 모두 이 컨트롤러가 처리
public class DoController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { //throws ServletException, IOException 예외처리 2개 함
		String msg = request.getParameter("msg")==null ? "" : request.getParameter("msg");
		
		//request.setAttribute("msg", "list.do");
		request.setAttribute("msg", msg);
		
		
		//2.
		DoInterface command = null; //인터페이스는 선언만함 new생성 못 함
		
		
		//1.
		//String viewPage = "/WEB-INF/study2/mapping/test2.jsp";
		String viewPage = "/WEB-INF/study2/mapping/";
		
		String uri = request.getRequestURI(); //받은 링크의 전체 경로를 식별
		// 파라메터에서 넘어온 주소를 식별해서 변수uri에 담음
		System.out.println("uri : " + uri); //uri : /javaGroup/study2/mapping/list.do
		
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf(".")); //변수로 받은 uri를 변수com으로 담음
		System.out.println("com : " + com); //com : list
		
		
		//3.
		if(com.equals("list")) { // uri가 담긴 com변수 중에 특정 단어가 있는지 확인->있으면 아래 내용 실행
			//new  DoListCommend(); //class객체 생성
			command = new  DoListCommend(); //command의 타입인 DoInterface로 만듦
			command.execute(request, response); //DoInterface의 값을 가지고 execute로 변수(request, response)의 데이터를 전송
			viewPage += "doList.jsp";
		}
		else if(com.equals("search")) {
			command = new  DoSearchCommend(); 
			command.execute(request, response); 
			viewPage += "doSearch.jsp";
		}
		else if(com.equals("input")) {
			command = new  DoInputCommend(); 
			command.execute(request, response); 
			viewPage += "doInput.jsp";
		}
		else if(com.equals("inputOk")) {
			command = new  DoInputOkCommend(); //이 위치로 보내는게 콘트롤러의 존재 의미. 교통정리
			command.execute(request, response); 
			viewPage += "test2.jsp";
		}
		else if(com.equals("update")) {
			command = new  DoUpdateCommend(); 
			command.execute(request, response); 
			viewPage += "doUpdate.jsp";
		}
		else if(com.equals("updateOk")) { //뷰로 보이지 않아도 됨. 처리 완료 식별용 메세지 띄우기
			command = new  DoUpdateOkCommend(); 
			command.execute(request, response); 
			viewPage = "/include/message.jsp"; //인클루드에 있는 jsp를 부름. 불러다 쓰고 돌아감
		}
		else if(com.equals("delete")) {
			command = new  DoDeleteCommend(); 
			command.execute(request, response); 
			viewPage += "doDelete.jsp";
		}
		else if(com.equals("deleteOk")) {
			command = new  DoDeleteOkCommend(); 
			command.execute(request, response); 
			viewPage = "/include/message.jsp";
		}
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	
	}
}
