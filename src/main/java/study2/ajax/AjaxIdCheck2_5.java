package study2.ajax;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import study2.database.DbTestDAO;
import study2.database.DbTestVO;

@SuppressWarnings("serial")
@WebServlet("/AjaxIdCheck2_5")
public class AjaxIdCheck2_5 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		DbTestDAO dao = new DbTestDAO();
		
		ArrayList<DbTestVO> vos = dao.getIdSameSearch(mid);
		
		Map<String, String> map = new HashMap<String, String>();
		
		JSONArray jArray = new JSONArray();
		for(DbTestVO vo : vos) {
			map.put("mid", vo.getMid());
			map.put("name", vo.getName());
			map.put("age", vo.getAge()+"");
			map.put("gender", vo.getGender());
			map.put("address", vo.getAddress());
		
			JSONObject jObj = new JSONObject(map);
			jArray.add(jObj);
		}
		
		
		//System.out.println("jArray : " + jArray);

		response.getWriter().write(jArray.toString());
	}
}
