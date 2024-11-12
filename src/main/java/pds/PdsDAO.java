package pds;

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

public class PdsDAO {
	private Connection conn = GetConn.getConn(); //이 안에 생상된 getInstance를 연결
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	private PdsVO vo = null; 
	
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

	//자료실 전체자료 가져오기
	public ArrayList<PdsVO> getPdsList(int startIndexNo, int pageSize, String part) {
		ArrayList<PdsVO> vos = new ArrayList<PdsVO>();
		try {
			if(part.equals("전체")) {
				sql = "select * from pds order by idx desc limit ?,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startIndexNo);
				pstmt.setInt(2, pageSize);
			}
			else {
				sql = "select * from pds where part=? order by idx desc limit ?,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, part);
				pstmt.setInt(2, startIndexNo);
				pstmt.setInt(3, pageSize);
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new PdsVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setfSize(rs.getInt("fSize"));
				vo.setPart(rs.getString("part"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setfDate(rs.getString("fDate"));
				vo.setDownNum(rs.getInt("downNum"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		}finally {
			rsClose();
		}
		return vos;
	}
	
	// 자료실에 자료 저장
	public int setPdsInputOk(PdsVO vo) {
		int res = 0;
		try {
			sql = "insert into pds values(default, ?,?,?,?,?,?,?,?,?,?,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getfName());
			pstmt.setString(4, vo.getfSName());
			pstmt.setInt(5, vo.getfSize());
			pstmt.setString(6, vo.getPart());
			pstmt.setString(7, vo.getTitle());
			pstmt.setString(8, vo.getContent());
			pstmt.setString(9, vo.getOpenSw());
			pstmt.setString(10, vo.getHostIp());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		}finally {
			pstmtClose();
		}
		return res;
	}
	
	
	public void setDownNumCheck(int idx) {
		try {
			sql = "update pds set downNum=downNum+1 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		}finally {
			pstmtClose();
		}
	}
	
	// DB에서 파일 삭제처리
	public int setPdsDeleteCheck(int idx) {
		int res = 0;
		try {
			sql = "delete from pds where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		}finally {
			pstmtClose();
		}
		return res;
	}
	
	// 분류별(part) 검색처리
	public ArrayList<PdsVO> getPdsSearchList(String part) {
		 ArrayList<PdsVO> vos = new  ArrayList<PdsVO>();
		 try {
			sql = "select * from pds where part=? order by idx desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, part);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new PdsVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setfSize(rs.getInt("fSize"));
				vo.setPart(rs.getString("part"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setfDate(rs.getString("fDate"));
				vo.setDownNum(rs.getInt("downNum"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		}finally {
			rsClose();
		}
		return vos;
	}
	
	// 개별 내용 검색
	public PdsVO getPdsContent(int idx) {
		PdsVO vo = new PdsVO();
		try {
			sql = "select * from pds where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new PdsVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setfSize(rs.getInt("fSize"));
				vo.setPart(rs.getString("part"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setfDate(rs.getString("fDate"));
				vo.setDownNum(rs.getInt("downNum"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		}finally {
			rsClose();
		}
		return vo;
	}
	
	// 전체 레코드 건수 //part추가
	public int getTotRecCnt(String part) {
		int totRecCnt = 0;
		try {
			if(part.equals("전체")) {
				sql = "select count(*) as totRecCnt from pds";
				pstmt = conn.prepareStatement(sql);
			}
			else {
				sql = "select count(*) as totRecCnt from pds where part = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, part);
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


	
	
}
