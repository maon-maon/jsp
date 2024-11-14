package study2.pdstest2;

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
		//멀티파트로 넘어온걸 멀티파트로 받아야함
		String realPath = request.getServletContext().getRealPath("/images/pdstest"); // 절대경로를 변수에 담아둠
		int maxSize = 1024 * 1024 *10; //10MB // 1024Byte=1KB=2^10 , 1MB=1024KBte=2^20Byte=1024B*1024B
		String encoding = "utf-8";
		
		
		//파일 업로드 처리...(객체 생성과 동시에 자동 업로드) // 4개필수+1개참고
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		//변수에 담은 기능까지 담아서 처리
		
		// 업로드된 파일의 정보를 추출시켜본다.
		String originalFileName1 = multipartRequest.getOriginalFileName("fName1");
		String originalFileName2 = multipartRequest.getOriginalFileName("fName2");
		String originalFileName3 = multipartRequest.getOriginalFileName("fName3");
		String filesystemName1 = multipartRequest.getFilesystemName("fName1");
		String filesystemName2 = multipartRequest.getFilesystemName("fName2");
		String filesystemName3 = multipartRequest.getFilesystemName("fName3");
		/* 서버에 원본이름과 서버저장명이 둘다 저장되어야함.
		 * 1.찾을 때는 원본명으로 찾으므로 서버장명을 같이 알고 있어야 찾을 수 있음.
		 * 2.다운로드시 중복된 이름이 아닌 원본의 이름으로 받아야 함 */
		
//		System.out.println("원본 파일명1 : " + originalFileName1);
//		System.out.println("서버에 저장된 파일명1 : " + filesystemName1);
//		System.out.println("원본 파일명2 : " + originalFileName2);
//		System.out.println("서버에 저장된 파일명2 : " + filesystemName2);
//		System.out.println("원본 파일명3 : " + originalFileName3);
//		System.out.println("서버에 저장된 파일명3 : " + filesystemName3);
//		System.out.println("서버에 저장된 파일경로 : " + realPath);

//		String nickName = request.getParameter("nickName");
//		//받을 때 request로 받으면 닉네임 출력안됨
//		System.out.println("nickName : " + nickName);
		//String nickName = multipartRequest.getParameter("nickName"); // 파일이1개라도 있음 무조건 multipartRequest
		//System.out.println("nickName : " + nickName);
		
		
		
		// BackEnd 파일체크
		if(originalFileName1 != null && !originalFileName1.equals("") && originalFileName2 != null && !originalFileName2.equals("") && originalFileName3 != null && !originalFileName3.equals("")) {
				request.setAttribute("message", "파일 전송 완료");
		}
		else {
			request.setAttribute("message", "파일 전송 실패");
		}
		
		request.setAttribute("url", "FileUpload2.st");
		
		
		
	}

}
