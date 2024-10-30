package study2.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyDAO;
import study2.StudyInterface;

public class AjaxIdCheck1Command implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		StudyDAO dao = new StudyDAO();
		
		String name = dao.getIdSearch(mid);
		
		// 호출=새로고침개념=기존에 작성한 아이디가 사라짐 : 비동기식이 아님
		// 비동기식은 최종목적지를 주면 안됨. XMLHttp~의 헤더에 자료가 담겨있어야 함. 리퀘스트request.setAttribute 사용 못함
	// response사용 (req-res로 전달) 보낸함수에서 받는부분까지 있음. 호출=새로고침개념=동기식. 헤더=파라메타에 담아서 넘어감
		
		// 헤더에 담는 방법
		if(name.equals("")) {
			name = "찾는 아이디가 없습니다.";
		}
		response.getWriter().write(name);
		
	}

}
