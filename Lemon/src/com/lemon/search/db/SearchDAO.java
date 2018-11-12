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
	
	public List<SearchBean> lyricSearch(String search,int startRow,int pageSize,String sort){
		// 1시간단위 차트
		List<SearchBean> resultList = new ArrayList<SearchBean>();
		SearchBean sb = null;
				
		System.out.println(search);
			try {
				con = getCon();

				// sql 쿼리
				if(sort.equals("정확도순")){
				sql = "select mu_num,lyrics,music_name,al_name"
						+ " from music, album"
						+ " where lyrics like '%"+search+"%' and al_num=album_num"
						+ " order by (LENGTH(lyrics) - LENGTH((REPLACE(lyrics, '"+search+"', '')))) / LENGTH('"+search+"') desc limit ?,?";	
				}else if(sort.equals("최신순")){
					sql = "select mu_num,lyrics,music_name,al_name"
							+ " from music, album"
							+ " where lyrics like '%"+search+"%' and al_num=album_num"
							+ " order by (select al_release from album where al_num=album_num) desc limit ?,?";
				}else if(sort.equals("가나다순")){
					sql = "select mu_num,lyrics,music_name,al_name"
							+ " from music, album"
							+ " where lyrics like '%"+search+"%' and al_num=album_num"
							+ " order by music_name asc limit ?,?";
				}
//				+ " ";
//				+ " ";
				// pstmt 객체생성
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow-1);
				pstmt.setInt(2, pageSize);
				// pstmt 객체 실행

				rs=pstmt.executeQuery();
				while(rs.next()){
					sb = new SearchBean();
					sb.setMu_num(rs.getInt("mu_num"));
					sb.setLyrics(rs.getString("lyrics"));
					sb.setMusic_name(rs.getString("music_name"));
					sb.setAl_name(rs.getString("al_name"));
					resultList.add(sb);
				}
				
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					CloseDB();
				}

				return resultList;
	}
	
	public int getSearchResultCount(String search){
		int count=0;
		
		try {
			con = getCon();
			
			sql ="select count(*)"
					+ " from music, album"
					+ " where lyrics like '%"+search+"%' and al_num=album_num";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return count;
	}
	
/*	public List<SearchBean> artistSearch(String search){
		List<SearchBean> list = new ArrayList<SearchBean>();
		SearchBean sb = null;
		
		System.out.println(search);
		
		try {
			con = getCon();
			
			sql ="select si_num from singer where singer_name like '%아이유%' limit 1";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs=pstmt.executeQuery();
			while(rs.next()){
				sb = new SearchBean();
				
				
				sb.setSi_num(rs.getInt("si_num"));
				sb.setActivity_type(rs.getString("activity_type"));
				sb.setSinger_name(rs.getString("singer_name"));
				sb.setReal_name(rs.getString("real_name"));
				sb.setDebut_year(rs.getDate("debut_year"));
				sb.setDebut_song(rs.getString("debut_song"));
				
				list.add(sb);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return list;
	}*/
	

	
}
