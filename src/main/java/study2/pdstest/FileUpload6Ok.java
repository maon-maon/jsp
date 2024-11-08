package study2.pdstest;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import common.javaGroupProcess;
import study2.StudyInterface;

// 설정 어노테이션 사용 : 멀티파트 환경설정
@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 2, // 메모리에 저장되는 임시파일 크기 설정  //임시파일이므로 꽉차면 날리고 다시 쓰고를 반복. 다른 서버가 느려지는것 방지
	maxFileSize = 1024 * 1024 * 5,   // 1개 파일 업로드시의 최대용량
	maxRequestSize = 1024 * 1024 * 20  // 한번에 전송할 수 있는 최대용량 //여러개는 리퀘스트에서 가져옴 
)
/* (안에 인자 넣어서 사용) */

@WebServlet("/FileUpload6Ok")
public class FileUpload6Ok extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdstest/");
		//pdstest 부분을 변수로 받아서 처리하면 공통으로 사용할 떄 중복을 방지할 수 있음
		
		ArrayList<Part> fileParts = (ArrayList<Part>) request.getParts(); //fName안에 여러개가 들어 있음=>getParts:여러개 받을때
		//여러개 가져올때 컬렉션프레임웤의 어레이리스트로사용=강제형변환필수
		for(Part filePart : fileParts) {
			if(!filePart.getName().equals("fName")) continue; //fName이 아니면 건너뜀(=continue=for문으로 올라감=스킵)
			if(filePart.getSize() == 0) continue;  //파일사이즈가 0이면 스킵
			
			String fileName = filePart.getSubmittedFileName();
			//System.out.println("fileName : "+fileName);
			InputStream fis = filePart.getInputStream();
			
			javaGroupProcess jgp = new javaGroupProcess();
			String temp = jgp.getTimeBasedFileName();
			
			fileName = temp + "_" + fileName;
			
			FileOutputStream fos = new FileOutputStream(realPath + fileName);
			
			byte[] buffer = new byte[2048];
			int size = 0;
	 		while((size = fis.read(buffer)) != -1) { //size가 비어있지 않을때까지 반복
	 			fos.write(buffer, 0, size); // 0부터 sizs까지 적어라
	 		}
	 		fos.flush(); // 남은 찌꺼기까지 다 보내는 명령어
	 		fos.close();
	 		fis.close();
	 		
			/*안에 있으면 안 되야함. 난 왜 작동됨??
			 * request.setAttribute("message", "파일이 업로드 되었습니다.");
			 * request.setAttribute("url", "FileUpload6.st");
			 * 
			 * String viewPage = "/include/message.jsp"; RequestDispatcher dispatcher =
			 * request.getRequestDispatcher(viewPage); dispatcher.forward(request,
			 * response);
			 * 
			 */		
 		}
		request.setAttribute("message", "파일이 업로드 되었습니다.");
		request.setAttribute("url", "FileUpload6.st");
		
		String viewPage = "/include/message.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
