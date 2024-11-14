package study2.pdstest2;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class FileDownloadCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdstest");
		
		// 불러오는 파일은 객체취급= 파일객체 생성해야함
		String[] files =  new File(realPath).list(); // .list():배열로 파일명을 전부 읽어옴. ()안에 파일명이 들어감

//		for(String file: files) {
//			System.out.println("file : "+file);
//		}
		
		request.setAttribute("files", files);
		request.setAttribute("fileCount", files.length);
		
	}

}
