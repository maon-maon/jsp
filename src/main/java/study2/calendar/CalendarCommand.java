package study2.calendar;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class CalendarCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 오늘날짜 저장
		Calendar calToday = Calendar.getInstance();
		int toYear = calToday.get(Calendar.YEAR);
		int toMonth = calToday.get(Calendar.MONTH);
		int toDay = calToday.get(Calendar.DATE);
		
		// 화면에 보여주는 '년/월' 셋팅
		int yy = request.getParameter("yy")==null ? toYear : Integer.parseInt(request.getParameter("yy"));
		int mm = request.getParameter("mm")==null ? toMonth : Integer.parseInt(request.getParameter("mm"));
		// 넘어온 값이 없으면 캘린더에서 불러온 오늘 날짜를 가져옴
		
		if(mm < 0) {
			yy--;
			mm = 11;
		}
		if(mm > 11) {
			yy++;
			mm = 0;
		}
		
		// 선택한 날짜를 해당 '년/월/일'로 셋팅.(일은 첫날(1)로 처리)
		calToday.set(yy, mm, 1); //오늘날짜를 셋팅:받은연월로 셋팅 시작일은1
		
		// 셋팅한 날짜의 해당월의 마지막 일자
		int lastDay = calToday.getActualMaximum(Calendar.DAY_OF_MONTH); 
		
		// 셋팅한 날짜의 해당 첫번째일자의 요일을 구한다(일:1,월:2, ......)
		int startWeek = calToday.get(Calendar.DAY_OF_WEEK);
		
		// 화면에 보여주는 달력변수 저장
		request.setAttribute("yy", yy);
		request.setAttribute("mm", mm);
		request.setAttribute("startWeek", startWeek);
		request.setAttribute("lastDay", lastDay);
		
		// 오늘날짜 저장
		request.setAttribute("toYear", toYear);
		request.setAttribute("toMonth", toMonth);
		request.setAttribute("toDay", toDay);
		
	}

}
