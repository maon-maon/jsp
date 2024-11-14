package study2.pdstest;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;

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

@WebServlet("/FileUpload5Ok")
public class FileUpload5Ok extends HttpServlet {

	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdstest/");
		
		// request 객체안의 getPart()메소드 사용. Part클래스 타입으로 선언한다.
		Part filePart = request.getPart("fName");
		String fileName = filePart.getSubmittedFileName();
		InputStream fis = filePart.getInputStream();
		
		// 파일명 중복방지처리(날짜를 이용...)
		JavaGroupProcess jgp = new JavaGroupProcess();
		String temp = jgp.getTimeBasedFileName();
		
		// 중복방지를 위한 파일명 조합하기(파일형식: 중복방지코드_파일명.확장자)
		fileName = temp + "_" + fileName;
		//System.out.println("fileName : " + fileName);
		
		FileOutputStream fos = new FileOutputStream(realPath + fileName);
		
		// 생성된 객체에 파일의 내용을 2048Byte씩 보내어준다.
		byte[] buffer = new byte[2048];
		int size = 0;
		while((size=fis.read(buffer)) != -1) {
			fos.write(buffer, 0, size);
		}
		fos.flush();
		fos.close();
		fis.close();
		
		request.setAttribute("message", "파일이 업로드 되었습니다.");
		request.setAttribute("url", "FileUpload5.st");
		
		String viewPage = "/include/message.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
