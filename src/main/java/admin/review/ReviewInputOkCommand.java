package admin.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminDAO;
import admin.AdminInterface;

public class ReviewInputOkCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String part = request.getParameter("part")==null ? "" : request.getParameter("part");
		int partIdx = (request.getParameter("partIdx") == null || request.getParameter("partIdx").equals("")) ? 0 : Integer.parseInt(request.getParameter("partIdx"));
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");
		int star = (request.getParameter("star") == null || request.getParameter("star").equals("")) ? 0 : Integer.parseInt(request.getParameter("star"));
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		
		ReviewVO vo = new ReviewVO();
		
		vo.setPart(part);
		vo.setPartIdx(partIdx);
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setStar(star);
		vo.setContent(content);
		
		AdminDAO dao = new AdminDAO();
		
		int res = 0;
		String str = "";
		res = dao.getReviewSearch(vo);
		if(res != 0) str = "현재 게시물에 이미 리뷰작성을하셨습니다.";
		else {
			res = dao.getReviewInputOk(vo);
			if(res != 0) str = "리뷰가 등록되었습니다.";
			else str = "리뷰 작성 실패~~";
		}
		
		response.getWriter().write(str);
	}

}
