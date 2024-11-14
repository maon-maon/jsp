package study2.photoView;

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

@SuppressWarnings("serial")
@WebServlet("/PhotoViewAjax")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 2,	// 메모리에 저장되는 임시파일크기 설정
		maxFileSize = 1024 * 1024 * 5,		// 1개 파일 업로드시의 최대용량
		maxRequestSize = 1024 * 1024 * 20	// 한번에 전송할수 있는 최대용량
)
public class PhotoViewAjax extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String res = "0";
		String realPath = request.getServletContext().getRealPath("/images/photoView/");
		
		Part filePart = request.getPart("fName");
		String fileName = filePart.getSubmittedFileName();
		
		if(fileName != null && !fileName.isEmpty()) {
			InputStream fis = filePart.getInputStream();
			
			// 파일명 중복방지처리(UUID활용)
			String uid = UUID.randomUUID().toString().substring(0,8);
			
			// 중복방지를 위한 파일명 조합하기(파일형식: 파일명_중복방지코드.확장자)
			fileName = fileName.substring(0, fileName.lastIndexOf(".")) + "_" + uid + fileName.substring(fileName.lastIndexOf("."));
			
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
			
			res = fileName;
		}
		
		response.getWriter().write(res);
	}
}
