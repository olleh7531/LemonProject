package com.lemon.admin.music.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MusicDAO {
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
	
	public void insertMusic(MusicBean amb){
		try {
			con = getCon();

			// sql 쿼리
			sql = "insert into music (num,music_name,lyrics,musicfile,music_genre,music_time,track_num)"
					+ "values(null,?,?,?,?,?,?)";
			// pstmt 객체생성
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, amb.getMusic_name());
			pstmt.setString(2, amb.getLyrics());
			pstmt.setString(3, amb.getMusicfile());
			pstmt.setString(4, amb.getMusic_genre());
			pstmt.setString(5, amb.getMusic_time());
			pstmt.setInt(6, amb.getTrack_num());

			// pstmt 객체 실행
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	
	
	public void insertAlbum(AlbumBean ab,MusicBean mb) {
		try {
			con = getCon();

			sql="select * from album where al_name=? and al_release=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ab.getAl_name());
			pstmt.setDate(2, ab.getAl_release());
			
			rs=pstmt.executeQuery();
			rs.last();
			// rs 개수구해서 1개뿐
			if(rs.next()) {
				
			}else {
				sql ="insert into album (num,al_name,al_release,al_art_img,al_agency,al_content)"
						+ "values(null,?,?,?,?,?)";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, ab.getAl_name());
						pstmt.setDate(2, ab.getAl_release());
						pstmt.setString(3, ab.getAl_art_img());
						pstmt.setString(4, ab.getAl_agency());
						pstmt.setString(5, ab.getAl_content());
						
						pstmt.executeUpdate();
			}
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		CloseDB();
	}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
