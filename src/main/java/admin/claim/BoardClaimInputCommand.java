package admin.claim;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminDAO;
import admin.AdminInterface;

public class BoardClaimInputCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String part = request.getParameter("part")==null ? "" : request.getParameter("part");
		int partIdx = (request.getParameter("partIdx")==null || request.getParameter("partIdx").equals("")) ? 0 : Integer.parseInt(request.getParameter("partIdx"));
		String claimMid = request.getParameter("claimMid")==null ? "" : request.getParameter("claimMid");
		String claimContent = request.getParameter("claimContent")==null ? "" : request.getParameter("claimContent");
		
		ClaimVO vo = new ClaimVO();
		
		vo.setPart(part);
		vo.setPartIdx(partIdx);
		vo.setClaimMid(claimMid);
		vo.setClaimContent(claimContent);
		
		AdminDAO dao = new AdminDAO();
		
		int res = dao.setBoardClaimInput(vo);
		
		
		
		
		
		response.getWriter().write(res + "");
		
		

	}

}
