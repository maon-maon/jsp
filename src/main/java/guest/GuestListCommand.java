package guest;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestListCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		guestDAO dao = new guestDAO();
		
		//페이징처리
		// 1. 현재 페이지 번호를 구한다.(pag)
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag")); //페이지 값이 없으면 시작은 1임
		
		// 2. 한페이지 분량을 구한다.. (pageSize)
		//int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize")); 
		int pageSize = request.getParameter("pageSize")==null ? 3 : Integer.parseInt(request.getParameter("pageSize")); 
		
		// 3. 총 레코드 건수를 구한다(totRecCnt) -sql명령어 중 count함수 이용
		int totRecCnt = dao.getTotRecCnt(); //dao에서 값을 가져옴 sql이라서
		
		// 4. 총 페이지 건수를 구한다ㅣ(totPage)
		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize)+1;
		
		// 5. 현재 페이지에서 출력되는 시작인덱스 번호를 구한다(startIndexNo)
		int startIndexNo = (pag - 1) * pageSize;
		
		// 6. 현재 표시할 화면에서 시작되는 시작번호를 구한다.(curScrStartNo)
		int curScrStartNo = (totRecCnt - startIndexNo);
		
		// 한페이지에 표시할 건수만을 DB에서 검색하여 가져온다.
		List<GuestVO> vos = dao.getGuestList(startIndexNo, pageSize); // 시작인덱스넘버와 페이지사이즈를 넘겨서 가져옴
		
		// 블록페이징처리...(시작블록을 0으로 처리했다.) //3개 한묶음으로 공식임
		// 1.블록의 크기결정(여기선 3으로 결정)
		int blockSize = 3;
		
		// 2.현재 페이지가 속한 블록의 번호를 구한다.(예: 총레코드수가 38개일 경우, 1페이지분향 5개라면, 총페이지수는 8개이다.)
		// 		이때 0블록은 '1/2/3', 1블록은 '4/5/6', 2블록은 '7/8' 
		int curBlock = (pag -1) / blockSize;
		
		// 3.마지막 블록을 구한다.
		int lastBlock = (totPage -1) /blockSize;
		
		
		
		
		request.setAttribute("vos", vos); 
		//request.setAttribute("guestCnt", vos.size()); //전체글의 갯수를 파악하기 위해 vos의 사이즈 확인 
		request.setAttribute("pag", pag); 
		request.setAttribute("pageSize", pageSize); 
		request.setAttribute("totRecCnt", totRecCnt); 
		request.setAttribute("totPage", totPage); 
		//request.setAttribute("startIndexNo", startIndexNo); //화면에 출력할 떈 필요없음. 뷰로 안 보내도 됨 
		request.setAttribute("curScrStartNo", curScrStartNo); 
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
	}
}
