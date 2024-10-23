package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface DoInterface {
	//작업지시할 추상메소드 작성
	public void execute (HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException;
}//ServletException 서블릿 예외처리, IOException 파일예외처리(이미지,자료 등)
