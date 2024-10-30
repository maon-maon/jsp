package study2.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberVO;
import study2.StudyDAO;
import study2.StudyInterface;

public class AjaxPointCheckCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		StudyDAO dao = new StudyDAO();
		
		MemberVO vo = dao.getAjaxPointCheck();
		
		
		String res = "";
		if(vo.getName() == null) {
			res = "찾는 자료가 없습니다.";
		}
		else {
			res = vo.getMid()+"/"+vo.getName()+"/"+vo.getPoint();
		}
		response.getWriter().write(res);
		
	}

}
