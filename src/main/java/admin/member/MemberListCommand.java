package admin.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminInterface;
import guest.GuestVO;
import member.MemberDAO;
import member.MemberVO;

public class MemberListCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int level = (request.getParameter("level")==null || request.getParameter("level").equals("")) ? 999 : Integer.parseInt(request.getParameter("level"));
		//int pageSize = (request.getParameter("pageSize")==null || request.getParameter("pageSize").equals("")) ? 999 : Integer.parseInt(request.getParameter("pageSize"));
		
		MemberDAO dao = new MemberDAO();

		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag")); 
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize")); 
		int totRecCnt = dao.getTotRecCnt(level); // 여기서 레벨을 넘겨야 함
		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize)+1;
		int startIndexNo = (pag - 1) * pageSize;
		//여기까지 백에서 작업이 끝남
		// 뷰에서 보여주는 부분
		int curScrStartNo = (totRecCnt - startIndexNo); 
		// 한페이지에 표시할 건수만을 DB에서 검색하여 가져온다.
		ArrayList<MemberVO> vos = dao.getMemberList(startIndexNo, pageSize, level); // 시작인덱스넘버와 페이지사이즈를 넘겨서 가져옴
		
		// 블록페이징처리...(시작블록을 0으로 처리했다.) //3개 한묶음으로 공식임
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

		request.setAttribute("level", level);
		
	}

}
