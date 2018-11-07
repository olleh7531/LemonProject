package com.lemon.MusicComment.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MusicCommentDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	private Connection getCon() throws Exception {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/Lemon");
		con = ds.getConnection();
		return con;
	}

	public void CloseDB() {
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public int MusicComment(int mu_num, String comment, String user, String ip) {
		int check = 0;
		try {
			con = getCon();
			sql = "select al_num from album where al_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mu_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sql = "insert into comment(cmt_category, cmt_text_num, cmt_content, cmt_email,  cmt_ip, cmt_timestamp) "
						+ "values(?,?,?,?,?,now())";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, 1);
				pstmt.setInt(2, mu_num);
				pstmt.setString(3, comment);
				pstmt.setString(4, user);
				pstmt.setString(5, ip);
				pstmt.executeUpdate();
				check = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return check;
	}
}
