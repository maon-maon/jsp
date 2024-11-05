package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardGoodCheck3Command implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		BoardDAO dao = new BoardDAO();
		
		// 좋아요수 증가처리(중복불허)
		HttpSession session = request.getSession();
		ArrayList<String> contentGood = (ArrayList<String>)session.getAttribute("sContentGood");
		if(contentGood == null)contentGood = new ArrayList<String>(); //contentGood 최초 생성
		String imsicontentGood = "board"+idx;
		int res = 0;
		String goodBtn = "";
		if(!contentGood.contains(imsicontentGood)) {
			res = dao.setBoardGoodCheck(idx, 1);
			contentGood.add(imsicontentGood); 
			goodBtn = "OK"; // 보ㅓ튼 클릭하면 내용이 바뀌고 세션에 올려서 다음버넹 동일 내용이 있으면 색깔 바뀜?/ 버튼 클릭시 색깔바뀤
		}
		session.setAttribute("sContentGood", contentGood); // 세션 sContentGood에 저장
		
		//int res = dao.setBoardGoodCheck(idx, 1);
	

		response.getWriter().write(res + "");

	}

}
