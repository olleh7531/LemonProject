package com.lemon.MusicComment.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
				sql = "insert into comment(cmt_category, cmt_text_num, cmt_content, cmt_email,  cmt_ip, cmt_timestamp)"
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

	public ArrayList<MusicCommentBean> SelectMusicComment(int mu_num) {
		MusicCommentBean mcb = null;
		ArrayList<MusicCommentBean> ListComm = new ArrayList<>();
		try {
			con = getCon();
			sql = "select * from comment where  cmt_text_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mu_num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				mcb = new MusicCommentBean();
				mcb.setCmt_num(rs.getInt("cmt_num"));
				mcb.setCmt_category(rs.getInt("cmt_category"));
				mcb.setCmt_text_num(rs.getInt("cmt_text_num"));
				mcb.setCmt_content(rs.getString("cmt_content"));
				mcb.setCmt_email(rs.getString("cmt_email"));
				mcb.setCmt_timestamp(rs.getDate("cmt_timestamp"));
				mcb.setCmt_ip(rs.getString("cmt_ip"));
				mcb.setCmt_like(rs.getInt("cmt_like"));
				mcb.setCmt_dislike(rs.getInt("cmt_dislike"));
				mcb.setCmt_blame(rs.getInt("cmt_blame"));
				ListComm.add(mcb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return ListComm;
	}

	public ArrayList<MusicCommentBean> selectMusic(int mu_num) {
		MusicCommentBean mcb = null;
		ArrayList<MusicCommentBean> ListComm = new ArrayList<>();
		try {
			con = getCon();
			sql = "select * from comment where  cmt_text_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mu_num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				mcb = new MusicCommentBean();
				mcb.setCmt_num(rs.getInt("cmt_num"));
				mcb.setCmt_category(rs.getInt("cmt_category"));
				mcb.setCmt_text_num(rs.getInt("cmt_text_num"));
				mcb.setCmt_content(rs.getString("cmt_content"));
				mcb.setCmt_email(rs.getString("cmt_email"));
				mcb.setCmt_timestamp(rs.getDate("cmt_timestamp"));
				mcb.setCmt_ip(rs.getString("cmt_ip"));
				mcb.setCmt_like(rs.getInt("cmt_like"));
				mcb.setCmt_dislike(rs.getInt("cmt_dislike"));
				mcb.setCmt_blame(rs.getInt("cmt_blame"));
				ListComm.add(mcb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return ListComm;
	}
}
