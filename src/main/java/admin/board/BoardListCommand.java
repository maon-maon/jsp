package admin.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminInterface;
import board.BoardDAO;
import board.BoardVO;

public class BoardListCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag")); 
		int pageSize = request.getParameter("pageSize")==null ? 10 : Integer.parseInt(request.getParameter("pageSize")); 
		int totRecCnt = dao.getTotRecCnt(); // border의 전체 갯수 확인
		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize)+1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = (totRecCnt - startIndexNo); 
		List<BoardVO> vos = dao.getBoardList(startIndexNo, pageSize); // 시작인덱스넘버와 페이지사이즈를 넘겨서 가져옴 //999를 넘기면 저체페이지 나옴= 일반회원은 전체 목록만 보면 됨
		
		int blockSize = 3;
		int curBlock = (pag -1) / blockSize;
		int lastBlock = (totPage -1) /blockSize;
		
		
		request.setAttribute("vos", vos); 
		request.setAttribute("pag", pag); 
		request.setAttribute("pageSize", pageSize); 
		request.setAttribute("totRecCnt", totRecCnt); 
		request.setAttribute("totPage", totPage); 
		request.setAttribute("curScrStartNo", curScrStartNo); 
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);

	}

}
