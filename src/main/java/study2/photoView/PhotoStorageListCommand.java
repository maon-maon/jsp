package study2.photoView;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class PhotoStorageListCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/photoView");
		
		String[] files = new File(realPath).list();
		
		request.setAttribute("files", files);
		request.setAttribute("fileCount", files.length);
	}

}
