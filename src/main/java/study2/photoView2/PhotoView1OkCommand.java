package study2.photoView2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

public class PhotoView1OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/photoView/"); // 절대경로를 변수에 담아둠
		int maxSize = 1024 * 1024 *10; //10MB // 1024Byte=1KB=2^10 , 1MB=1024KBte=2^20Byte=1024B*1024B
		String encoding = "utf-8";
		
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String originalFileName = multipartRequest.getOriginalFileName("fName"); //1개 정보 넘어올떄만
		String filesystemName = multipartRequest.getFilesystemName("fName");
		
		//System.out.println("원본 파일명 : " + originalFileName);
		//System.out.println("서버에 저장된 파일명 : " + filesystemName);
		//System.out.println("서버에 저장된 파일경로 : " + realPath);

		String content = (multipartRequest.getParameter("content")==null || multipartRequest.getParameter("content").equals("")) ? "내용없음" : multipartRequest.getParameter("content");
		// null을 항상 먼저 비교
		//System.out.println("content : " + content);
		
		
		
		// BackEnd 파일체크
		if(originalFileName != null && !originalFileName.equals("")) {
				request.setAttribute("message", "파일 전송 완료");
		}
		else {
			request.setAttribute("message", "파일 전송 실패");
		}
		
		request.setAttribute("url", "PhotoView.st");
		
	}

}
