package spms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import spms.dto.BoardDto;
import spms.dto.MemberDto;

public class BoardDao {

	private Connection connection;

	// connection 설정
	public void setConnection(Connection conn) {
		this.connection = conn;
	}

	// 게시물 전체 MAX(ROWNUM) 조회
	public int boardListMaxNum() throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int maxNum = 0;

		try {
			String sql = "SELECT MAX(ROWNUM) MAXNUM FROM BOARD";

			pstmt = connection.prepareStatement(sql);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				maxNum = rs.getInt("MAXNUM");
			}
			
			return maxNum;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	} // selectList() end
	
	// 내 게시물 MAX(ROWNUM) 조회
	public int boardListMaxNum(String item, String str) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int maxNum = 0;

		try {
			String sql = "SELECT MAX(ROWNUM) MAXNUM FROM BOARD"
					+ " WHERE ? = ?";

			pstmt = connection.prepareStatement(sql);

			pstmt.setString(1,item);
			pstmt.setString(2,str);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				maxNum = rs.getInt("MAXNUM");
			}
			
			return maxNum;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	} // selectList() end
	
	// 검색 조건 MAX(ROWNUM) 조회
	public int boardSearchMaxNum(String search, String searchText) throws Exception {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int maxNum = 0;

		try {
			String sql = "SELECT MAX(ROWNUM) MAXNUM FROM BOARD"
					+ " WHERE INSTR(" + search + ", ?) > 0";

			pstmt = connection.prepareStatement(sql);

			pstmt.setString(1,searchText);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				maxNum = rs.getInt("MAXNUM");
			}
			
			return maxNum;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	} // selectList() end

	// 전체 listView
	public ArrayList<BoardDto> listView(int pageNum) throws Exception {
		
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		
		try {
			sql = "SELECT BNO, MID, TITLE, CONTENT, CRE_DATE, MOD_DATE" 
					+ " FROM (SELECT ROWNUM AS RN, BD.* "
					+ " FROM (SELECT * FROM BOARD ORDER BY BNO DESC) BD)"
					+ " WHERE RN >= " + (pageNum + 1)
					+ " AND RN <= " + (pageNum + 10)
					+ " ORDER BY BNO DESC";

			pstmt = connection.prepareStatement(sql);
			
			rs = pstmt.executeQuery(sql);
			
			ArrayList<BoardDto> boardList = new ArrayList<>();
			
			int no = 0;
			String mId = "";
			String title = "";
			String content = "";
			Date creDate = null;
			Date modDate = null;
			
			while (rs.next()) {
				no = rs.getInt("BNO");
				mId = rs.getString("MID");
				title = rs.getString("TITLE");
				content = rs.getString("CONTENT");
				creDate = rs.getDate("CRE_DATE");
				modDate = rs.getDate("MOD_DATE");
				
				BoardDto boardDto = 
						new BoardDto(no, mId, title, 
								content, creDate, modDate);
				
				boardList.add(boardDto);
			}
			
			return boardList;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			throw e;
			
		} finally {
			
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}//finally end
	}
	
	// 검색 listView
	public ArrayList<BoardDto> listSearchView(
			int pageNum, String search, String searchText) throws Exception {
		
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		
		try {
			
			sql = "SELECT BNO, MID, TITLE, CONTENT, CRE_DATE, MOD_DATE" 
					+ " FROM (SELECT ROWNUM AS RN, BD.* "
					+ " FROM (SELECT * FROM BOARD ORDER BY BNO DESC) BD"
					+ " WHERE INSTR(" + search + ", ?) > 0"
					+ " ORDER BY BNO DESC)"
					+ " WHERE RN >= ?"
					+ " AND RN <= ?"
					+ " ORDER BY BNO DESC";

			pstmt = connection.prepareStatement(sql);
			
			pstmt.setString(1, searchText);
			pstmt.setInt(2, pageNum + 1);
			pstmt.setInt(3, pageNum + 10);
			
			rs = pstmt.executeQuery();
			
			ArrayList<BoardDto> boardList = new ArrayList<>();
			
			int no = 0;
			String mId = "";
			String title = "";
			String content = "";
			Date creDate = null;
			Date modDate = null;
			
			while (rs.next()) {
				no = rs.getInt("BNO");
				mId = rs.getString("MID");
				title = rs.getString("TITLE");
				content = rs.getString("CONTENT");
				creDate = rs.getDate("CRE_DATE");
				modDate = rs.getDate("MOD_DATE");
				
				BoardDto boardDto = 
						new BoardDto(no, mId, title, 
								content, creDate, modDate);
				
				boardList.add(boardDto);
			}
			
			return boardList;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			throw e;
			
		} finally {
			
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} //finally
	}
	
	// myListView 
	public ArrayList<BoardDto> myListView(int pageNum, String id) throws Exception {
		
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		
		try {
			
			sql = "SELECT BNO, TITLE, CONTENT, CRE_DATE, MOD_DATE" 
					+ " FROM (SELECT ROWNUM AS RN, BD.* "
					+ " FROM (SELECT * FROM BOARD ORDER BY BNO DESC) BD"
					+ "	WHERE MID = ?"
					+ "	ORDER BY BNO DESC)"
					+ " WHERE RN >= " + (pageNum + 1)
					+ " AND RN <= " + (pageNum + 10)
					+ " ORDER BY BNO DESC";

			pstmt = connection.prepareStatement(sql);
			
			pstmt.setString(1,id);
			
			rs = pstmt.executeQuery();
			
			ArrayList<BoardDto> boardList = new ArrayList<>();
			
			int no = 0;
			String title = "";
			String content = "";
			Date creDate = null;
			Date modDate = null;
			
			while (rs.next()) {
				no = rs.getInt("BNO");
				title = rs.getString("TITLE");
				content = rs.getString("CONTENT");
				creDate = rs.getDate("CRE_DATE");
				modDate = rs.getDate("MOD_DATE");
				
				BoardDto boardDto = 
						new BoardDto(no, id, title, content, creDate, modDate);
				
				boardList.add(boardDto);
			}
			
			return boardList;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		} finally {
			
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
	}
	
	// 게시물 상세보기
	public BoardDto listDetail(int no) throws Exception {
		
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		BoardDto boardDto = null;
		
		try {
			
			sql = "SELECT MID, TITLE, CONTENT, CRE_DATE, MOD_DATE"
				+ " FROM BOARD"
				+ " WHERE BNO = ?";

			pstmt = connection.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			String mId = "";
			String title = "";
			String content = "";
			Date creDate = null;
			Date modDate = null;
			
			while (rs.next()) {
				mId = rs.getString("MID");
				title = rs.getString("TITLE");
				content = rs.getString("CONTENT");
				creDate = rs.getDate("CRE_DATE");
				modDate = rs.getDate("MOD_DATE");
				
				boardDto = new BoardDto(no, mId, title, content, creDate, modDate);
			}
			
			return boardDto;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
			
		} finally {
			
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} //finally
	}
	
	// 게시물 추가
	public int listAdd(String mid, String title, String content) throws Exception {

		PreparedStatement pstmt = null;
		String sql = "";
		int result = 0;
		
		try {
			
			sql += "INSERT INTO BOARD";
			sql += " VALUE(BNO, MID, TITLE, CONTENT, CRE_DATE, MOD_DATE)";
			sql += " VALUES(BOARD_BNO_SEQ.NEXTVAL, ?, ?";
			sql += " , ?, SYSDATE, SYSDATE)";

			pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, mid);
			pstmt.setString(2, title);
			pstmt.setString(3, content);

			result = pstmt.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} //finally
	}
	
	// 게시물 수정 View
	public BoardDto listUpdateView(int no) throws Exception {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDto boardDto = null;
		String sql = "";
		
		try {
			
			sql = "SELECT BNO, MID, TITLE, CONTENT";
			sql += " FROM BOARD";
			sql += " WHERE BNO = ?";
			
			pstmt = connection.prepareStatement(sql);

			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();
			
			String userId = "";
			String title = "";
			String content = "";
			
			while (rs.next()) {
				
				userId = rs.getString("MID");
				title = rs.getString("TITLE");
				content = rs.getString("CONTENT");
				
				boardDto = new BoardDto(no, userId, title, content);
			}
			
			return boardDto;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
			
		} finally {
			
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} //finally
	}
	
	// 게시물 수정 post
	public int listUpdate(int no, String title, String content) throws Exception {
		
		PreparedStatement pstmt = null;
		String sql = "";
		int result = 0;
		
		try {

			sql += "UPDATE BOARD";
			sql += " SET TITLE=?, CONTENT=?, MOD_DATE=SYSDATE";
			sql += " WHERE BNO=?";

			pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, no);

			result = pstmt.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		} finally {
			
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} //finally
	}

	// 게시물 삭제
	public int listDelete(int no) throws Exception {
		
		PreparedStatement pstmt = null;
		String sql = "";
		int result = 0;
		
		try {
			
			sql = "DELETE FROM BOARD";
			sql += " WHERE BNO = ?";
			
			pstmt = connection.prepareStatement(sql);

			pstmt.setInt(1, no);

			result = pstmt.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		} finally {
			
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
