package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.GetConn;

public class MemberDAO {
// 싱글톤 사용 : GetConn 객체 생성 먼저함.	//필드 개념으로 컨넥션을 올림
	private Connection conn = GetConn.getConn(); //이 안에 생상된 getInstance를 연결
	//->이 다음 컨트롤러 생성
	//private Connection conn2 = GetConn.getConn();
	//GetConn호출
// private GetConn conn = GetConn.getInstance(); // Instance단어를 현직에서 많이 씀
//	private GetConn conn2 = GetConn.getInstance(); 
//		
//	public MemberDAO() {
//		if(conn == conn2) System.out.println("conn과 conn2는 같은 객체입니다.");
//		else System.out.println("conn과 conn2는 다른 객체입니다.");
//	} //테스트 결과  conn == conn2 같은 객체임
	
	
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	MemberVO vo = null;
	
	//싱글톤에선 connClose()만들면 안 됨
	
	private void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	private void rsClose() {
		if(rs != null) {
			try {
				rs.close();
				 pstmt.close();
			} catch (SQLException e) {}
			//finally {	}
		}
	}
	
	//Member테이블에서 아이디 검색하기
	public MemberVO MemberIdCheck(String mid) {
		vo = new MemberVO();
		
		try {
			sql = "select * from member where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setContent(rs.getString("content"));
				vo.setPhoto(rs.getString("photo"));
				vo.setLevel(rs.getInt("level"));
				vo.setUserInfo(rs.getString("userInfo"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setSalt(rs.getString("salt"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		} finally {
			rsClose();
		}	
		return vo;
	}
	
	//방문 포인트 10씩 증가시켜주기
	public void setPointPlus(String mid) {
		try {
			//sql = "update set member point = point+10 where mid = ?"; //포인트 무조건 10씩 증가
			sql = "update member set point=point+10, visitCnt=visitCnt+1, todayCnt=todayCnt+1, lastDate=now() where mid = ?"; //
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		} finally {
			pstmtClose();
		}	
	}
	
	
	
}
