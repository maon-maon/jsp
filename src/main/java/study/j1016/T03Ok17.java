package study.j1016;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/1016/T03Ok17") //경로명임. 파일명과 원래 달라야 함 
public class T03Ok17 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 서버에서 가져올 떄 한글인코딩
		response.setContentType("text/html; charset=utf-8"); // 브라우저에 출력할 떄 한글인코딩
		
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int age = request.getParameter("age")==null ? 0 : Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender"); // 문자로 넘어온건 에러 안남. 체크는 반드시 1개의 값이 넘어옴
		String[] hobbys = request.getParameterValues("hobby"); // 이름이 같은건 배열로 들어옴 받아줄 때 변수타입을 []로 해야함
		String job = request.getParameter("job"); // 값을 1개 선택하는건 null값 처리 안 해도 됨
		String[] mountains = request.getParameterValues("mountain");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		// flag추가
		int flag = request.getParameter("flag")==null ? 0 : Integer.parseInt(request.getParameter("flag"));
		
		System.out.println("성명 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("성별 : " + gender);
		
		String hobby = "";
		if(hobbys != null) {
			for(String h : hobbys) {
				hobby += h +"/";
			}			
			hobby = hobby.substring(0, hobby.length()-1);
		}
		System.out.println("취미 : " + hobby);
		
		System.out.println("직업 : " + job);
		
		
		String mountain = "";
		if(mountains != null) {
			for(String m : mountains) {
				mountain += m +"/";
			}
			mountain = mountain.substring(0, mountain.length()-1);
		}
		System.out.println("가본 산 : " + mountain);
		
		System.out.println("자기소개 : " + content);
		content = content.replace("\n", "<br/>");
		
		String fname = request.getParameter("fname")==null ? "" : request.getParameter("fname");
		System.out.println("첨부파일 : " + fname);
		
		// flag를 스위치 처리
		String viewPage ="";
		/*case 2:
			 	viewPage = 값을 넘길 경로=t03_Res17.jsp
			 	viewPage += "?name=" + URLEncoder.encode(name,"utf-8")
			 	//					넘기는 변수                     현재 페이지의 변수
			 	// 프론트의 명령어를 사용할수 없음=location.href사용불가 => sendRedirect를 사용
			 	viewPage += "&fname=" + URLEncoder.encode(fname,"utf-8")
			 	//한글인코딩 url로 넘어갈 때 : 한글을 특수코드로 인식함 :URLEncoder.encode(fname,"utf-8")
			 	response.sendRedirect(viewPage);
			 	// 	response.sendRedirect : get방식=url에담음=용량제한
		 	case 3:
				request.setAttribute("name", name);
		 	  // 서버 저장소에 보냄. 용량 상관 없음. 꺼내 쓸 때 변수에 담지 않아도 바로 서버에서 꺼내 쓸 수 있음. 꺼내는 명령어도 없음
		 	  RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		 	  // viewPage=종착지 주소를 담은 변수. 
				dispatcher.forward(request, response);
				//서버에 일단 다 올리고->RequestDispatcher 변수에 저정(request.getRequestDispatcher(viewPage))하고->종착지까지 보냄(forward)
				//DB에 도달하기까지 자료의 변성을 방지함
				//디스패처는 서블릿에서 사용
		 */
				
		PrintWriter out = response.getWriter();
		out.println("<h2>기록한 내용들</h2>");
		out.println("<p><hr/></p>");
		out.println("<p>성명 : "+name+"</p>");
		out.println("<p>나이 : "+age+"</p>");
		out.println("<p>성별 : "+gender+"</p>");
		out.println("<p>취미 : "+hobby+"</p>");
		out.println("<p>직업 : "+job+"</p>");
		out.println("<p>가본 산 : "+mountain+"</p>");
		out.println("<p>자기소개 : <br/>"+content+"</p>");
		out.println("<p>첨부파일 : "+fname+"</p>");
		out.println("<p><hr/></p>");
		out.println("<p><a href='"+request.getContextPath()+"/study/1016/t03_Form17.jsp'>돌아가기</a></p>");
	}
}
