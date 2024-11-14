package study2.pdstest2;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class FileDeleteCheckCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] selectFileArray = request.getParameter("selectFileArray").split("/");
		
		String realPath = request.getServletContext().getRealPath("/images/pdstest/");
		
		String res = "0";
		for(int i=0; i<selectFileArray.length; i++) {
			File file = new File(realPath+selectFileArray[i]);
			if(file.exists()) {
				file.delete();
				res = "1";
			}
		}
		
		response.getWriter().write(res);
	}

}
