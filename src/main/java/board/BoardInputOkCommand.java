package board;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardInputOkCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");
		String title = request.getParameter("title")==null ? "" : request.getParameter("title");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String openSw = request.getParameter("openSw")==null ? "" : request.getParameter("openSw");
		String hostIp = request.getParameter("hostIp")==null ? "" : request.getParameter("hostIp");

		title = title.replace("<", "&lt").replace(">", "&gt");

		
		BoardVO vo = new BoardVO();
		
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setOpenSw(openSw);
		vo.setHostIp(hostIp);
		
		BoardDAO dao = new BoardDAO();

		int res = dao.setBoardInputOk(vo);
		
		if(res != 0) {
			request.setAttribute("message", "게시글이 등록되었습니다.");
			request.setAttribute("url", "/BoardList.bo");
		}
		else {
			request.setAttribute("message", "게시글 등록 실패되었습니다.");
			request.setAttribute("url", "/BoardInput.bo");
		}
		
		
	}

}
