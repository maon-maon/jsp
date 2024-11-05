package admin.claim;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminDAO;
import admin.AdminInterface;

public class ClaimListCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminDAO dao = new AdminDAO();
		
		// 페이지 사이즈 버튼
		int pag = (request.getParameter("pag")==null || request.getParameter("pag").equals("")) ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = (request.getParameter("pageSize")==null || request.getParameter("pageSize").equals("")) ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		int totRecCnt = dao.getTotRecCnt();
		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize)+1;
		int startIndexNo = (pag -1) * pageSize;
		
		int curScrStartNo = (totRecCnt - startIndexNo);
		List<ClaimVO> vos = dao.getClaimList(startIndexNo, pageSize);

		// 블록페이징처리...(시작블록을 0으로 처리했다.) //3개 한묶음으로 공식임
		int blockSize = 3;
		int curBlock = (pag -1) / blockSize;
		int lastBlock = (totPage -1) / blockSize;
		
		
		
		//List<ClaimVO> vos = dao.getClaimList();
		
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
