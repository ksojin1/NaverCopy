package spms.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.dto.MemberDto;

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
		
		
			String sql = "";
			MemberDto memberDto = new MemberDto();
			
		try {
			ServletContext sc = this.getServletContext();
			
			
			conn = (Connection)sc.getAttribute("conn");			
			
			
			
			String id = req.getParameter("mid");
			String pwd = req.getParameter("pwd");
			String name = req.getParameter("mname");
			String birthdate = req.getParameter("birthdate");
			String email = req.getParameter("email");
			
			memberDto.setId(id);
			memberDto.setName(name);
			memberDto.setBirthdate(birthdate);
			memberDto.setEmail(email);
			
			
			sql += "INSERT INTO MEMBERS";
			sql += " VALUE(MNO, MID, PWD, MNAME, BIRTHDATE, EMAIL, CRE_DATE, MOD_DATE)";
			sql += " VALUES(MEMBERS_MNO_SEQ.NEXTVAL, ?, ?, ?, TO_DATE(?)";
			sql += " , ?, SYSDATE, SYSDATE)";
			
			pstmt = conn.prepareStatement(sql);
			
			

			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, birthdate);
			pstmt.setString(5, email);
			

			result = pstmt.executeUpdate();
			if(result == 0) {
				System.out.println("회원가입 실패");
			}
			resp.sendRedirect("./login");
			
			
		} catch (Exception e) {
		}
		
		
		
		
		
		
		
	}
}
