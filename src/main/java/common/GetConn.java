package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//하나의 DB에 여러 프로젝트가 연결될 때 각각의 데이터 연결클래스를 사용하지 않고 하나의 싱글톤을 가져다 쓰는걸로 파일 생성량을 줄일 수 있음

//싱글톤은 생성해서 사용 안함=> 불러씀

public class GetConn {
	private static Connection conn = null;//필요없어짐  //static:명령어 : 메소드에 올라간 메소드 호출 클래스명으로 호출하려면 메모리에 올리는 명령어
	// DAO에서 호출하는 변수!!
	// 이게 없으면 컨넥션 객체가 생성 안 됨. 이건 무조건 있어야 함 아래 메소드(getInstance/getConn) 뭘 사용하든 필요함.
	
	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/javagroup";
	private String user = "root";
	private String password = "1234";

//conn 불러쓰기 위해서 필드 생성 : 싱글톤객체
	private static GetConn instance = new GetConn(); //GetConn이 메모리에 올라가면서 instance필드가 메모리에 올라가면서 GetConn메소드가 1번 만들어짐
	//메모리에 올리는 용도!!
	//자신을 타입으로 받아서 자신을 1번 생성 메모리가 올라가면서 Connection 생성
	//static으로 메모리에 올림=명령어
	
	@SuppressWarnings("unused")
	private GetConn() {
		try {
			Class.forName(driver);
			System.out.println("드라이버 검색 성공");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패: " +e.getMessage());
		} catch (SQLException e) {
			System.out.println("DB 연동 실패: " +e.getMessage());
		}
	}
	
//	public static GetConn getInstance() {
//		return instance;
//	}// 게터를 통해 instance에 접근
	
	public static Connection getConn() { // conn의 getter로서 필드의 conn을 읽어서 static으로 메모리에 올리고, 리턴값으로 메모리의 conn을 전달
		return conn;
	}
	
}
