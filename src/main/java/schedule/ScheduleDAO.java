package schedule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.GetConn;

public class ScheduleDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	private ScheduleVO vo = null;
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	public void rsClose() {
		if(pstmt != null) {
			try {
				rs.close();
			} catch (SQLException e) {}
			finally { pstmtClose(); }
		}
	}

	// 스케줄 '년/월'별 전체내역
	public List<ScheduleVO> getScheduleList(String mid, String ym, int sw) {
		List<ScheduleVO> vos = new ArrayList<ScheduleVO>();
		try {
			if(sw == 0) {
				sql = "select *,count(*) as partCnt from schedule where mid=? and date_format(sDate,'%Y-%m')=? group by sDate,part order by sDate, part";
			}
			else {
				sql = "select * from schedule where mid=? and date_format(sDate,'%Y-%m-%d')=? order by sDate";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, ym);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new ScheduleVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setsDate(rs.getString("sDate"));
				vo.setPart(rs.getString("part"));
				vo.setContent(rs.getString("content"));
				
				if(sw == 0) vo.setPartCnt(rs.getInt("partCnt"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();			
		}
		return vos;
	}

	// 일정관리 등록하기
	public int setScheduleInput(ScheduleVO vo) {
		int res = 0;
		try {
			sql = "insert into schedule values(default,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getsDate());
			pstmt.setString(3, vo.getPart());
			pstmt.setString(4, vo.getContent());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();			
		}
		return res;
	}

	// 일정 수정하기
	public int setScheduleUpdateOk(ScheduleVO vo) {
		int res = 0;
		try {
			sql = "update schedule set part=?, content=? where idx=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPart());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getIdx());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();			
		}
		return res;
	}

	// 일정 삭제하기
	public int setScheduleDeleteOk(int idx) {
		int res = 0;
		try {
			sql = "delete from schedule where idx=?";
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

}
