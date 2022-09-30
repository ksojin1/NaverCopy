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

@WebServlet(value="/board/search")
public class BoardSearchViewServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null;
		int pageNum = 0;
		String search = "";
		String searchText = "";
		int maxNum = 0;
		
		try {
			
			ServletContext sc = this.getServletContext();
			conn = (Connection)sc.getAttribute("conn");
			
			pageNum = Integer.parseInt(req.getParameter("num"));
			search = req.getParameter("search");
			searchText = req.getParameter("searchText");
			
			BoardDao boardDao = new BoardDao();
			boardDao.setConnection(conn);
			maxNum = boardDao.boardSearchMaxNum(search, searchText);
			ArrayList<BoardDto> boardList =
					boardDao.listSearchView(pageNum, search, searchText);
			
			req.setAttribute("boardList", boardList);
			req.setAttribute("maxNum", maxNum);
			req.setAttribute("search", search);
			req.setAttribute("searchText", searchText);
			
			RequestDispatcher dispatcher =
					req.getRequestDispatcher("./BoardSearchView.jsp");
			dispatcher.forward(req, res);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}
}
