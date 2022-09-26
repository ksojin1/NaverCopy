package spms.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.dto.BoardDto;
import spms.dto.MemberDto;

@WebServlet(value="/board/update")
public class BoardUpdateServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDto boardDto = null;
		
		String sql = "";
		
		
		try {
			
			int no = Integer.parseInt(req.getParameter("no"));
			
			ServletContext sc = this.getServletContext();
			conn = (Connection)sc.getAttribute("conn");
			
			sql = "SELECT BNO, MID, TITLE, CONTENT";
			sql += " FROM BOARD";
			sql += " WHERE BNO = ?";
			
			pstmt = conn.prepareStatement(sql);

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
			
			req.setAttribute("boardDto", boardDto);
			
			RequestDispatcher rd =
					req.getRequestDispatcher("/board/BoardUpdate.jsp");
			
			rd.forward(req, res);
			
			
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
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			
			int no = Integer.parseInt(req.getParameter("no"));
			String userId = req.getParameter("userId");
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			
			//BoardDto boardDto = new BoardDto(no, userId, title, content);
			
			ServletContext sc = this.getServletContext();
			conn = (Connection)sc.getAttribute("conn");

			sql += "UPDATE BOARD";
			sql += " SET TITLE=?, CONTENT=?, MOD_DATE=SYSDATE";
			sql += " WHERE MNO=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, no);

			int result = pstmt.executeUpdate();
			
			if(result == 0) {
				System.out.println("게시판 수정 실패");
			}
			
			res.sendRedirect("./list");
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
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
