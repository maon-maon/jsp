package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DoUpdateCommend implements DoInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 DoUpdateCommend execute메소드입니다.");
		request.setAttribute("msg2", "DoUpdateCommend");
	}

}
