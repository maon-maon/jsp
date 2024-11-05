package board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardSearchListCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search")==null ? "" : request.getParameter("search");
		String searchString = request.getParameter("searchString")==null ? "" : request.getParameter("searchString");
		
		BoardDAO dao = new BoardDAO();
		
		List<BoardVO> vos = dao.getBoardSearchList(search, searchString);
		
		String searchTitle = "";
		if(search.equals("title")) searchTitle = "글제목";
		else if(search.equals("nickName")) searchTitle = "작성자";
		else searchTitle = "글내용";
		
		request.setAttribute("vos", vos);
		request.setAttribute("searchCnt", vos.size()); //검색 갯수=size
		request.setAttribute("searchTitle", searchTitle);
		request.setAttribute("searchString", searchString);
		
	}

}
