package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DoUpdateOkCommend implements DoInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 DoUpdateOkCommend 입니다");

		// 수정처리한 정보들을 DB에 다시 업데이트 처리하고 돌아온다.
		
		request.setAttribute("message", "회원정보가 수정되었습니다."); //인클루드의 message.jsp의 ${message}변수에 보낼 값
		request.setAttribute("url", "/study2/mapping/Test2"); //인클루드message.jsp의 ${url}변수에 보낼 값
		// 값은 종착지까지 가는 직행열차에 짐만 올리는 것=dispatcher. 돌아가는 장소 없음. 그냥 데이터를 저장소에 올리기 만 함
		
	}
}
