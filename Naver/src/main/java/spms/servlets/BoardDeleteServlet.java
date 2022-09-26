package spms.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.dto.BoardDto;
import spms.dto.MemberDto;

@WebServlet(value="/board/delete")
public class BoardDeleteServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		BoardDto boardDto = null;
		
		String sql = "";
		
		try {
			
			int no = Integer.parseInt(req.getParameter("no"));
			
			ServletContext sc = this.getServletContext();
			conn = (Connection)sc.getAttribute("conn");
			
			sql = "DELETE FROM BOARD";
			sql += " WHERE BNO = ?";
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, no);

			int result = pstmt.executeUpdate();
			
			if(result == 0) {
				System.out.println("게사판 삭제 실패");
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
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
	}
}
