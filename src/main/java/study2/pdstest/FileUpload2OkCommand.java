package study2.pdstest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

public class FileUpload2OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdstest");
		int maxSize = 1024 * 1024	* 10;	// 1024Byte=1KB=2^10 , 1MB=1024KBte=2^20Byte=1024B*1024B
		String encoding = "UTF-8";
		
		// 파일 업로드 처리...(객체 생성과 동시에 자동 업로드)
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// 업로드된 파일의 정보를 추출시켜본다.
		String originalFileName1 = multipartRequest.getOriginalFileName("fName1");
		String originalFileName2 = multipartRequest.getOriginalFileName("fName2");
		String originalFileName3 = multipartRequest.getOriginalFileName("fName3");
		String filesystemName1 = multipartRequest.getFilesystemName("fName1");
		String filesystemName2 = multipartRequest.getFilesystemName("fName2");
		String filesystemName3 = multipartRequest.getFilesystemName("fName3");
		
		System.out.println("원본 파일명1 : " + originalFileName1);
		System.out.println("원본 파일명2 : " + originalFileName2);
		System.out.println("원본 파일명3 : " + originalFileName3);
		System.out.println("서버에 저장된 파일명 : " + filesystemName1);
		System.out.println("서버에 저장된 파일명 : " + filesystemName2);
		System.out.println("서버에 저장된 파일명 : " + filesystemName3);
		System.out.println("서버에 저장된 파일경로 : " + realPath);
		
		//String nickName = request.getParameter("nickName");
		String nickName = multipartRequest.getParameter("nickName");
		System.out.println("nickName : " + nickName);
		
		// BackEnd 파일체크
		if(originalFileName1 != null && !originalFileName1.equals("") && originalFileName2 != null && !originalFileName2.equals("") && originalFileName3 != null && !originalFileName3.equals("")) {
			request.setAttribute("message", "파일 전송 완료!!");
		}
		else {
			request.setAttribute("message", "파일 전송 실패~~~");
		}
		
		request.setAttribute("url", "FileUpload2.st");
	}

}
