package study2.pdstest2;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import common.JavaGroupProcess;
import study2.StudyInterface;

// 설정 어노테이션 사용 : 멀티파트 환경설정
@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 2, // 메모리에 저장되는 임시파일 크기 설정  //임시파일이므로 꽉차면 날리고 다시 쓰고를 반복. 다른 서버가 느려지는것 방지
	maxFileSize = 1024 * 1024 * 5,   // 1개 파일 업로드시의 최대용량
	maxRequestSize = 1024 * 1024 * 20  // 한번에 전송할 수 있는 최대용량 //여러개는 리퀘스트에서 가져옴 
)
/* (안에 인자 넣어서 사용) */

//@WebServlet("/FileUpload5Ok")
public class FileUpload5Ok extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdstest/");
		//pdstest 부분을 변수로 받아서 처리하면 공통으로 사용할 떄 중복을 방지할 수 있음
		
		// request 객체 getPart()메소드의 사용. Part클래스 타입으로 선언한다.
		Part filePart = request.getPart("fName");
		String fileName = filePart.getSubmittedFileName(); // 파일 이름꺼내는 함수사용
		//클라이언트에 있는걸(인푹) 객체로 가져와 서버에(아웃풋)
		InputStream fis = filePart.getInputStream();
		// 파일명+업로드날짜시간(초단위까지) : 파일이 겹치지 않음= 파일 업로드 사용자가 많아지면 1/1000초까지 나눠서 등록
		
		
		// 파일명 중복방지처리(날짜를 이용...)
		// 캘린더 객체는 싱글톤,내장객체라서 getInstance()로 호출해서 사용 열거형상수(첫글자 대문자)로 바로 꺼내 쓸 수 있음
		/*
		 * Calendar cal = Calendar.getInstance(); int yy = cal.get(Calendar.YEAR); int
		 * mm = cal.get(Calendar.MONTH)+1; int dd = cal.get(Calendar.DAY_OF_MONTH); int
		 * hh = cal.get(Calendar.HOUR_OF_DAY); int mi = cal.get(Calendar.MINUTE); int ss
		 * = cal.get(Calendar.MILLISECOND); //MILLISECOND= 날짜:20241108 10:15:538 //날짜부분
		 * 처리하는 클래스 만들어서 메소드 호출해서 사용. 공통으로 빼서 사용하면 좋음 String strMM=mm+"", strDD=dd+"",
		 * strHH=hh+"", strMI=mi+"", strSS=ss+"", temp="";
		 * 
		 * if(mm < 10) strMM = "0" + mm; if(dd < 10) strDD = "0" + dd; if(hh < 10) strHH
		 * = "0" + hh; if(mi < 10) strMI = "0" + mi; if(ss < 10) strSS = "0" + ss;
		 * 
		 * temp = yy + strMM + strDD + strHH + strMI + strSS;
		 * //System.out.println("날짜 : " + yy + strMM + strDD +"_"+ strHH + strMI + strSS
		 * );
		 * 
		 * // 중복방지를 위한 파일명 조합하기(파일형식 : 중복방지코드_파일명.확장자) fileName = temp + "_" + fileName;
		 * //System.out.println("fileName : "+fileName);
		 */	
		// 파일명 중복방지처리(날짜를 이용...)
		JavaGroupProcess jgp = new JavaGroupProcess();
		String temp = jgp.getTimeBasedFileName();
		
		// 중복방지를 위한 파일명 조합하기(파일형식 : 중복방지코드_파일명.확장자)
		fileName = temp + "_" + fileName;
		//System.out.println("fileName : "+fileName);
			
		
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
 		
 		request.setAttribute("message", "파일이 업로드 되었습니다.");
		request.setAttribute("url", "FileUpload5.st");
		
		String viewPage = "/include/message.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
