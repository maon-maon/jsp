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
@WebServlet("/study2/database/DbList")
public class DbList extends HttpServlet{
 @Override
 protected void service(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
	 //23 DbSearch에서 아래의 변수 가져옴
	 String name = request.getParameter("name")==null ? "" : request.getParameter("name");
	 
	 //System.out.println("sdfsdsdf");
	 //6. DAO->DBList
	 DbTestDAO dao = new DbTestDAO();
	 
	 //7. 테이블 형식에 맞는 vo만들기(원래는 db만들고 바로vo만들어야 함)->class파일 생성
	 //9.
	// DbTestVO vo = dao.getDbTestSearch(); //dao객체 안에 데이터 1개만 가져옴
	 //13
	 ArrayList<DbTestVO> vos =  dao.getDbTestList(name); //23 파라메터 체인지
	 
	 
//	 request.setAttribute("vo", vo);
	 request.setAttribute("vos", vos);
	 
	 
	 String viewPage ="/WEB-INF/study2/database/dbList.jsp";
	 RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
	 dispatcher.forward(request, response);
 }
}
