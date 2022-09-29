package spms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import spms.dto.MemberDto;

public class BoardDao {

	private Connection connection;

	public void setConnection(Connection conn) {
		this.connection = conn;
	}

	// 회원전체 조회
	public int boardListMaxNum() throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int maxNum = 0;

		try {
			String sql = "SELECT MAX(ROWNUM) MAXNUM FROM BOARD";

			pstmt = connection.prepareStatement(sql);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				maxNum = rs.getInt("MAXNUM");
			}
			
			return maxNum;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	} // selectList() end
	
	// 내 게시물 전체조회
	public int boardListMaxNum(String id) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int maxNum = 0;

		try {
			String sql = "SELECT MAX(ROWNUM) MAXNUM FROM BOARD"
					+ " WHERE MID=?";

			pstmt = connection.prepareStatement(sql);

			pstmt.setString(1,id);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				maxNum = rs.getInt("MAXNUM");
			}
			
			return maxNum;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	} // selectList() end
}
