package member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.fabric.xmlrpc.base.Data;
import com.mysql.fabric.xmlrpc.base.Struct;

import common.SecurityUtil;

public class MemberLoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");

		MemberDAO dao = new MemberDAO();
		// ->dao 이동
		
		//MemberVO vo = dao.MemberIdCheck(mid,pwd); //dao를 받아주는 저장소가 vo임=>vo변수를 사용해야함 //DB에 넘어온 변수값을 비교
		MemberVO vo = dao.getMemberIdCheck(mid); //아이디가 DB에 없으면 PWD가 null값이 돌아가게 됨
		
		//241029 저장괸 비밀번호에서 salt키를 분리시켜서 다시 암호화 후 비교처리한다.
		String salt = vo.getPwd().substring(0,3); // 난수로 생성한 앞의 3글자를 분리해서 변수에 저장
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(salt + pwd); // salt키를 뽑아서 입력받은pwd를 붙인다음->security에서 다시 암호화
		//DB에는 솔트키 포함된 값이 저장됨.DB저장된 결과 : salt+(암호화된(salt+pwd)) :(salt+pwd)를 암호화한것 앞에 salt를 붙임
		
		//if(vo.getPwd() == null || !vo.getPwd().equals(pwd) ) { //암호화 처리할 예정이므로 이렇게 사용안함. 
		//if(vo.getPwd() == null ) {
		if(!vo.getPwd().substring(3).equals(pwd)) {
			request.setAttribute("message", "회원 정보가 없습니다. \\n확인하고 다시 로그인하세요."); // 역슬2개\가 붙어야 제어코드로 인식함
			request.setAttribute("url", "MemberLogin.mem");
			return; //아이디에 맞는 비번이 공백이면 여기서 if종료하고 이 페이지 실행종료
		}
		
		//241030----------------------------------------
		// 이곳부터는 로그인 처리가 된 회원들의 작업내열들 입력처리입니다. 
		
		
		// 동일한 아이디가 검색되었다면 비밀번호가 맞는지 확인한다.
		// 입력받은 비밀번호를 암호화 시켜서 DB에 암호화 되어 저장되어 있는 비밀번호와 비교한다.
		
		/*241029 필요 없어짐
		 * if(!vo.getPwd().equals(pwd)) { //DB에 있는 비번vo와 서버의 비번이 같지 않으면
		 * request.setAttribute("message", "비밀번호가 틀립니다. \\n확인하고 다시 로그인하세요.");
		 * request.setAttribute("url", "MemberLogin.mem"); return; }
		 */
		
		/* 숙제 */
		// 정상 인증이 완료되었을 때 처리할 내용들을 기술 //=로그인 됨
		// 쿠키:아이디를 쿠키로 저장처리 
		// DB:방문포인트를 5회 미만일 경우에 10point씩 증가처리한다. 방문횟수(총/오늘) 누적, 마지막 방문일자 처리(로그인시), 준회원을 자동으로 등업처리할경우 수행내용 등등...==>> DB에 저장...
		// 세션:처리완료된 자료들은  작업수행이 지속되는 동안 꼭 필요한 정보만을 세션에 저장처리 
		/* 원래는 상기의 내용을 처리해야 함*/
		
	// 쿠키:아이디를 쿠키로 저장처리 
			String idSave = request.getParameter("idSave")==null ? "off" : "on";
			//System.out.println("idSave :"+idSave);
			Cookie cookieMid = new Cookie("cMid", mid);
			cookieMid.setPath("/");
			if(idSave.equals("on")) {
				cookieMid.setMaxAge(60*60*24*7);
			}
			else {
				cookieMid.setMaxAge(0);
			}
			response.addCookie(cookieMid);
			//System.out.println("cookieMid : " + cookieMid);
			//System.out.println("cookieMid2 : " + cookieMid.getValue());
			
		
		
	//세션에 저장할 항목 : mid, nickName //DB에서 꺼내기 번거로운것 세션에 저장해서 사용
		HttpSession session = request.getSession();
		/*session.setAttribute("sMid", "midOk"); //네비바 수정 개인작업*/
		session.setAttribute("sMid", mid);
		session.setAttribute("sNickName",vo.getNickName());
		session.setAttribute("sLevel",vo.getLevel());
	//241030
		session.setAttribute("sLastDate", vo.getLastDate());//최근 방문일을 세션에 담아둔다.
			
		// 회원 등급별 등급명칭을 strLevel변수에 저장한다.
		String strLevel = "";
		if(vo.getLevel() == 0) strLevel = "관리자";
		if(vo.getLevel() == 1) strLevel = "준회원";
		if(vo.getLevel() == 2) strLevel = "정회원";
		if(vo.getLevel() == 3) strLevel = "우수회원";
		session.setAttribute("strLevel", strLevel);
			
		// 방문 포인트 10증가, 방문 카운트(총/오늘) 1증가, 마지막날짜(최종방문일자) 수정 
	//241029
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strToday = sdf.format(today);

		if(!strToday.equals(vo.getLastDate().substring(0,10))) {
			// 오늘 처음 방문한 경우 수행처리(오늘빙문카운트를 1로하고, 기존 포인트+10)
			vo.setTodayCnt(1); //처음 로그인시 리셋이니까 방문은1
			vo.setPoint(vo.getPoint() + 10);
		}
		else {
			//	오늘 재방문한 경우(오늘 방문카운트+1, 포인트증가? 오늘 방문횟수가 5회까지만 포인트 +10)
			vo.setTodayCnt(vo.getTodayCnt()+1);
			if(vo.getTodayCnt() <= 5) vo.setPoint(vo.getPoint() + 10);
		}
				
		
		//dao.setPointPlus(mid); //방문포인트를 5회 미만일 경우에 10point씩 증가처리
		//241030
		dao.setMemberInfoUpdate(vo);
		
		
		request.setAttribute("message", mid+"님 로그인되었습니다.");
		request.setAttribute("url", "MemberMain.mem");
		
	}
}
