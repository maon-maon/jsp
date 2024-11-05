package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardGoodCheckCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		int goodCnt = (request.getParameter("goodCnt")==null || request.getParameter("goodCnt").equals("")) ? 1 : Integer.parseInt(request.getParameter("goodCnt"));
		
		BoardDAO dao = new BoardDAO();
		
		// 좋아요수 증가처리
		int res = dao.setBoardGoodCheck(idx, goodCnt);

		response.getWriter().write(res + "");
	}

}
