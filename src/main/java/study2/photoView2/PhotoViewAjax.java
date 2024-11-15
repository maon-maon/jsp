package study2.photoView2;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import common.JavaGroupProcess;

@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 2, // 메모리에 저장되는 임시파일 크기 설정  //임시파일이므로 꽉차면 날리고 다시 쓰고를 반복. 다른 서버가 느려지는것 방지
	maxFileSize = 1024 * 1024 * 5,   // 1개 파일 업로드시의 최대용량
	maxRequestSize = 1024 * 1024 * 20  // 한번에 전송할 수 있는 최대용량 //여러개는 리퀘스트에서 가져옴 
)
@SuppressWarnings("serial")
//@WebServlet("/PhotoViewAjax")
public class PhotoViewAjax extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String res = "0";
		String realPath = request.getServletContext().getRealPath("/images/photoView/");

		Part filePart = request.getPart("fName");
		String fileName = filePart.getSubmittedFileName(); // 파일 이름꺼내는 함수사용
		
		if(fileName !=null && !fileName.isEmpty()) { //정상적으로 파일이 들어오면 처
			InputStream fis = filePart.getInputStream();
			
			// 파일명 중복방지처리(UUID활용)
			String uid = UUID.randomUUID().toString().substring(0,8); //난수 발생
			
			// 중복방지를 위한 파일명 조합하기(파일형식 : 파일명_중복방지코드.확장자)
			fileName = fileName.substring(0, fileName.lastIndexOf(".")) +"_"+ uid + fileName.substring(fileName.lastIndexOf("."));
				
			FileOutputStream fos = new FileOutputStream(realPath + fileName); // 서버저장객체 껍데기 생성
			
			// 생성된 객체이 파일의 내용을 2048Byte=2K씩 보내준다.
			byte[] buffer = new byte[2048];
			int size = 0;
	 		while((size = fis.read(buffer)) != -1) { //size가 비어있지 않을때까지 반복
	 			fos.write(buffer, 0, size); // 0부터 sizs까지 적어라
	 		}
	 		fos.flush(); // 남은 찌꺼기까지 다 보내는 명령어
	 		fos.close();
	 		fis.close();
	 		
	 		res = fileName;
		}
 		/*-----------------------------------------*/
		
		response.getWriter().write(res);
	}
}
