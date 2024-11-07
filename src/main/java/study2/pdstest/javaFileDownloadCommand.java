package study2.pdstest;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class javaFileDownloadCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdstest/"); //서블릿에선 ctp안써도 됨
		
		String fileName = request.getParameter("file")==null ? "" : request.getParameter("file");
		
		File file =  new File(realPath + fileName); //다운받으려는 정보
		
		/* HTTP프로토콜 형식에 맞도록 헤더에 전송할 파일의 정보를 담아준다. */
		//파일의 타입 정보를 줌
		String mimeType = request.getServletContext().getMimeType(file.toString());
		if(mimeType == null) response.setContentType("application/octet-stream"); //이지 바이나리 방식으로 응답해줌
		
		//사용하는 브라우저 방식에 맞춰야함
		String downloadName = "";
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
			downloadName = new String(fileName.getBytes("UTF-8"), "8859_1"); //String객체에 인코딩 기능이 있음 //getBytes:바이트 담위로 묶음
		}
		else {
			downloadName = new String(fileName.getBytes("EUC-KR"), "8859_1"); 
		}
		
		//앞의 정보들을 추출(확인)하여 헤더에 첨부...
		response.setHeader("Content-Disposition", "attachment;filename="+downloadName);
		
		//파일이동 : 서버=인풋스트림 / 클라이언트=아웃풋스트림
		/* 서버-서버:인풋-아웃풋(복붙) , 서로 다른 컴퓨터(클라이언드) 파일인풋-서블릿아웃풋 으로 사용*/
		// 객체 2개 생성 
 		FileInputStream fis = new FileInputStream(file); // 파일을 넘길 준비
 		//FileOutputStream fos = null;
 		ServletOutputStream sos = response.getOutputStream(); //사용자가 받을 준비: http통신개념=response
 		//2k 단위로 묶어서 전송 : 2k,4k오류가 가장 적음
 		
 		byte[] buffer = new byte[2048];
 		int size = 0;
 		while((size = fis.read(buffer)) != -1) { // 자료가 있을 때까지 반복
 			sos.write(buffer, 0, size); // 0부터 sizs까지 적어라
 		} //퍼센테이지로 파일전송된느 화면이 이 부분
 		// 사용후 반납해야함
 		sos.flush(); // 남은 찌꺼기까지 다 보내는 명령어
 		sos.close();
 		fis.close();
	}
}
