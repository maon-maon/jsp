package board;

import java.io.IOException;
import java.util.ArrayList;

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
			//241106 조회수 1증가 배열 처리 방법
			/*
			 * String search = request.getParameter("search")==null ? "" :
			 * request.getParameter("search"); String searchString =
			 * request.getParameter("searchString")==null ? "" :
			 * request.getParameter("searchString"); // 글 조회수 1씩 증가하기(중복 불허) HttpSession
			 * session = request.getSession(); ArrayList<String> contentArray =
			 * (ArrayList<String>) session.getAttribute("sContentArray"); if(contentArray ==
			 * null) contentArray = new ArrayList<String>(); String imsiContentArray =
			 * "board" + idx; if(!contentArray.contains(imsiContentArray)) {
			 * dao.setContentReadNumPlus(idx); contentArray.add(imsiContentArray); }
			 * session.setAttribute("sContentArray", contentArray);
			 */
		
		
		// 241106
		// 이전글/다음글 검색하기
		BoardVO preVo = dao.getPreNextSearch(idx, "pre"); // 동일 dao사용시 넘김 문자를 if로 구분해서 처리
		BoardVO nextVo = dao.getPreNextSearch(idx, "next");
		request.setAttribute("preVo", preVo);
		request.setAttribute("nextVo", nextVo);
		
		
		// 현재 게시글 VO에 담아오기
		BoardVO vo = dao.getBoardContent(idx);
		//System.out.println("BoardContentCommand vo: "+vo);
		
		request.setAttribute("vo", vo);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		
		
		// 241106
		// 댓글 처리
		ArrayList<BoardReplyVO>	replyVos = dao.getBoardReply(idx);
		request.setAttribute("replyVos", replyVos);
			
	}

}
