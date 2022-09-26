package spms.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import spms.dto.MemberDto;
@WebServlet(value="/member/join")
public class memberJoinServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req
			, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.sendRedirect("./MemberJoin.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req
			, HttpServletResponse resp) throws ServletException, IOException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
//		MemberDto memberDto = new MemberDto();
		
			String sql = "";
			
		try {
			ServletContext sc = this.getServletContext();
			System.out.println(0);
			conn = (Connection)sc.getAttribute("conn");
			System.out.println(1);
			String id = req.getParameter("mid");
			String pwd = req.getParameter("pwd");
			String name = req.getParameter("mname");
			String birthdate = req.getParameter("birthdate");
			String email = req.getParameter("email");
			System.out.println(2);
			sql += "INSERT INTO MEMBERS";
			sql += " VALUE(MNO, MID, PWD, MNAME, BIRTHDATE, EMAIL, CRE_DATE, MOD_DATE)";
			sql += " VALUES(MEMBERS_MNO_SEQ.NEXTVAL, ?, ?, ?, TO_DATE(?)";
			sql += " , ?, SYSDATE, SYSDATE)";
			
			pstmt = conn.prepareStatement(sql);
			
			System.out.println(3);
			

//			pstmt.setString(1, id);
//			pstmt.setString(2, pwd);
//			pstmt.setString(3, name);
//			pstmt.setString(4, birthdate);
//			pstmt.setString(5, email);

			result = pstmt.executeUpdate();
			System.out.println(4);
			resp.sendRedirect("./login");
			
			System.out.println(5);
		} catch (Exception e) {
		}
		
		
		
		
		
		
		
	}
}
