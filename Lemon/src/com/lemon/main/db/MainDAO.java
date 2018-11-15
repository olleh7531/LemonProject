package com.lemon.main.db;

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

import com.lemon.chart.db.ChartBean;



public class MainDAO {
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
	
	
	
	public List<SearchChartBean> realTimeRising(int minute){
		SearchChartBean scb = null;
		List<SearchChartBean> arr = new ArrayList<SearchChartBean>();
		int chk1=0;
		int chk2=0;
		int min1=minute-10;
		int min2=minute+10;
		try {
			con = getCon();
			
			// sql 쿼리
			sql = "select keyword,lately,past from( select sc_keyword keyword,sc_rank lately from search_chart where sc_date between"
					+ " DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL "+minute+" MINUTE) AND"
					+ " DATE_SUB(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL "+min1+" MINUTE), INTERVAL 1 SECOND)"
					+ " AND sc_date != DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1 SECOND) order by lately limit 10) d"
					+ " left outer join (select a.sc_keyword key2,a.sc_rank past from search_chart a,"
					+ "(select sc_keyword,sc_rank from search_chart where sc_date between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL "+minute+" MINUTE)"
					+ " AND DATE_SUB(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL "+min1+" MINUTE), INTERVAL 1 SECOND) AND"
					+ " sc_date != DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1 SECOND)"
					+ " order by sc_rank asc limit 10) b where a.sc_keyword=b.sc_keyword and a.sc_date between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL "+min2+"	MINUTE)"
					+ " AND DATE_SUB(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL "+minute+" MINUTE), INTERVAL 1 SECOND) AND"
					+ " a.sc_date != DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1	SECOND)) c on c.key2=d.keyword group by lately";
			// pstmt 객체생성
			pstmt = con.prepareStatement(sql);
			// pstmt 객체 실행
			// lately가 10분전 past가 20분전 자료
			rs = pstmt.executeQuery();
			while (rs.next()) {
				scb = new SearchChartBean();
				scb.setSc_keyword(rs.getString("keyword"));
				
				if(rs.getObject("past")!=null){	
				chk1=rs.getInt("past");
					
				chk2=rs.getInt("lately");
				scb.setSc_rank(chk1-chk2);
				}else{
					scb.setSc_rank(9999999);
				}
				arr.add(scb);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return arr;
	}
	public ArrayList<ChartBean> musicCountList00(String music_genre, int num) {
		ArrayList<ChartBean> cblist = new ArrayList<>();
		ChartBean cb = null;
		try {
			con = getCon();
			sql = "select * from album a inner join music b on a.al_num = b.album_num where music_genre = ? group by a.al_name order by a.al_release desc limit ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, music_genre);
			pstmt.setInt(2, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				cb = new ChartBean();
				cb.setAl_agency(rs.getString("al_agency"));
				cb.setAl_art_img(rs.getString("al_art_img"));
				cb.setAl_content(rs.getString("al_content"));
				cb.setAl_name(rs.getString("al_name"));
				cb.setAl_num(rs.getInt("al_num"));
				cb.setAl_release(rs.getDate("al_release"));
				cb.setAl_singer_name(rs.getString("al_singer_name"));
				cb.setAlbum_num(rs.getInt("album_num"));
				cb.setLyrics(rs.getString("lyrics"));
				cb.setMu_num(rs.getInt("mu_num"));
				cb.setMusic_genre(rs.getString("music_genre"));
				cb.setMusic_name(rs.getString("music_name"));
				cb.setMusic_time(rs.getString("music_time"));
				cb.setMusic_video(rs.getString("music_video"));
				cb.setMusicfile(rs.getString("musicfile"));
				cb.setSinger_num(rs.getInt("singer_num"));
				cb.setTrack_num(rs.getInt("track_num"));
				cblist.add(cb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return cblist;
	}

	public ArrayList<ChartBean> musicCountList01(String music_genre, int num) {
		ArrayList<ChartBean> cblist = new ArrayList<>();
		ChartBean cb = null;
		try {
			con = getCon();
			sql = "select * from album a inner join music b on a.al_num = b.album_num where music_genre = ? group by a.al_name order by a.al_release desc limit ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, music_genre);
			pstmt.setInt(2, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				cb = new ChartBean();
				cb.setAl_agency(rs.getString("al_agency"));
				cb.setAl_art_img(rs.getString("al_art_img"));
				cb.setAl_content(rs.getString("al_content"));
				cb.setAl_name(rs.getString("al_name"));
				cb.setAl_num(rs.getInt("al_num"));
				cb.setAl_release(rs.getDate("al_release"));
				cb.setAl_singer_name(rs.getString("al_singer_name"));
				cb.setAlbum_num(rs.getInt("album_num"));
				cb.setLyrics(rs.getString("lyrics"));
				cb.setMu_num(rs.getInt("mu_num"));
				cb.setMusic_genre(rs.getString("music_genre"));
				cb.setMusic_name(rs.getString("music_name"));
				cb.setMusic_time(rs.getString("music_time"));
				cb.setMusic_video(rs.getString("music_video"));
				cb.setMusicfile(rs.getString("musicfile"));
				cb.setSinger_num(rs.getInt("singer_num"));
				cb.setTrack_num(rs.getInt("track_num"));
				cblist.add(cb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return cblist;
	}

	public ArrayList<ChartBean> MusicImgList(int countimg) {
		ArrayList<ChartBean> cbimg = new ArrayList<>();
		ChartBean cb = null;
		try {
			con = getCon();
			sql = "select * from album a inner join music b on a.al_num = b.album_num group by a.al_name order by a.al_release desc limit ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, countimg);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				cb = new ChartBean();
				cb.setAl_agency(rs.getString("al_agency"));
				cb.setAl_art_img(rs.getString("al_art_img"));
				cb.setAl_content(rs.getString("al_content"));
				cb.setAl_name(rs.getString("al_name"));
				cb.setAl_num(rs.getInt("al_num"));
				cb.setAl_release(rs.getDate("al_release"));
				cb.setAl_singer_name(rs.getString("al_singer_name"));
				cb.setAlbum_num(rs.getInt("album_num"));
				cb.setLyrics(rs.getString("lyrics"));
				cb.setMu_num(rs.getInt("mu_num"));
				cb.setMusic_genre(rs.getString("music_genre"));
				cb.setMusic_name(rs.getString("music_name"));
				cb.setMusic_time(rs.getString("music_time"));
				cb.setMusic_video(rs.getString("music_video"));
				cb.setMusicfile(rs.getString("musicfile"));
				cb.setSinger_num(rs.getInt("singer_num"));
				cb.setTrack_num(rs.getInt("track_num"));
				cbimg.add(cb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return cbimg;
	}

	
	public List<com.lemon.main.db.ChartBean> realTimeMusic(int hour){
		com.lemon.main.db.ChartBean cb = null;
		List<com.lemon.main.db.ChartBean> arr = new ArrayList<com.lemon.main.db.ChartBean>();
		int chk1=0;
		int chk2=0;
		int hour1=hour-1;
		int hour2=hour+1;
		try {
			con = getCon();
			
			// sql 쿼리
			sql = "select ch_updatetime,ch_music_num,lately,past,music_name,al_singer_name,al_art_img from(select ch_updatetime,ch_music_num,ch_ranking lately,music_name,al_singer_name,al_art_img"
					+ " from chart,music,album where ch_updatetime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL "+hour+" HOUR) AND"
					+ " DATE_SUB(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL "+hour1+" HOUR), INTERVAL 1 SECOND) AND ch_updatetime != DATE_FORMAT(NOW(),'%Y-%m-%d %00:%02')"
					+ " and mu_num=ch_music_num and al_num=album_num order by lately) d left outer join (select a.ch_music_num chm2,a.ch_ranking past from chart a,"
					+ " (select ch_music_num,ch_ranking from chart where ch_updatetime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL "+hour+" HOUR)"
					+ " AND DATE_SUB(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL "+hour1+" HOUR), INTERVAL 1 SECOND) AND ch_updatetime != DATE_FORMAT(NOW(),'%Y-%m-%d %00:%02')) b"
					+ " where a.ch_music_num=b.ch_music_num and a.ch_updatetime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL "+hour2+" HOUR)"
					+ " AND DATE_SUB(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL "+hour+" HOUR), INTERVAL 1 SECOND) AND a.ch_updatetime != DATE_FORMAT(NOW(),'%Y-%m-%d %00:%02')) c"
					+ " on c.chm2=d.ch_music_num group by lately limit 10";
			// pstmt 객체생성
			pstmt = con.prepareStatement(sql);
			// pstmt 객체 실행
			// lately가 10분전 past가 20분전 자료
			rs = pstmt.executeQuery();
			while (rs.next()) {
				cb = new com.lemon.main.db.ChartBean();
				cb.setCh_num(rs.getInt("ch_music_num"));
				cb.setSinger_name(rs.getString("al_singer_name"));
				cb.setMusic_name(rs.getString("music_name"));
				cb.setAl_art_img(rs.getString("al_art_img"));
				Calendar cal = Calendar.getInstance();
				cal.setTimeInMillis(rs.getTimestamp("ch_updatetime").getTime());
				cal.add(Calendar.SECOND, -32400);
				
				Timestamp later = new Timestamp(cal.getTime().getTime());
				cb.setCh_updatetime(later);
				
				if(rs.getObject("past")!=null){	
				chk1=rs.getInt("past");
					
				chk2=rs.getInt("lately");
				cb.setCh_ranking(chk1-chk2);
				
				}else{
					cb.setCh_ranking(9999999);
				}
				arr.add(cb);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return arr;
	}
	
}
