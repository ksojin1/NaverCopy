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

import spms.dao.AuthDao;
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
		MemberDto memberDto = null;
		RequestDispatcher rd = null;
		
		try {
			String name = req.getParameter("name");
			String email = req.getParameter("email");

			ServletContext sc = this.getServletContext();
			conn = (Connection) sc.getAttribute("conn");

			AuthDao authDao = new AuthDao();
			authDao.setConnection(conn);
			
			memberDto = authDao.findId(name, email);
			
			if (memberDto != null) {

				req.setAttribute("mid", memberDto.getId());
				req.setAttribute("cre_date", memberDto.getCreateDate());
				
				rd = req.getRequestDispatcher("../auth/findId3.jsp");
				rd.forward(req, res);
				
			} else {
				System.out.println("못 찾음");
				res.sendRedirect("./loginFail.jsp");
			} 
		
			} catch (Exception e) {
				e.printStackTrace();
		}
	}
}
	
	

