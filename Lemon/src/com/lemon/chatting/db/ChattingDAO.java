package com.lemon.chatting.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ChattingDAO {
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

	public int selectCh_Num(String sender, String receiver) {
		int ch_num = 0;
		try {
			con = getCon();
			sql = "select fr_num from friends where (receiver_nick=? and sender_nick=? and fr_check=1) or (receiver_nick=? and sender_nick=? and fr_check=1);";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, receiver);
			pstmt.setString(2, sender);
			pstmt.setString(3, sender);
			pstmt.setString(4, receiver);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ch_num = Integer.parseInt(rs.getString("fr_num"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return ch_num;
	}
}
