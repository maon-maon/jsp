package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DoInputOkCommend implements DoInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 DoInputOkCommend 입니다");
		
		//앞의 회원가입시 등록된 자료를 모두 받아서 유효성 검사후 DB에 저장완료시킨다.
		
		request.setAttribute("message", "회원가입에 성공하셨십니다");
		request.setAttribute("msg", "DoInputOkCommend");
		
	}
}
