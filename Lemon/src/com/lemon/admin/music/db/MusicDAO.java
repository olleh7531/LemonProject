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
	
	public void insertMusic(MusicBean mb){
		try {
			con = getCon();
			int albumnum;
			albumnum=mb.getAlbum_num();
			if(albumnum!=0) {
				// sql 쿼리
				sql = "insert into music (mu_num,music_name,lyrics,musicfile,music_genre,music_time,album_num,track_num)"
						+ "values(null,?,?,?,?,?,?,?)";
				// pstmt 객체생성
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mb.getMusic_name());
				pstmt.setString(2, mb.getLyrics());
				pstmt.setString(3, mb.getMusicfile());
				pstmt.setString(4, mb.getMusic_genre());
				pstmt.setString(5, mb.getMusic_time());
				pstmt.setInt(6, albumnum);
				pstmt.setInt(7, mb.getTrack_num());

				// pstmt 객체 실행
				pstmt.executeUpdate();
			}else {
				
			// sql 쿼리
			sql = "insert into music (mu_num,music_name,lyrics,musicfile,music_genre,music_time,track_num)"
					+ "values(null,?,?,?,?,?,?)";
			// pstmt 객체생성
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getMusic_name());
			pstmt.setString(2, mb.getLyrics());
			pstmt.setString(3, mb.getMusicfile());
			pstmt.setString(4, mb.getMusic_genre());
			pstmt.setString(5, mb.getMusic_time());
			pstmt.setInt(6, mb.getTrack_num());

			// pstmt 객체 실행
			pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	
	
	public int insertAlbum(AlbumBean ab) {
		int albumnum=0;
		try {
			con = getCon();

//			System.out.println("앨범이름 : "+ab.getAl_name());
			sql="select al_num from album where al_name=? and al_release=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ab.getAl_name());
			pstmt.setDate(2, ab.getAl_release());
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				rs.last();
				if(rs.getRow()==1) {
					albumnum=rs.getInt("al_num");					
				}
			}else {
				sql ="insert into album (al_num,al_name,al_release,al_art_img,al_agency,al_content,al_singer_name)"
					+ "values(null,?,?,?,?,?,?)";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, ab.getAl_name());
					pstmt.setDate(2, ab.getAl_release());
					pstmt.setString(3, ab.getAl_art_img());
					pstmt.setString(4, ab.getAl_agency());
					pstmt.setString(5, ab.getAl_content());
					pstmt.setString(6, ab.getAl_singer_name());
					
					pstmt.executeUpdate();
					
					sql="select al_num from album where al_name=? and al_release=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, ab.getAl_name());
					pstmt.setDate(2, ab.getAl_release());
					
					rs=pstmt.executeQuery();
					
					rs.next();
					albumnum=rs.getInt("al_num");
			}
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		CloseDB();
	}
		return albumnum;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
