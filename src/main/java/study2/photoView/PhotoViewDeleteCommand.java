package study2.photoView;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class PhotoViewDeleteCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String flag=request.getParameter("flag")==null ? "" : request.getParameter("flag");
		String fileName=request.getParameter("fileName")==null ? "" : request.getParameter("fileName");
		String selectFile = request.getParameter("selectFile")==null ? "" : request.getParameter("selectFile");
		String[] selectFileArray = selectFile.split("/");
		
		String realPath = request.getServletContext().getRealPath("/images/photoView/");
		
		String res = "0";
		
		if(flag.equals("s")) {
			new File(res).delete();
			res = "1";
		}
		else {
			for(int i=0; i<selectFileArray.length; i++) {
				File file = new File(realPath+selectFileArray[i]);
				if(file.exists()) {
					file.delete();
					res = "1";
				}
			}
		}
		response.getWriter().write(res);
	}

}
