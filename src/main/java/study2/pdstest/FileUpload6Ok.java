package study2.pdstest;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import common.JavaGroupProcess;

@SuppressWarnings("serial")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 2,	// 메모리에 저장되는 임시파일크기 설정
		maxFileSize = 1024 * 1024 * 5,		// 1개 파일 업로드시의 최대용량
		maxRequestSize = 1024 * 1024 * 20	// 한번에 전송할수 있는 최대용량
)

@WebServlet("/FileUpload6Ok")
public class FileUpload6Ok extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdstest/");
		
		ArrayList<Part> fileParts = (ArrayList<Part>) request.getParts();
		
		for(Part filePart : fileParts) {
			if(!filePart.getName().equals("fName")) continue;
			if(filePart.getSize() == 0) continue;
			
			String fileName = filePart.getSubmittedFileName();
			InputStream fis = filePart.getInputStream();
			
			JavaGroupProcess jgp = new JavaGroupProcess();
			String temp = jgp.getTimeBasedFileName();
			
			fileName = temp + "_" + fileName;
			
			FileOutputStream fos = new FileOutputStream(realPath + fileName);
			
			byte[] buffer = new byte[2048];
			int size = 0;
			while((size=fis.read(buffer)) != -1) {
				fos.write(buffer, 0, size);
			}
			fos.flush();
			fos.close();
			fis.close();
		}
		
		request.setAttribute("message", "파일이 업로드 되었습니다.");
		request.setAttribute("url", "FileUpload6.st");
		
		String viewPage = "/include/message.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
