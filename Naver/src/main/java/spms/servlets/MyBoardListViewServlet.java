package spms.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.dao.BoardDao;
import spms.dto.BoardDto;

@WebServlet(value="/board/myList")
public class MyBoardListViewServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		String id = "";
		int pageNum = 0;
		
		try {
			
			ServletContext sc = this.getServletContext();
			conn = (Connection)sc.getAttribute("conn");
			
			pageNum = Integer.parseInt(req.getParameter("num"));
			
			id = req.getParameter("id");
			
			sql = "SELECT BNO, TITLE, CONTENT, CRE_DATE, MOD_DATE" 
					+ " FROM (SELECT ROWNUM AS RN, BOARD.* FROM BOARD "
					+ "	WHERE MID = ?"
					+ "	ORDER BY BNO DESC)"
					+ " WHERE RN >= " + (pageNum + 1)
					+ " AND RN <= " + (pageNum + 10)
					+ " ORDER BY BNO ASC";

			pstmt = conn.prepareStatement(sql);
			
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
			
			BoardDao boardDao = new BoardDao();
			boardDao.setConnection(conn);
			int maxNum = boardDao.boardListMaxNum(id);
			
			req.setAttribute("maxNum", maxNum);
			req.setAttribute("boardList", boardList);
			
			RequestDispatcher dispatcher =
					req.getRequestDispatcher("./myBoardListView.jsp");
			
			dispatcher.forward(req, res);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
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
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, res);
	}
}
