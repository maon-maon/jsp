package study2.pdstest;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

public class FileUpload3OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdstest");
		int maxSize = 1024 * 1024	* 20;	// 1024Byte=1KB=2^10 , 1MB=1024KBte=2^20Byte=1024B*1024B
		String encoding = "UTF-8";
		
		// 파일 업로드 처리...(객체 생성과 동시에 자동 업로드)
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// 업로드된 파일의 정보를 추출한다.
		Enumeration fileNames = multipartRequest.getFileNames(); //덩어리파일을 추출해서 업로드/저장파일명을 각각 확인
		
		String file = "";
		String ofName = "";
		String fsName = "";
		
		while(fileNames.hasMoreElements()) { //hasMoreElements=자료가 있으면 true
			file = (String)fileNames.nextElement(); //시작줄에서 다음으로 내려가 정보를 봄 //변수에 담아서 사용
			ofName += multipartRequest.getOriginalFileName(file) + "/";
			fsName += multipartRequest.getFilesystemName(file)+ "/";
		}
		ofName.subSequence(0, ofName.lastIndexOf("/"));
		fsName.subSequence(0, fsName.lastIndexOf("/"));
		
		//System.out.println("원본 파일명 집합 : "+ofName);
		//System.out.println("서버 파일명 집합 : "+fsName);
		//System.out.println("fName : " + multipartRequest.getParameter("fNames"));
		
		if(!ofName.equals("")) {
			request.setAttribute("message", "파일 업로드 완료");
		}
		else {
			request.setAttribute("message", "파일 업로드 실패");
		}
		request.setAttribute("url", "FileUpload3.st");
		
	}

}
