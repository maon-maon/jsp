package study2.pdstest2;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class FileDeleteCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fileName = request.getParameter("fileName")==null ? "" : request.getParameter("fileName");
		
		String realPath = request.getServletContext().getRealPath("/images/pdstest/"); // /하나라도 없으면 오류발생
		
		File file =  new File(realPath + fileName);
		
		String res = "0";
		if(file.exists()) {
			file.delete(); // 파일삭제 명령어
			res = "1";
		}
		
		
		response.getWriter().write(res);
		
	}

}
