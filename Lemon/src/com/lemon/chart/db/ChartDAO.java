package com.lemon.chart.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ChartDAO {
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

	public List getMuReadCount() {
		List<ChartBean> arr = new ArrayList<ChartBean>();
		ChartBean cb = new ChartBean();
		try {
			con = getCon();

			// sql 쿼리
			sql = "select music_sub (no,track_no,music_name ,singer_name,lyrics,album_num,musicfile)"
					+ "values(null,?,?,?,?,?,?)";
			// pstmt 객체생성
			pstmt = con.prepareStatement(sql);

			// pstmt 객체 실행
			pstmt.executeQuery();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return arr;
	}

	public ArrayList<ChartBean> selectChart() {
		ArrayList<ChartBean> chartList = new ArrayList<>();
		ChartBean ch = null;
		try {
			con = getCon();
			sql = "select * from album a inner join music b where "
					+ "b.album_num = a.al_num order by al_release desc;";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ch = new ChartBean();
				ch.setAl_agency(rs.getString("al_agency"));
				ch.setAl_art_img(rs.getString("al_art_img"));
				ch.setAl_content(rs.getString("al_content"));
				ch.setAl_name(rs.getString("al_name"));
				ch.setAl_num(rs.getInt("al_num"));
				ch.setAl_release(rs.getDate("al_release"));
				ch.setAlbum_num(rs.getInt("album_num"));
				ch.setLyrics(rs.getString("lyrics"));
				ch.setMu_num(rs.getInt("mu_num"));
				ch.setMusic_genre(rs.getString("music_genre"));
				ch.setMusic_name(rs.getString("music_name"));
				ch.setMusic_time(rs.getString("music_time"));
				ch.setMusic_video(rs.getString("music_video"));
				ch.setMusicfile(rs.getString("musicfile"));
				ch.setSinger_num(rs.getInt("singer_num"));
				ch.setTrack_num(rs.getInt("track_num"));
				chartList.add(ch);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return chartList;
	}

}
