package com.lemon.Good.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class GoodDAO {
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

	public int MusicGoodUp(int go_text_num, String user) {
		int check = -1;
		try {
			con = getCon();
			sql = "select count(go_text_num) num from good where go_user_email =? AND go_text_num = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user);
			pstmt.setInt(2, go_text_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getInt("num") == 0) {
					sql = "insert into good(go_user_email, go_category, go_text_num )values(?, ?, ?)";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, user);
					pstmt.setInt(2, 1);
					pstmt.setInt(3, go_text_num);
					pstmt.executeUpdate();
					check = 0;
				} else {
					sql = "delete from good where go_user_email= ? AND go_text_num = ?;";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, user);
					pstmt.setInt(2, go_text_num);
					pstmt.executeUpdate();
					check = 1;
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return check;
	}
}
