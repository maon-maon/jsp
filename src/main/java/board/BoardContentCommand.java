package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardContentCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = (request.getParameter("pag")==null || request.getParameter("pag").equals("")) ? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = (request.getParameter("pageSize")==null || request.getParameter("pageSize").equals("")) ? 0 : Integer.parseInt(request.getParameter("pageSize"));
		//System.out.println("BoardContentComman pageSize: "+pageSize);
		BoardDAO dao = new BoardDAO();
		
		HttpSession session = request.getSession();
		
		String idxstr = idx+"board"; // 값이 들어갔는지 체크 : 게시글의 번호를 글로 변환하여 누적하는데 사용
		String sIdx = session.getAttribute("sIdx")==null ? "" : (String)session.getAttribute("sIdx"); //최초 접속시 null임
		
		if(sIdx.indexOf(idxstr)== -1) { // sIdx에 idxstr변수에 들어가 있는 번호가 있으면 통과/ 없으면 if문 진행
			// 글 조회수 1씩 증가하기
			dao.setContentReadNumPlus(idx);
			sIdx += idxstr+"board"; // sIdx에 idxstr의 번호를 계속 누적할 때 구분하기 위해서 "/"를 삽입
			session.setAttribute("sIdx", sIdx); // 클릭한 게시글의 idx번호가 누적된 sIdx가 변수sIdx에 저장됨. 세션이 끊기기 전까지 이어짐
		}
		
		
		

		BoardVO vo = dao.getBoardContent(idx);
		//System.out.println("BoardContentCommand vo: "+vo);
		
		request.setAttribute("vo", vo);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
	}

}
