package com.lemon.search.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class SearchDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	PreparedStatement pstmt2 = null;
	ResultSet rs2 = null;
	String sql2 = "";

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
	
	public void CloseDB2() {
		if (rs2 != null) {
			try {
				rs2.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (pstmt2 != null) {
			try {
				pstmt2.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public List lyricSearch(String search,String sort){
		// 1시간단위 차트
				List<SearchBean> arr = new ArrayList<SearchBean>();
				SearchBean sb = null;
				try {
					con = getCon();

					// sql 쿼리
					if(sort.equals("정확도순")){
						
					sql = "select * from music where lyrics like '%"+search+"%' group by mu_num"
							+ " order by (LENGTH(lyrics) - LENGTH((REPLACE(lyrics, '"+search+"', '')))) / LENGTH('"+search+"') desc";
					}else if(sort.equals("최신순")){
						sql = "select * from music where lyrics like '%"+search+"%' group by mu_num"
								+ " order by (select al_release from album where al_num=album_num) desc";
					}else if(sort.equals("가나다순")){
						sql = "select * from music where lyrics like '%"+search+"%' group by mu_num"
								+ " order by music_name asc";
					}
					// pstmt 객체생성
					pstmt = con.prepareStatement(sql);

					// pstmt 객체 실행

					rs=pstmt.executeQuery();
					while(rs.next()){
						sb = new SearchBean();
						sb.setMu_num(rs.getInt("mu_num"));
						sb.setLyrics(rs.getString("lyrics"));
						sb.setMusic_name(rs.getString("music_name"));
						sb.setAl_num(rs.getInt("album_num"));
						sb.setSi_num(rs.getInt("singer_num"));
						
						sql2 ="select al_name from album where al_num=?";
//						sql ="select al_name , singer_name from album,singer where al_num=? AND si_num=?";
						pstmt2 = con.prepareStatement(sql2);
						pstmt2.setInt(1, rs.getInt("album_num"));
//						pstmt.setInt(2, rs.getInt("singer_num"));
						rs2 = pstmt2.executeQuery();
						
						if(rs2.next()) {
							sb.setAl_name(rs2.getString("al_name"));
//							sb.setSinger_name(rs.getString("singer_name"));
							arr.add(sb);
						}
						
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					CloseDB();
				}

				return arr;
	}
	



}
