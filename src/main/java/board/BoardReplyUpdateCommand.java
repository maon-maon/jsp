package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardReplyUpdateCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		String content = request.getParameter("content")==null  ? "" : (request.getParameter("content"));
		String hostIp = request.getParameter("hostIp")==null  ? "" : (request.getParameter("hostIp"));

		
		BoardReplyVO vo = new BoardReplyVO();
		
		vo.setIdx(idx);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		
		BoardDAO dao = new BoardDAO();
		
		int res = dao.setBoardReplyUpdate(vo);

		response.getWriter().write(res +"");
		
	}

}
