package study2.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.database.DbTestDAO;
import study2.database.DbTestVO;
@WebServlet("/AjaxIdCheck2_2")
public class AjaxIdCheck2_2 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
	
		DbTestDAO dao = new DbTestDAO();
		
		DbTestVO vo = dao.getIdSearch(mid);
		
		//System.out.println("AjaxIdCheck2_2vo : "+vo);
		
		String str = "";
		if(vo.getMid().equals("")) str = "찾고자하는 자료가 없습니다.";
		else {
			str = vo.getMid()+"/"+vo.getName()+"/"+vo.getAge()+"/"+vo.getGender()+"/"+vo.getAddress();
		}
			
		response.getWriter().write(str);
	}
}
