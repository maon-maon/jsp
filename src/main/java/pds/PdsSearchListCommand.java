package pds;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PdsSearchListCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String part = request.getParameter("part")==null ? "" : request.getParameter("part");
		
		PdsDAO  dao = new PdsDAO();

		ArrayList<PdsVO> vos = dao.getPdsSearchList(part);
		//System.out.println("ArrayList<PdsVO> vos : "+vos);
		request.setAttribute("vos", vos);
		request.setAttribute("part", part);
		
	}

}
