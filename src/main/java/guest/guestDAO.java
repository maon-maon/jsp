package guest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class guestDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	String sql ="";
	
	GuestVO vo = null;
	
	public guestDAO() {
		String url = "jdbc:mysql://localhost:3306/javagroup";
		String user = "root";
		String password = "1234";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("드라이버 검색에 성공하였습니다.");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색에 실패하였습니다." + e.getMessage());
		} catch (SQLException e) {
			System.out.println("DB 연동에 실패하였습니다." + e.getMessage());
			//e.printStackTrace();
		}
	}
	
	public void connClose() {
		if(conn != null) {
			try {
				conn.close();
			} catch (Exception e) {}
		}
	}
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {}
		}
	}
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
				pstmt.close();
			} catch (Exception e) {}
		}
	}

	//1.프론트컨트롤러 2.인터페이스 3.커멘드
	
	
	
	// DB에 있는 방명록 전체자료 가져오기
	public List<GuestVO> getGuestList(int startIndexNo, int pageSize) {
		List<GuestVO> vos = new ArrayList<GuestVO>();
		try {
			sql = "select * from guest order by idx desc limit ?, ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new GuestVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setContent(rs.getString("content"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setVisitDate(rs.getString("visitDate"));
				vo.setHostIp(rs.getString("hostIp"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 " + e.getMessage());
		}finally {
			rsClose();
		}
		return vos;
	}
	
	
	//방명록에 작성한 글을 DB에 저장시키기
	public int setGuestInputOk(GuestVO vo) {
		int res = 0; //값을 뷰에 돌려줄게 아니라서 변수는 반환값인 숫자 타입으로 함. 성공하면 1 /실패하면 0이 자동으로 반환됨
		try {
			sql = "insert into guest values(default,?,?,?,?,default,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getHomePage());
			pstmt.setString(5, vo.getHostIp());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 " + e.getMessage());
		}finally {
			pstmtClose();
		}
		return res;
	}

	
	//방명록 글 삭제 처리 메소드
	public int setGuestDeleteOk(int idx) {
		int res = 0;
		try {
			sql = "delete from guest where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 " + e.getMessage());
		}finally {
			pstmtClose();
		}
		return idx;
	}

	
		//현재 방명록의 전체 글의 개수
	public int getTotRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) as cnt from guest"; //count 를 변수 cnt에 담음
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			totRecCnt = rs.getInt("cnt"); //sql 구해온 건수를 변수 cnt에 담음
		} catch (SQLException e) {
			System.out.println("SQL 오류 " + e.getMessage());
		}finally {
			rsClose();
		}
		return totRecCnt;
	}


}
