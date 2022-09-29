package spms.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import spms.dto.MemberDto;

@WebServlet(value = "/auth/findId")
public class MemberIdFindServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
		throws ServletException, IOException {
	
		RequestDispatcher rd = req.getRequestDispatcher("./findId.jsp");
		rd.forward(req, res);
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
		throws ServletException, IOException {
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";
		String mid = "";
		Date creDate = null;
		int colIndex = 1;

		sql += "SELECT MID, CRE_DATE" 
			+ " FROM MEMBERS" 
			+ " WHERE MNAME = ?" 
			+ " AND EMAIL = ?";

		try {
			String name = req.getParameter("name");
			String email = req.getParameter("email");
System.out.println(name);
System.out.println(email);
			ServletContext sc = this.getServletContext();
			conn = (Connection) sc.getAttribute("conn");

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(colIndex++, name);
			pstmt.setString(colIndex, email);

			rs = pstmt.executeQuery();
			

			if (rs.next()) {
				mid = rs.getString("mid");
				creDate = rs.getDate("cre_date");
				System.out.println("찾음");
				req.setAttribute("mid", mid);
				req.setAttribute("cre_date", creDate);
				
				RequestDispatcher rd = req.getRequestDispatcher("../auth/findId3.jsp");
				rd.forward(req, res);
				
			} else {
				System.out.println("인증번호가 올바르지 않습니다. 확인 후 다시 입력해 주세요.");
				res.sendRedirect("./findId2.jsp");
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
	
	

