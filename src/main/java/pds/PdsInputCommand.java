package pds;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PdsInputCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String part = request.getParameter("part")==null ? "" : request.getParameter("part");
		int pag = (request.getParameter("pag")==null || request.getParameter("pag").equals("")) ? 1 : Integer.parseInt(request.getParameter("pag")); 
		int pageSize = (request.getParameter("pageSize")==null || request.getParameter("pageSize").equals("")) ? 5 : Integer.parseInt(request.getParameter("pageSize"));
			
		request.setAttribute("part", part); 
		request.setAttribute("pag", pag); 
		request.setAttribute("pageSize", pageSize); 
	}

}
