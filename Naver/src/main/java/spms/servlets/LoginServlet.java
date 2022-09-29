package spms.servlets;

import java.io.IOException;
import java.sql.Connection;

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

@WebServlet(value = "/auth/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
		throws ServletException, IOException {

		req.setAttribute("loginCkStr","");
		
		RequestDispatcher rd = req.getRequestDispatcher("./LoginForm.jsp");
		rd.forward(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
		throws ServletException, IOException {

		Connection conn = null;
		MemberDto memberDto = null;
		RequestDispatcher rd = null;
		
		try {
			String mid = req.getParameter("mid");
			String pwd = req.getParameter("pwd");

			ServletContext sc = this.getServletContext();
			conn = (Connection) sc.getAttribute("conn");

			AuthDao authDao = new AuthDao();
			authDao.setConnection(conn);
			
			memberDto = authDao.loginCheck(mid, pwd);

			if (memberDto != null) {
				
				HttpSession session = req.getSession();
				session.setAttribute("memberDto", memberDto);

				System.out.println("로그인 성공");
				
				res.sendRedirect("../board/list?num=0");
				
			} else {
				System.out.println("로그인 실패");
				
				req.setAttribute("loginCkStr", 
						"아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다."
						+ "<br>입력하신 내용을 다시 확인해주세요.");
				
				rd = req.getRequestDispatcher("./LoginForm.jsp");
				rd.forward(req, res);
			} 
				
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
}
