package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class FilterTest implements Filter{
//필터는 반드시 서블릿의 것을 사용
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		// 필터는 수행전에 처리해야 함
		
		System.out.println("1.필터 수행 전 입니다. ");
		
		chain.doFilter(request, response);
		// 여길 기준으로 필터 전/후가 나뉨. 필터in-내부서버처리-필터out:순서로 인/아웃 둘 다 찍힘
		
		System.out.println("2.필터 수행 후 입니다. \n");
	}
		
}
