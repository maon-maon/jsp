package study.j1021;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/1021/T2_lifeCycleOk")
public class T2_lifeCycleOk extends HttpServlet {
	/* 필터는 매번 매건마다 적용됨 = 브라우저 실행시 부담됨
	 	=>콘트롤러에	init/destroy  @PostConstruct/@PreDestroy를 걸어서 사용하면 컨트롤러(@WebServlet)에서 사용 가능함*/
	
	//유지보수에 사용 필수
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 service 메소드 입니다.");
	}

	@Override
	protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 doPost 메소드 입니다.");
		doGet(request, response);
	}
	
	@Override
	protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 doGet 메소드 입니다.");
	} // 메인 작업처리.....
	
	public void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 doAction 메소드 입니다.");
		doPost(request, response);
	}
	
	@Override //필터에서도 제어하지만 컨트롤러에서도 제어 가능함
	public void init() throws ServletException {
		System.out.println("이곳은 init 메소드 입니다.");
	} //컨트롤러 들어가기 전에 먼저 수행됨. 필터에 들어가기 전에 걸러냄=공통필터의 부담을 줄임. 프로젝트 사용시 현함

	@PostConstruct //init 보가 먼저 처리 됨
	public void initProcess() {
		System.out.println("이곳은 사용자정의 메소드(initProcess) 입니다.");
	} //1. 퍼블릭 메소드 만들기 2.@어노테이션 걸어주기
	
	@Override
	public void destroy() {
		System.out.println("이곳은 destroy 메소드 입니다.");
	} //jvm이 날라갈때 실행됨
	
	@PreDestroy //destroy보다 늦게 적용됨
	public void destroyProcess() {
		System.out.println("이곳은 사용자정의 메소드(destroyProcess) 입니다.");
	}
}
