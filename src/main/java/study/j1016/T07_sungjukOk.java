package study.j1016;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/1016/T07_sungjuk")
public class T07_sungjukOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String hakbun = request.getParameter("hakbun")==null ? "" : request.getParameter("hakbun");
		int kor = (request.getParameter("kor")==null || request.getParameter("kor").equals("")) ? 0 : Integer.parseInt(request.getParameter("kor")); 
		int eng = (request.getParameter("eng")==null || request.getParameter("eng").equals("")) ? 0 : Integer.parseInt(request.getParameter("eng")); 
		int mat = (request.getParameter("mat")==null || request.getParameter("mat").equals("")) ? 0 : Integer.parseInt(request.getParameter("mat")); 
		int soc = (request.getParameter("soc")==null || request.getParameter("soc").equals("")) ? 0 : Integer.parseInt(request.getParameter("soc")); 
		int sci = (request.getParameter("sci")==null || request.getParameter("sci").equals("")) ? 0 : Integer.parseInt(request.getParameter("sci")); 
		String hostIp = request.getParameter("hostIp");
		
		int tot = kor+eng+mat+soc+sci;
		double avg = tot / 5.0;
		String grade = "";
		
		switch ((int)(avg / 10)) {
			case 10:
			case 9:
				grade = "A"; break;
			case 8:
				grade = "B"; break;
			case 7:
				grade = "C"; break;
			case 6:
				grade = "D"; break;
			default:
				grade = "F";
				break;
		}
		
//		request.setAttribute("name", name); // 저장소의변수"name", 여기데이터변수name
//		request.setAttribute("hakbun", hakbun);
//		request.setAttribute("kor", kor);
//		request.setAttribute("eng", eng);
//		request.setAttribute("mat", mat);
//		request.setAttribute("soc", soc);
//		request.setAttribute("sci", sci);
//		request.setAttribute("tot", tot);
//		request.setAttribute("avg", avg);
//		request.setAttribute("grade", grade);
//		request.setAttribute("hostIp", hostIp);
//		
//		String viewPage ="/study/1016/t07_res.jsp"; // 첫번째/=웹앱. jsp파일 자바그룹아님!!
//		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
//		dispatcher.forward(request, response);		
//		//EL은 저장소request에 저장된 값은 parameter(?mid=mid)로 꺼낼 수 있음
		
		// 처리된 결과를 VO객체에 담으려한다.
		// 1.생성자를 이용한 값의 주입(처리)
		//SungjukVO vo = new SungjukVO(name, hakbun, kor, eng, mat, soc, sci, tot, avg, grade, hostIp);
		
		// 2. setter를 통한 값의 주입(처리). (많이 사용함)
		SungjukVO vo = new SungjukVO();
		vo.setName(name);
		vo.setHakbun(hakbun);
		vo.setKor(kor);
		vo.setEng(eng);
		vo.setMat(mat);
		vo.setSoc(soc);
		vo.setSci(sci);
		vo.setTot(tot);
		vo.setAvg(avg);
		vo.setGrade(grade);
		vo.setHostIp(hostIp);
		
		request.setAttribute("vo", vo); // 저장소변수=받는곳의변수"vo", 여기서생성된변수vo
		
		String viewPage ="/study/1016/t07_res2.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);	
	}
}
