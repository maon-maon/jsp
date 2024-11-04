package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn22;
import common.GetConn;

public class MemberDAO {
// 싱글톤 사용 : GetConn 객체 생성 먼저함.	//필드 개념으로 컨넥션을 올림
	private Connection conn = GetConn22.getConn(); //이 안에 생상된 getInstance를 연결
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
	//아이디 중복 확인
	//닉네임 중복 확인
	public MemberVO getMemberIdCheck(String str) {
	//public MemberVO getMemberIdCheck(String mid) {
		vo = new MemberVO();
		//System.out.println("getMemberIdCheck str:"+str);
		try {
			int sw = 0;
			if(str.indexOf("_nickName") != -1) {
				str = str.substring(0, str.indexOf("_nickName"));
				sw =1;
			}
			
			if(sw == 0) {
				sql = "select * from member where mid = ? and userDel !='OK'";
			}
			else {
				sql = "select * from member where nickName = ?";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, str);
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
				//vo.setSalt(rs.getString("salt"));
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
	
	// 회원 가입 처리
	public int setMemberJoinOk(MemberVO vo) {
		int res = 0;
		try {
			sql = "insert into member values(default,?,?,?,?,?,?,?,?,?,?,?,?,default,default,default,default,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getBirthday());
			pstmt.setString(7, vo.getTel());
			pstmt.setString(8, vo.getAddress());
			pstmt.setString(9, vo.getEmail());
			pstmt.setString(10, vo.getContent());
			pstmt.setString(11, vo.getPhoto());
			pstmt.setString(12, vo.getUserInfo());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		} finally {
			pstmtClose();
		}	
		return res;
	}
	
	// 닉네임 체크
	public MemberVO getMemberNickNameCheck(String nickName) {
		vo = new MemberVO();
		
		try {
			sql = "select * from member where nickName = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			rs = pstmt.executeQuery();
			
			rs.next();
			vo.setName(rs.getString("nickName"));
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		} finally {
			rsClose();
		}	
		return vo;
	}
	
	// 방문시 업데이트할 내영 처리
	public void setMemberInfoUpdate(MemberVO vo) {
		try {
			sql = "update member set point=?, visitCnt=visitCnt+1, todayCnt=?, lastDate=now() where mid = ?"; //
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getPoint());
			pstmt.setInt(2, vo.getTodayCnt());
			pstmt.setString(3, vo.getMid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		} finally {
			pstmtClose();
		}	
		
	}
	
	// 전체 회원 리스트 처리
	public ArrayList<MemberVO> getMemberList(int startIndexNo, int pageSize, int level) {
		ArrayList<MemberVO> vos = new ArrayList<>();
		try {
			//sql = "select * from member order by idx desc limit ? ,?";
			//sql = "select *, datediff(now(), lastDate) as elapesed_date from member order by idx desc limit ? ,?";
			//241101
			if(level == 999) {
				sql = "select *, datediff(now(), lastDate) as elapesed_date from member order by idx desc limit ? ,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startIndexNo);
				pstmt.setInt(2, pageSize);
			}
			else {
				sql = "select *, datediff(now(), lastDate) as elapesed_date from member where level=? order by idx desc limit ? ,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, level);
				pstmt.setInt(2, startIndexNo);
				pstmt.setInt(3, pageSize);
			}
			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo = new MemberVO();
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
				vo.setElapesed_date(rs.getInt("elapesed_date"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		} finally {
			rsClose();
		}	
		return vos;
	}
	
	//241031
//회원 등업시켜주기
	public void setMemberLevelUpdate(int idx, int level) {
		try {
			sql = "update member set level = ? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, level);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}	finally {
			pstmtClose();
		}
		
	}
	
	// 회원 정보 수정처리
	public int setMemberUpdate(MemberVO vo) {
		int res = 0;
		try {
			sql = "update member set name=?, nickName=?, gender=?, birthday=?, tel=?, address=?,"
					+ " email=?, content=?, photo=?, userInfo=? where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getGender());
			pstmt.setString(4, vo.getBirthday());
			pstmt.setString(5, vo.getTel());
			pstmt.setString(6, vo.getAddress());
			pstmt.setString(7, vo.getEmail());
			pstmt.setString(8, vo.getContent());
			pstmt.setString(9, vo.getPhoto());
			pstmt.setString(10, vo.getUserInfo());
			pstmt.setString(11, vo.getMid());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}	finally {
			pstmtClose();
		}
		return res;
	}

	// 새로운 비밀번호로 변경
	public int setMemberPwdCheckAjaxOk(String mid, String pwd) {
		int res = 0;
		try {
			sql = "update member set pwd=? where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, mid);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}	finally {
			pstmtClose();
		}
		return res;
	}
	
	// 회원 탈퇴 신청처리(userDel의 'NO' -> 'OK' 변경처리) // 데이터 보관(1달간)
	public int setMemberDeleteCheckOk(String mid) {
		int res = 0;
		try {
			sql = "update member set userDel='OK', level=99 where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}	finally {
			pstmtClose();
		}
		return res;
	}
	
	// 관리자가 처리 : 회원 등급 변경
	public int setMemberLevelChange(int level, int idx) {
		int res = 0;
		try {
			sql = "update member set level = ? where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, level);
			pstmt.setInt(2, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}	finally {
			pstmtClose();
		}
		return res;
	}
	
	// 회원의 총 인원수 구하기 : 페이징처리
	public int getTotRecCnt(int level) {
		int totRecCnt = 0;
		try {
			if(level == 999) {
				sql = "select count(idx) as totRecCnt from member;"; // 멤버의 전체 idx가져옴
				pstmt = conn.prepareStatement(sql);
			}
			else {
				sql = "select count(idx) as totRecCnt from member where level =?"; // 
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, level);
			}
			rs = pstmt.executeQuery();
			
			rs.next();
			totRecCnt = rs.getInt("totRecCnt");
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}	finally {
			rsClose();
		}
		return totRecCnt;
	}
	
	// 회원 상세정보 가져오기 : 관리자페이지
	public MemberVO getMemberIdxCheck(int idx) {
		MemberVO vo = new MemberVO();
		try {
			sql = "select * from member where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
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
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		} finally {
			rsClose();
		}	
		return vo;
	}
	
	// 
	public int setMemberClear(String mid) {
		int res = 0;
		//System.out.println("setMemberClea idx: "+idx);
		try {
			sql = "delete from member where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		} finally {
			pstmtClose();
		}	
		//System.out.println("setMemberClea res: "+res);
		return res;
	}
	
	
	
}
