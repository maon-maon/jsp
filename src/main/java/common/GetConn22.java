package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GetConn22 {
	private static Connection conn = null;
	
	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/javagroup";
	private String user = "root";
	private String password = "1234";
	
	private static GetConn22 instance = new GetConn22();
	
	private GetConn22() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패");
		} catch (SQLException e) {
			System.out.println("데이터베이스 연동 실패");
		}
	}
	
//	public static GetConn getInstance() {
//		return instance;
//	}
	
	public static Connection getConn() {
		return conn;
	}
	
}
