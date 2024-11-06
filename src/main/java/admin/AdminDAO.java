package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import admin.claim.ClaimVO;
import common.GetConn22;
import common.GetConn;
import member.MemberVO;

public class AdminDAO {
	private Connection conn = GetConn.getConn(); //이 안에 생상된 getInstance를 연결
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
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
			} catch (SQLException e) {}
				finally {
					pstmtClose();
			}
		}
	}

	// member테이블의 아이디 검색후 성명 돌려보내기
	public String getIdSearch(String mid) {
		String name = "";
		try {
			sql = "select name from member where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) name = rs.getString("name");
			
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		}finally {
			rsClose();
		}
		return name;
	}
	// member테이블에서 최대 포인트 아이디 검색후 성명 돌려보내기
	public String getPointMaxSearch(String mid) {
		String name = "";
		try {
			sql = "select max(point) from member = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) name = rs.getString("name");
			
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		}finally {
			rsClose();
		}
		return name;
	}
	
	//포인트가 최대인 회원 검색 // member테이블에서 최대 포인트 아이디 검색후 성명 돌려보내기
	public MemberVO getAjaxPointCheck() {
		MemberVO vo = new MemberVO();
		try {
			sql = "select max(point) as point, mid,name from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setName(rs.getString("name"));
				vo.setMid(rs.getString("mid"));
				vo.setPoint(rs.getInt("point"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		}finally {
			rsClose();
		}
		return vo;
	}
	
	//
	public int setBoardClaimInput(ClaimVO vo) {
		int res = 0;
		try { //여기는 테이블의 필드명
			sql = "insert into claim values (default, ?, ?, ?, ?, default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPart());
			pstmt.setInt(2, vo.getPartIdx());
			pstmt.setString(3, vo.getClaimMid());
			pstmt.setString(4, vo.getClaimContent()); 
			res = pstmt.executeUpdate();
			pstmtClose(); //싱글톤객체는 테이블 사용시 pstmt 반납필수
			
			//sql = "update board set claim = 'OK' where idx=?";
			// 여기는 삽입해서 추가로 쓰는 필드명 as로 생성한것
			sql = "update "+vo.getPart()+" set claim = 'OK' where idx=?"; //vo.getPart():보드테이블의 번호=board
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getPartIdx());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	// 신고 내역 리스트
	public List<ClaimVO> getClaimList(int startIndexNo, int pageSize) {
		List<ClaimVO> vos = new ArrayList<ClaimVO>();
		try {
//			sql = "select c.*,b.title as title,b.nickName as nickName, b.mid as mid, b.claim as claim from"
//					+ " claim c, board b where c.partIdx=b.idx order by idx desc";
			sql = "select c.*,b.title as title,b.nickName as nickName, b.mid as mid, b.claim as claim from"
					+ " claim c, board b where c.partIdx=b.idx order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ClaimVO vo = new ClaimVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setPart(rs.getString("part"));
				vo.setPartIdx(rs.getInt("partIdx"));
				vo.setClaimMid(rs.getString("claimMid"));
				vo.setClaimContent(rs.getString("claimContent"));
				vo.setClaimDate(rs.getString("claimDate"));
				
				vo.setTitle(rs.getString("title"));
				vo.setNickName(rs.getString("nickName"));
				vo.setMid(rs.getString("mid"));
				vo.setClaim(rs.getString("claim"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	
	// 신고항목 표시하기(NO)/감추기(OK)
	public int setClaimViewCheck(String flag, int idx) {
		int res = 0;
		try {
			sql = "update board set claim=? where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, flag);
			pstmt.setInt(2, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	// 신고글과 원본글 삭제
	public int setClaimDeleteOk(String part, int idx) {
		int res = 0;
		try {
			sql = "delete from board where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
			pstmtClose();
			
			sql = "delete from claim where part=? and partIdx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, part);
			pstmt.setInt(2, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	// 신고리스트 총 글 수 확인: 페이징 처리
	public int getTotRecCnt() {
		int totRecCnt = 0;
		try {
			//sql = "select count(idx) as totRecCnt from claim";
			sql = "select count(*) as totRecCnt from claim c, board b where c.partIdx=b.idx";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			totRecCnt = rs.getInt("totRecCnt");
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		}finally {
			rsClose();
		}
		return totRecCnt;
	}
	
	// 선택된 게시물들 삭제하기(이때 선택 게시물이 신고된 글이라면 신고 글도 함께 삭제)
	public void setBoardSelectDelete(int idx) {
		try {
			sql = "delete from board where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
//			pstmtClose();
//			
//			sql = "delete from claim where part='board' and partIdx=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, idx);
//			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
	}
	
	// 선택한 게시물 삭제 : 신고글만 삭제
	public void setClaimSelectDelete(int idx) {
		 try {
			sql = "delete from Claim where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		 } catch (SQLException e) {
				System.out.println("SQL 오류 : " + e.getMessage());
			} finally {
				pstmtClose();
			}
		}
	
	// 방명록 새글 갯수 확인
	public int getNewGuestCnt() {
		int newGuestCnt = 0;
		try {
			sql = "select count(*) as newGuestCnt from guest where datediff(visitDate, now()) = 0";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				newGuestCnt = rs.getInt("newGuestCnt");
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		}finally {
			rsClose();
		}
		return newGuestCnt;
	}
	
	public int getNewBoardCnt() {
		int newBoardCnt = 0;
		try {
			sql = "select count(*) as newBoardCnt from board where datediff(wDate, now()) = 0";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				newBoardCnt = rs.getInt("newBoardCnt");
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		}finally {
			rsClose();
		}
		return newBoardCnt;
	}
	
	public int getNewClaimCnt() {
		int newClaimCnt = 0;
		try {
			sql = "select count(*) as newClaimCnt from claim where datediff(claimDate, now()) = 0";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				newClaimCnt = rs.getInt("newClaimCnt");
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		}finally {
			rsClose();
		}
		return newClaimCnt;
	}
	
	public int getNewJoinCnt() {
		int newJoinCnt = 0;
		try {
			sql = "select count(*) as newJoinCnt from member where datediff(startDate, now()) = 0";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				newJoinCnt = rs.getInt("newJoinCnt");
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		}finally {
			rsClose();
		}
		return newJoinCnt;
	}
	
	public int getNewUserDelCnt() {
		int newUserDelCnt = 0;
		try {
			sql = "select count(*) as newUserDelCnt from member where  userDel='OK' and datediff(lastDate, now()) = 0";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				newUserDelCnt = rs.getInt("newUserDelCnt");
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		}finally {
			rsClose();
		}
		return newUserDelCnt;
	}
	
	
	
	
	
}
