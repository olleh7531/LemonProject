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

	public ArrayList<MusicPlayerBean> selectPlayerList() {
		MusicPlayerBean mpb = null;
		ArrayList<MusicPlayerBean> mpblist = new ArrayList<>();
		try {
			con = getCon();
			sql = "select * from album a inner join music b where b.album_num = a.al_num order by a.al_num desc;";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				mpb = new MusicPlayerBean();
				mpb.setAl_agency(rs.getString("al_agency"));
				mpb.setAl_art_img(rs.getString("al_art_img"));
				mpb.setAl_content(rs.getString("al_content"));
				mpb.setAl_name(rs.getString("al_name"));
				mpb.setAl_num(rs.getInt("al_num"));
				mpb.setAl_release(rs.getDate("al_release"));
				mpb.setAlbum_num(rs.getInt("album_num"));
				mpb.setLyrics(rs.getString("lyrics"));
				mpb.setMu_num(rs.getInt("mu_num"));
				mpb.setMusic_genre(rs.getString("music_genre"));
				mpb.setMusic_name(rs.getString("music_name"));
				mpb.setMusic_time(rs.getString("music_time"));
				mpb.setMusic_video(rs.getString("music_video"));
				mpb.setMusicfile(rs.getString("musicfile"));
				mpb.setSinger_num(rs.getInt("singer_num"));
				mpb.setTrack_num(rs.getInt("track_num"));
				mpblist.add(mpb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return mpblist;
	}
}
