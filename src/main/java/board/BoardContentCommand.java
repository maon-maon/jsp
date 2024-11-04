package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardContentCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = (request.getParameter("pag")==null || request.getParameter("pag").equals("")) ? 0 : Integer.parseInt(request.getParameter("pag"));

		BoardDAO dao = new BoardDAO();
		
		// 글 조회수 1씩 증가하기
		dao.setContentReadNumPlus(idx);

		BoardVO vo = dao.getBoardContent(idx);
		//System.out.println("BoardContentCommand vo: "+vo);
		
		request.setAttribute("vo", vo);
		request.setAttribute("pag", pag);
	}

}
