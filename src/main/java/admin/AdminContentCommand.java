package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminContentCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		AdminDAO dao = new AdminDAO();
		
		int newGuestCnt = dao.getNewGuestCnt();
		
		int newBoardCnt = dao.getNewBoardCnt();
		
		int newClaimCnt = dao.getNewClaimCnt();
		
		int newJoinCnt = dao.getNewJoinCnt();
		
		int newUserDelCnt = dao.getNewUserDelCnt();
		
		request.setAttribute("newGuestCnt", newGuestCnt);
		request.setAttribute("newBoardCnt", newBoardCnt);
		request.setAttribute("newClaimCnt", newClaimCnt);
		request.setAttribute("newJoinCnt", newJoinCnt);
		request.setAttribute("newUserDelCnt", newUserDelCnt);
	}

}
