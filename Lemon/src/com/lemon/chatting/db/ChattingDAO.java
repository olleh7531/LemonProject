package com.lemon.chatting.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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

	public void insertMessage(ChattingBean cb) {
		try {
			con = getCon();
			sql = "insert into conversation(con_sender, con_receiver, con_content, channel, sendtime)values(?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cb.getCon_sender());
			pstmt.setString(2, cb.getCon_receiver());
			pstmt.setString(3, cb.getCon_content());
			pstmt.setInt(4, cb.getChannel());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

	}

	public ArrayList<ChattingBean> selectMessage(int channel) {
		ArrayList<ChattingBean> cblist = new ArrayList<>();
		ChattingBean cb = null;
		try {
			con = getCon();
			sql = "select * from conversation where channel=? order by con_num asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, channel);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				cb = new ChattingBean();
				cb.setCon_num(rs.getInt("con_num"));
				cb.setChannel(rs.getInt("channel"));
				cb.setCon_content(rs.getString("con_content"));
				cb.setCon_receiver(rs.getString("con_receiver"));
				cb.setCon_sender(rs.getString("con_sender"));
				cb.setSendtime(rs.getDate("sendtime"));
				cblist.add(cb);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return cblist;
	}

}
