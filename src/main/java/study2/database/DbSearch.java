package study2.database;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/study2/database/DbSearch")
public class DbSearch extends HttpServlet{
 @Override
 protected void service(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
	 //18
	 //String name = request.getParameter("name")==null ? "" : request.getParameter("name");
	 //31
	 int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
	 
	 DbTestDAO dao = new DbTestDAO();
	 
	 DbTestVO vo = dao.getDbTestSearch(idx); //검색메소드 1번쨰거 1개만 가져옴 //dao객체 안에 데이터 1개만 가져옴
	 //변수 idx 넣고-> 체인지
	 //20 서치는 1건만 사용하는세 맞지만 편의상 이거 씀
	 //ArrayList<DbTestVO> vos =  dao.getDbTestSearch(name); //
	 
	 request.setAttribute("vo", vo);
	 
	 
	 String viewPage ="/WEB-INF/study2/database/dbUpdate.jsp";
	 RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
	 dispatcher.forward(request, response);
 }
}
