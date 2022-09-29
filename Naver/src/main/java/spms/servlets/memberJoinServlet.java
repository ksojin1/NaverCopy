package spms.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.tag.el.fmt.RequestEncodingTag;

import spms.dto.MemberDto;

//import spms.dto.MemberDto;
@WebServlet(value="/member/join")
public class memberJoinServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req
			, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setAttribute("userId", "");
		req.setAttribute("msg", "");
		req.setAttribute("addCheck", false);
		
		RequestDispatcher dispatcher =
				req.getRequestDispatcher("./MemberJoin.jsp");
		dispatcher.forward(req, resp);
		
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
			String year = req.getParameter("yy");
			String month = req.getParameter("mm");
			String day = req.getParameter("dd");
			String email = req.getParameter("email");
			
			if (month.length() == 1) {
				month = "0" + month;
			}
			if (day.length() == 1) {
				day = "0" + day;
			}
			
			String birthdate = year + month + day;
			
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
			System.out.println("회원가입 성공");
			if(result == 0) {
				System.out.println("회원가입 실패");
			}
			resp.sendRedirect("../auth/login");
			
			
		} catch (Exception e) {
		}
		
		
		
		
		
		
		
	}
}
