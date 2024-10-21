package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*") // ()=필터링 범위. *=전체 지정 
public class EncordingFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		// 필터는 수행전에 처리해야 함
		
		//System.out.println("11.필터 수행 전 입니다. ");
		
		chain.doFilter(request, response);
		// 여길 기준으로 필터 전/후가 나뉨. 필터in-내부서버처리-필터out:순서로 인/아웃 둘 다 찍힘
		
		//System.out.println("22.필터 수행 후 입니다. \n");
		
	}

}
