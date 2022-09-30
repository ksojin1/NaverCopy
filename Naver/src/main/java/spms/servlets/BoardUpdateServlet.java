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

import spms.dao.BoardDao;
import spms.dto.BoardDto;
import spms.dto.MemberDto;

@WebServlet(value="/board/update")
public class BoardUpdateServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Connection conn = null;
		BoardDto boardDto = null;
		
		try {
			
			int no = Integer.parseInt(req.getParameter("no"));
			
			ServletContext sc = this.getServletContext();
			conn = (Connection)sc.getAttribute("conn");
			
			BoardDao boardDao = new BoardDao();
			boardDao.setConnection(conn);
			boardDto = boardDao.listUpdateView(no);
			
			req.setAttribute("boardDto", boardDto);
			
			RequestDispatcher rd =
					req.getRequestDispatcher("/board/BoardUpdate.jsp");
			
			rd.forward(req, res);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null;
		int result = 0;
		
		try {
			int no = Integer.parseInt(req.getParameter("no"));
			String userId = req.getParameter("userId");
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			
			ServletContext sc = this.getServletContext();
			conn = (Connection)sc.getAttribute("conn");
			
			BoardDao boardDao = new BoardDao();
			boardDao.setConnection(conn);
			result = boardDao.listUpdate(no, title, content);
			
			if(result == 0) {
				System.out.println("게시판 수정 실패");
			}
			
			res.sendRedirect("./list?num=0");
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} 
		
	}
}
