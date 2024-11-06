package admin.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminDAO;
import admin.AdminInterface;

public class BoardSelectDeleteCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idxSelectArray = request.getParameter("idxSelectArray")==null ? "" : request.getParameter("idxSelectArray");
		
		String[] idxSelectArrays = idxSelectArray.split("/");
		
		AdminDAO dao = new AdminDAO();
		
		String res = "0";
		for(String idxSelect : idxSelectArrays) {
			dao.setBoardSelectDelete(Integer.parseInt(idxSelect));
			res = "1";
		}
		response.getWriter().write(res);
	}

}
