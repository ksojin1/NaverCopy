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
import javax.servlet.http.HttpSession;

import spms.dto.MemberDto;

//import spms.dao.MemberDao;

@WebServlet(value = "/auth/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
		throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("./LoginForm.jsp");
		rd.forward(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
		throws ServletException, IOException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDto memberDto = null;

		String sql = "";
		String name = "";
		int colIndex = 1;

		sql += "SELECT MNAME, EMAIL" 
			+ " FROM MEMBERS" 
			+ " WHERE MID = ?" 
			+ " AND PWD = ?";

		try {
			String mid = req.getParameter("mid");
			String pwd = req.getParameter("pwd");

			ServletContext sc = this.getServletContext();
			conn = (Connection) sc.getAttribute("conn");

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(colIndex++, mid);
			pstmt.setString(colIndex, pwd);

			rs = pstmt.executeQuery();
			
			HttpSession session = req.getSession();

			if (rs.next()) {
				name = rs.getString("mname");

				memberDto = new MemberDto();

				memberDto.setId(mid);
				memberDto.setName(name);
				session.setAttribute("memberDto", memberDto);
				session.setAttribute("loginCheck", true);
				session.setAttribute("mid", memberDto.getId());

				res.sendRedirect("../board/list");
				
			} else {
				session.setAttribute("loginCheck", false);
				RequestDispatcher rd = req.getRequestDispatcher("./LoginForm.jsp");
				rd.forward(req, res);
			} 
				
		} catch (Exception e) {
			e.printStackTrace();

		} finally {

			try {
				if (pstmt != null) {
					pstmt.close();
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
				
			}
		}
	}
}
