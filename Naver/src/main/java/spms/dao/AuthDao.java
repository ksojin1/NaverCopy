package spms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import spms.dto.MemberDto;

public class AuthDao {

	private Connection connection;

	public void setConnection(Connection conn) {
		this.connection = conn;
	}

	public MemberDto loginCheck(String mid, String pwd) 
		throws Exception {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDto memberDto = null;

		String sql = "";
		String name = "";
		int colIndex = 1;

		sql += "SELECT MNAME, EMAIL" 
			+ " FROM MEMBERS" 
			+ " WHERE MID = ?" 
			+ " AND PWD = ?";

		try {
			pstmt = connection.prepareStatement(sql);

			pstmt.setString(colIndex++, mid);
			pstmt.setString(colIndex, pwd);

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				name = rs.getString("mname");

				memberDto = new MemberDto();
				memberDto.setId(mid);
				memberDto.setName(name);
			} 
			return memberDto;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
			
		} finally {
			
			if(rs != null) {
				try {
					rs.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	public MemberDto findId(String name, String email)
		throws Exception {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDto memberDto = null;
		
		String sql = "";
		String mid = "";
		Date creDate = null;
		int colIndex = 1;

		sql += "SELECT MID, CRE_DATE" 
			+ " FROM MEMBERS" 
			+ " WHERE MNAME = ?" 
			+ " AND EMAIL = ?";
		
		try {
			pstmt = connection.prepareStatement(sql);
			
			pstmt.setString(colIndex++, name);
			pstmt.setString(colIndex, email);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				mid = rs.getString("mid");
				creDate = rs.getDate("cre_date");

				memberDto = new MemberDto();
				memberDto.setId(mid);
				memberDto.setCreateDate(creDate);
			} 
			
			return memberDto;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
			
		} finally {
			
			if(rs != null) {
				try {
					rs.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		
	}
}
