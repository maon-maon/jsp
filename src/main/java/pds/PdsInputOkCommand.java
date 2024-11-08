package pds;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class PdsInputOkCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pds");
		int maxSize = 1024 * 1024	* 30;	// 1024Byte=1KB=2^10 , 1MB=1024KBte=2^20Byte=1024B*1024B
		String encoding = "UTF-8";
		
		// 파일 업로드 처리...(객체 생성과 동시에 자동 업로드)
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// 업로드된 파일의 정보를 추출해본다.
		Enumeration fileNames = multipartRequest.getFileNames();
		
		String file = "";
		String ofName = "";
		String fsName = "";
		while(fileNames.hasMoreElements()) {
			file = (String) fileNames.nextElement();
			
			if(multipartRequest.getFilesystemName(file) != null) { 
				ofName += multipartRequest.getOriginalFileName(file) + "/";
				fsName += multipartRequest.getFilesystemName(file) + "/";
			}
		}
		ofName = ofName.substring(0, ofName.lastIndexOf("/"));
		fsName = fsName.substring(0, fsName.lastIndexOf("/"));
		
//		System.out.println("원본 파일명 집합 : " + ofName);
//		System.out.println("서버 파일명 집합 : " + fsName);
		
		// 업로드시킨 파일을 DB에 저장처리(1.변수저장처리, 2:vo담기, 3:DB저장하기)
		String mid = multipartRequest.getParameter("mid")==null ? "" : multipartRequest.getParameter("mid");
		String nickName = multipartRequest.getParameter("nickName")==null ? "" : multipartRequest.getParameter("nickName");
		int fSize = (multipartRequest.getParameter("fSize")==null || multipartRequest.getParameter("fSize").equals("")) ? 0 : Integer.parseInt(multipartRequest.getParameter("fSize"));
		String part = multipartRequest.getParameter("part")==null ? "" : multipartRequest.getParameter("part");
		String title = multipartRequest.getParameter("title")==null ? "" : multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content")==null ? "" : multipartRequest.getParameter("content");
		String openSw = multipartRequest.getParameter("openSw")==null ? "" : multipartRequest.getParameter("openSw");
		String hostIp = multipartRequest.getParameter("hostIp")==null ? "" : multipartRequest.getParameter("hostIp");
		
		PdsVO vo = new PdsVO();
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setfName(ofName);
		vo.setfSName(fsName);
		vo.setfSize(fSize);
		vo.setPart(part);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setOpenSw(openSw);
		vo.setHostIp(hostIp);
		//System.out.println("vo : " + vo);
		PdsDAO dao = new PdsDAO();
		int res = dao.setPdsInputOk(vo);
		
		if(res != 0) {
			request.setAttribute("message", "자료실에 자료가 업로드 되었습니다.");
			request.setAttribute("url", "PdsList.pds");
		}
		else {
			request.setAttribute("message", "업로드 실패~~");
			request.setAttribute("url", "PdsInput.pds");
		}
	}

}
