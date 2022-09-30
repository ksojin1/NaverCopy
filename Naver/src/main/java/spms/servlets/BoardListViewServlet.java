package spms.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.dao.BoardDao;
import spms.dto.BoardDto;

@WebServlet(value="/board/list")
public class BoardListViewServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null;
		int pageNum = 0;
		int maxNum = 0;
		
		try {
			
			ServletContext sc = this.getServletContext();
			conn = (Connection)sc.getAttribute("conn");
			
			pageNum = Integer.parseInt(req.getParameter("num"));
			
			BoardDao boardDao = new BoardDao();
			
			boardDao.setConnection(conn);
			
			maxNum = boardDao.boardListMaxNum();
			
			ArrayList<BoardDto> boardList =
					boardDao.listView(pageNum);
			
			req.setAttribute("maxNum", maxNum);
			req.setAttribute("boardList", boardList);
			
			RequestDispatcher dispatcher =
					req.getRequestDispatcher("./BoardListView.jsp");
			dispatcher.forward(req, res);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
}
