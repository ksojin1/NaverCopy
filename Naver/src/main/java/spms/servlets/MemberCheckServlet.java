package spms.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(value="/member/check")
public class MemberCheckServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Connection conn = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			ServletContext sc = this.getServletContext();
			conn = (Connection) sc.getAttribute("conn");
			
			sql += "SELECT MNO, EMAIL, MNAME, CRE_DATE";
			sql += " FROM MEMBERS" + " WHERE MID = ?";

			String id = req.getParameter("mid");
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			HttpSession session = req.getSession();

			if (rs.next()) {
				req.setAttribute("addCheck", false);
				req.setAttribute("userId", id);
				req.setAttribute("msg", "중복입니다");
				RequestDispatcher rd = req.getRequestDispatcher("./MemberJoin.jsp");
				rd.forward(req, resp);
			}else{
				req.setAttribute("addCheck", true);
				req.setAttribute("userId", id);
				req.setAttribute("msg", "");
				RequestDispatcher rd = req.getRequestDispatcher("./MemberJoin.jsp");
				rd.forward(req, resp);
			
			}
				

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

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
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}
	}
	
}
