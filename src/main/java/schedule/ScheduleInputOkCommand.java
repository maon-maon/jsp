package schedule;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ScheduleInputOkCommand implements ScheduleInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" :  request.getParameter("mid");
		String sDate = request.getParameter("sDate")==null ? "" :  request.getParameter("sDate");
		String part = request.getParameter("part")==null ? "" :  request.getParameter("part");
		String content = request.getParameter("content")==null ? "" :  request.getParameter("content");

		ScheduleVO vo = new ScheduleVO();
		
		vo.setMid(mid);
		vo.setsDate(sDate);
		vo.setPart(part);
		vo.setContent(content);
		
		ScheduleDAO dao = new ScheduleDAO();
		
		int res = dao.setScheduleInput(vo);
		
		response.getWriter().write(res +"");
		
	}

}
