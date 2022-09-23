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

//import spms.dao.MemberDao;
//import spms.dto.MemberDto;

@WebServlet(value = "/member/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
		throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("/auth/LoginForm.jsp");
		rd.forward(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
		throws ServletException, IOException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		String name = "";
		int colIndex = 1;
		
		sql += "SELECT MNAME, EMAIL"
			+ " FROM MEMBERS"
			+ " WHERE EMAIL = ?"
			+ " AND PWD = ?";

		try {
			String mid = req.getParameter("mid");
			String pwd = req.getParameter("pwd");
			
			ServletContext sc = this.getServletContext();
			conn = (Connection)sc.getAttribute("conn");

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(colIndex++, mid);
			pstmt.setString(colIndex, pwd);

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				mid = rs.getString("mid");
				name = rs.getString("mname");

//				MemberDto memberDto = new MemberDto();
//
//				memberDto.setEmail(mid);
//				memberDto.setName(name);
			}
			
//			HttpSession session = req.getSession();
			
//			session.setAttribute("member", memberDto);
			
			res.sendRedirect("/board/list");

		} catch (Exception e) {
			e.printStackTrace();
			
			throw new ServletException(e);
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
	public void keepLoginStatusFnc() {
		
	}

}
