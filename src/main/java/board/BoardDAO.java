package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.GetConn22;
import common.GetConn;
import member.MemberVO;

public class BoardDAO {
	private Connection conn = GetConn.getConn(); //이 안에 생상된 getInstance를 연결
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	private BoardVO vo = null;
	
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
	
	
	// 게시판 전체글 리스트 게시글 DB에서 가져오기
	public List<BoardVO> getBoardList(int startIndexNo, int pageSize) {
		List<BoardVO> vos = new ArrayList<BoardVO>();
		try {
			sql = "select *, datediff(wDate ,now()) as date_diff, timestampdiff(hour, wDate ,now()) as time_diff,"
					+ " (select count(idx) from boardReply where boardIdx=b.idx) as replyCnt"
					+ " from board b order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
					
			while(rs.next()) {
				vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				
				//vo.setContent(rs.getString("content"));
				String content = rs.getString("content").replaceAll("\\r?\\n", "<br/>");
				content = content.replace("'", "&#39;").replace("\"", "&#39;");
				vo.setContent(content);
				
				vo.setHostIp(rs.getString("hostIp"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setGood(rs.getInt("good"));
				vo.setwDate(rs.getString("wDate"));
				vo.setClaim(rs.getString("claim"));
				
				vo.setDate_diff(rs.getInt("date_diff"));
				vo.setTime_diff(rs.getInt("time_diff"));
				vo.setReplyCnt(rs.getInt("replyCnt"));
				
				vos.add(vo);
			}		
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		}finally {
			rsClose();
		}
		return vos;
	}
	
	// 게시글 작성처리
	public int setBoardInputOk(BoardVO vo) {
		int res = 0;
		try {
			sql = "insert into board values(default,?,?,?,?,?,?,default,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getHostIp());
			pstmt.setString(6, vo.getOpenSw());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		}finally {
			pstmtClose();
		}
		return res;
	}
	
	public BoardVO getBoardContent(int idx) {
		vo = new BoardVO();
		try {
			sql = "select * from board where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			vo.setIdx(rs.getInt("idx"));
			vo.setMid(rs.getString("mid"));
			vo.setNickName(rs.getString("nickName"));
			vo.setTitle(rs.getString("title"));
			vo.setContent(rs.getString("content"));
			vo.setHostIp(rs.getString("hostIp"));
			vo.setOpenSw(rs.getString("openSw"));
			vo.setReadNum(rs.getInt("readNum"));
			vo.setGood(rs.getInt("good"));
			vo.setwDate(rs.getString("wDate"));
			vo.setClaim(rs.getString("claim"));
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		}finally {
			rsClose();
		}		
		return vo;
	}
	
	// 조회수 1씩 증가 시키기
	public void setContentReadNumPlus(int idx) {
		try {
			sql = "update board set readNum = readNum+1 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		}finally {
			pstmtClose();
		}		
	}
	
	// 게시글 삭제처리
	public int BoardDelete(int idx) {
		int res = 0;
		try {
			sql = "delete from board where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
//			pstmtClose();
//
//			sql = "delete from claim where part='board' and partIdx=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, idx);
//			pstmt.executeUpdate();
//			res = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		}finally {
			pstmtClose();
		}	
		return res;
	}
	
	// 게시들 총 건수
	public int getTotRecCnt() {
		int totRecCnt = 0;
		try {
			
			sql = "select count(*) as totRecCnt from board;";
			pstmt = conn.prepareStatement(sql);
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
	
	// 게시글 수정 처리
	public int setBoardUpdateOk(BoardVO vo) {
		int res = 0;
		try {
			sql = "update board set nickName=?,title=?, content=?, hostIp=?, openSw=?, wDate=now() where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNickName());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getHostIp());
			pstmt.setString(5, vo.getOpenSw());
			pstmt.setInt(6, vo.getIdx());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}	finally {
			pstmtClose();
		}
		return res;
	}
	
	// 좋아요수 증가처리
	public int setBoardGoodCheck(int idx, int goodCnt) {
		int res = 0;
		try {
//			sql = "update board set good = good+1 where idx = ?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, idx);
			
			sql = "update board set good = good+? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, goodCnt);
			pstmt.setInt(2, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}	finally {
			pstmtClose();
		}
		return res;
	}
	
	// 검색글 전체 리스트
	public List<BoardVO> getBoardSearchList(String search, String searchString) {
		List<BoardVO> vos = new ArrayList<BoardVO>();
		try {
				sql = "select *, datediff(wDate ,now()) as date_diff, timestampdiff(hour, wDate ,now()) as time_diff "
						+ "from board where "+search+" like ?";
				// ?는 문자열로 들어옴,"따옴표"가 문자에 붙어서 들어옴. 문자만 들어오는게 아님
				// 여러개를 검색할 때는 변수로 받아서 사용함
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchString+"%");
			rs = pstmt.executeQuery();
					
			while(rs.next()) {
				vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setGood(rs.getInt("good"));
				vo.setwDate(rs.getString("wDate"));
				vo.setClaim(rs.getString("claim"));

				vo.setDate_diff(rs.getInt("date_diff"));
				vo.setTime_diff(rs.getInt("time_diff"));
				
				vos.add(vo);
			}		
		} catch (SQLException e) {
			System.out.println("SQL 오류: "+e.getMessage());
		}finally {
			rsClose();
		}
		return vos;
	}

	// 게시판 작성 건수 확인
	public int getBoardCnt(String mid, String nickName) {
		int boardCnt = 0;
		try {
			sql = "select count(idx) as boardCnt from board where mid=? or nickName=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);					
			pstmt.setString(2, nickName);
			rs = pstmt.executeQuery();
			
			rs.next();
			boardCnt = rs.getInt("boardCnt");
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return boardCnt;
	}
	
	//241106
	// 이전글/다음글 처리하기 (idx title 가져오기)
	public BoardVO getPreNextSearch(int idx, String str) {
		BoardVO vo = new BoardVO();
		try {
			if(str.equals("pre")) sql = "select idx, title from board where idx < ? order by idx desc limit 1;";
			else sql = "select idx, title from board where idx > ? order by idx  limit 1;";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);					
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	
	// 댓글 리스트
	public ArrayList<BoardReplyVO> getBoardReply(int idx) {
		ArrayList<BoardReplyVO> vos = new ArrayList<BoardReplyVO>();
		try {
			sql = "select * from boardReply where boardIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);					
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardReplyVO vo = new BoardReplyVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setBoardIdx(rs.getInt("boardIdx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setContent(rs.getString("content"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setwDate(rs.getString("wDate"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	
	// 댓글 등록 처리
	public int setBoardReplyInput(BoardReplyVO vo) {
		int res = 0;
		try {
			sql = "insert into boardReply values(default, ?, ?, ?, ?, ?, default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getBoardIdx());
			pstmt.setString(2, vo.getMid());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getHostIp());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류: " + e.getMessage());
		}	finally {
			pstmtClose();
		}
		return res;
	}
	
	// 댓글 삭제 처리
	public int setBoardReplyDelete(int idx) {
		int res = 0;
		try {
			sql = "delete from boardReply where idx =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}	finally {
			pstmtClose();
		}
		return res;
	}
	
	// 댓글 수정하기
	public int setBoardReplyUpdate(BoardReplyVO vo) {
		int res = 0;
		try {
			sql = "update boardReply set content=?, hostIp=? where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getContent());
			pstmt.setString(2, vo.getHostIp());
			pstmt.setInt(3, vo.getIdx());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		}	finally {
			pstmtClose();
		}
		return res;
	}
	
	
	
	
	
}
