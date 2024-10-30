package study2.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberVO;
import study2.StudyDAO;

@SuppressWarnings("serial")
@WebServlet("/AjaxPointCheck")
public class AjaxPointCheck extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		StudyDAO dao = new StudyDAO();
		
		MemberVO vo = dao.getAjaxPointCheck();
		
		
		String res = "";
		if(vo.getName() == null) {
			res = "찾는 자료가 없습니다.";
		}
		else {
			res = "아이디 : "+vo.getMid()+", 성명 : "+vo.getName()+", 포인트 : "+vo.getPoint();
		}
		response.getWriter().write(res);
		
	}

}