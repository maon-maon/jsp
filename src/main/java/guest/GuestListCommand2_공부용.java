package guest;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestListCommand2_공부용 implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//데이터베이스 바로 연동해서 가져오기
		guestDAO dao = new guestDAO();
		
		 //ArrayList<E> = dao.getGuestList();
//		List<GuestVO> vos = dao.getGuestList();
//		
//		request.setAttribute("vos", vos); 
//		request.setAttribute("guestCnt", vos.size()); //전체글의 갯수를 파악하기 위해 vos의 사이즈 확인 
		
	}

}
