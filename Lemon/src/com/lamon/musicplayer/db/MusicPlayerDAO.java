package com.lamon.musicplayer.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MusicPlayerDAO {
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

	public ArrayList<MusicPlayerBean> selectPlayerList(String user) {
		MusicPlayerBean mpb = null;
		MusicPlayerBean mpb2 = null;
		ArrayList<MusicPlayerBean> mpblist = new ArrayList<>();
		try {
			con = getCon();
			sql = "select a.music_name, a.musicfile, a.music_time, a.album_num,b.pls_music_num, c.al_art_img from "
					+ "music a inner join playlist b inner join album c on a.mu_num = b.pls_music_num where  al_num = album_num AND b.pls_user_email = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user);
			rs = pstmt.executeQuery();
			while (rs.next()) {

				mpb = new MusicPlayerBean();
				mpb.setPls_music_num(rs.getInt("pls_music_num"));
				mpb.setMusic_name(rs.getString("music_name"));
				mpb.setMusicfile(rs.getString("musicfile"));
				mpb.setMusic_time(rs.getString("music_time"));
				mpb.setAlbum_num(rs.getInt("album_num"));
				mpb.setAl_art_img(rs.getString("al_art_img"));
				mpblist.add(mpb);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return mpblist;
	}

	public ArrayList<MusicPlayerBean> albumImg(int album_num) {
		MusicPlayerBean mpbb = null;
		ArrayList<MusicPlayerBean> armpb = new ArrayList<>();
		try {
			con = getCon();
			sql = "select al_art_img from album where al_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, album_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mpbb = new MusicPlayerBean();
				mpbb.setAl_art_img(rs.getString("al_art_img"));
				armpb.add(mpbb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return armpb;
	}

	public MusicPlayerBean lemonPlayer(int musicNum, int album) {
		MusicPlayerBean mpb = null;
		try {
			con = getCon();
			sql = "select * from album a inner join music b on a.al_num = b.album_num where b.mu_num = ? AND a.al_num = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, musicNum);
			pstmt.setInt(2, album);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mpb = new MusicPlayerBean();
				mpb.setAl_art_img(rs.getString("al_art_img"));
				mpb.setMusic_name(rs.getString("music_name"));
				mpb.setMusicfile(rs.getString("musicfile"));
				mpb.setMusic_time(rs.getString("music_time"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return mpb;
	}
}
