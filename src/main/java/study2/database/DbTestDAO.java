package study2.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DbTestDAO {
	//2.먼저 필드설정
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	String sql = "";
	//11.
	DbTestVO vo = null;
	
	public DbTestDAO() {
		//1.데이터베이스 주소 2.계정 아이디.패스워드 3.jdbc드라이버 까지 있어야 함
		
		//1.
		String url = "jdbc:mysql://localhost:3306/javagroup";
		String user = "root";
		String password = "1234";
		
		//3.
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//System.out.println("드라이버 검색 성공");
			conn = DriverManager.getConnection(url, user, password);
			//System.out.println("Database 연결 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패" + e.getMessage());
			//e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("데이터베이스 연동 실패" + e.getMessage());
		}
	}
	
	// 사용하지 않는 객체 반납(conn, pstmt, rs)
	//4.
	public void connClose() {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {}
		}
	}
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
//5. /study2/database/DbList로->

	//10.
	// 개별 자료 검색...1건
	public DbTestVO getDbTestSearch(int idx) {
		//vo = new DbTestVO();
		//ArrayList<DbTestVO> vos = new ArrayList<DbTestVO>();
		
		try {
			//sql = "select * from hoewon limit 1"; // limit 1: 1건,limit 5:5건 검색,  limit 1,10:인덱스 1~10번
			//19
			sql = "select * from hoewon where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx); //네임 변수에서 1개만 검색
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new DbTestVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
				
				//21
				//vos.add(vo);
			} //자료가 있으면 담고, 업으면 통과하고vo는 위에 명시한null이 담김
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	//16
	//전체 자료 출력 
	public ArrayList<DbTestVO> getDbTestList(String name) {
		ArrayList<DbTestVO> vos = new ArrayList<DbTestVO>();
		try {
			//24
			if(name.equals("")) {
				sql = "select * from hoewon order by idx desc";
				//sql = "select * from hoewon order by name";
				pstmt = conn.prepareStatement(sql);
			}
			else {
				sql = "select * from hoewon where name = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
			}
			rs = pstmt.executeQuery(); //셀렉트만 사용
			
			while(rs.next()) {
				vo = new DbTestVO();
				vo.setIdx(rs.getInt("idx")); //CRUD 처리를 위해 가지고 다녀야 함
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose(); // 출력은 조회해야함=select를 씀=executeQuery ->rs에 담음
		}
		return vos;
	}

		//~~29
	//회원자료 등록
	public int setDbInputOk(DbTestVO vo) {
		int res = 0;
		try {
			sql = "insert into hoewon values(default,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getAge());
			pstmt.setString(3, vo.getGender());
			pstmt.setString(4, vo.getAddress());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	//회원 개인정보 수정처리
	public int setDbUpdateOk(DbTestVO vo) {
		int res = 0;
		try {
			sql ="update hoewon set name=?,age=?,gender=?,address=? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getAge());
			pstmt.setString(3, vo.getGender());
			pstmt.setString(4, vo.getAddress());
			pstmt.setInt(5, vo.getIdx());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	//회원정보 삭제처리
	public int setDbDeleteOk(int idx) {
		int res = 0;
		try {
			sql = "delete from hoewon where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 아이디로 검색하여 vo자료 넘겨주기
	public DbTestVO getIdSearch(String mid) {
		try {
			sql = "select * from hoewon3 where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid); //네임 변수에서 1개만 검색
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new DbTestVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
			} 
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 아이디가 비슷한 자료 모두 검색해서 가져오기
	public ArrayList<DbTestVO> getIdSameSearch(String mid) {
		ArrayList<DbTestVO> vos = new ArrayList<DbTestVO>();
		try {
			sql = "select * from hoewon3 where mid like ? order by mid";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+mid+"%");			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new DbTestVO();
				vo.setIdx(rs.getInt("idx")); 
				vo.setMid(rs.getString("mid"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	
	
}
