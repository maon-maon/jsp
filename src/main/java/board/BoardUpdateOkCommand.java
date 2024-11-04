package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardUpdateOkCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pag = (request.getParameter("pag")==null || request.getParameter("pag").equals("")) ? 0 : Integer.parseInt(request.getParameter("pag"));
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");
		String title = request.getParameter("title")==null ? "" : request.getParameter("title");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String openSw = request.getParameter("openSw")==null ? "" : request.getParameter("openSw");
		String hostIp = request.getParameter("hostIp")==null ? "" : request.getParameter("hostIp");

		title = title.replace("<", "&lt").replace(">", "&gt");
		
		BoardVO vo = new BoardVO();
		
		vo.setIdx(idx);
		vo.setNickName(nickName);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setOpenSw(openSw);
		vo.setHostIp(hostIp);
		
		BoardDAO dao = new BoardDAO();

		int res = dao.setBoardUpdateOk(vo);
		
		if(res != 0) {
			request.setAttribute("message", "게시글이 수정되었습니다.");
			//request.setAttribute("url", "/BoardList.bo?pag="+pag);
			request.setAttribute("url", "/BoardContent.bo?idx="+idx+"&pag="+pag);
			 		}
		else {
			request.setAttribute("message", "게시글 수정 실패되었습니다.");
			request.setAttribute("url", "/BoardUpdate.bo?idx="+idx+"&pag="+pag);
		}
		

	}

}
