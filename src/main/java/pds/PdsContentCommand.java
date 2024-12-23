package pds;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PdsContentCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String part = request.getParameter("part")==null ? "" : request.getParameter("part");
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		int pag = (request.getParameter("pag")==null || request.getParameter("pag").equals("")) ? 1 : Integer.parseInt(request.getParameter("pag")); 
		int pageSize = (request.getParameter("pageSize")==null || request.getParameter("pageSize").equals("")) ? 5 : Integer.parseInt(request.getParameter("pageSize"));
			
		
		PdsDAO dao = new PdsDAO();
		
		PdsVO vo =  dao.getPdsContent(idx);
		//System.out.println("vovovovo    "+vo);
		
		request.setAttribute("vo", vo);
		request.setAttribute("part", part);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
	}

}
