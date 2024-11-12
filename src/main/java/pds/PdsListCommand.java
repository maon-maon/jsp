package pds;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardVO;

public class PdsListCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		PdsDAO dao = new PdsDAO();
//		ArrayList<PdsVO> vos = dao.getPdsList();
//		request.setAttribute("vos", vos);
		
		String part = request.getParameter("part")==null ? "전체" : request.getParameter("part");
		
		PdsDAO dao = new PdsDAO();
		int pag = (request.getParameter("pag")==null || request.getParameter("pag").equals("")) ? 1 : Integer.parseInt(request.getParameter("pag")); 
		int pageSize = (request.getParameter("pageSize")==null || request.getParameter("pageSize").equals("")) ? 5 : Integer.parseInt(request.getParameter("pageSize"));
			
		int totRecCnt = dao.getTotRecCnt(part); // border의 전체 갯수 확인
		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize)+1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = (totRecCnt - startIndexNo); 
		List<PdsVO> vos = dao.getPdsList(startIndexNo, pageSize, part);

		//System.out.println("BoardListComman pag: "+ pag+",pageSize: "+ pageSize);
		
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
		
		request.setAttribute("part", part);
	}

}
