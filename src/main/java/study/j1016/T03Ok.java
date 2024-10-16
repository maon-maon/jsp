package study.j1016;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/1016/T03Ok")
public class T03Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int age = request.getParameter("age")==null ? 0 : Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender"); // 문자로 넘어온건 에러 안남. 체크는 반드시 1개의 값이 넘어옴
		String[] hobbys = request.getParameterValues("hobby");
		String job = request.getParameter("job"); // 값을 1개 선택하는건 null값 처리 안 해도 됨
		String[] mountains = request.getParameterValues("mountain");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		
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
		out.println("<p><a href='"+request.getContextPath()+"/study/1016/t03_Form.jsp'>돌아가기</a></p>");
	}
}
