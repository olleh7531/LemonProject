package com.lemon.admin.music.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AMusicDAO {
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
	
	public void insertMusic(AMusicBean amb){
		try {
			con = getCon();

			// sql 쿼리
			sql = "insert into music (no,track_no,music_name,singer_name,lyrics,album_num,musicfile)"
					+ "values(null,?,?,?,?,?,?)";
			// pstmt 객체생성
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, amb.getTrack_num());
			pstmt.setString(2, amb.getMusic_name());
			pstmt.setString(3, amb.getSinger_name());
			pstmt.setString(4, amb.getLyrics());
			pstmt.setInt(5, amb.getAlbum_num());
			pstmt.setString(6, amb.getMusicfile());

			// pstmt 객체 실행
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
