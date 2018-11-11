package com.lemon.chart.db;

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

	public List<ChartBean1> getChart(int hour) {
		// 1시간단위 차트
		List<ChartBean1> arr = new ArrayList<ChartBean1>();
		ChartBean1 cb = null;
		try {
			con = getCon();

			// sql 쿼리
			sql = "select ch_num,ch_music_num,ch_playcnt,ch_downcnt,ch_updatetime,music_name from chart,music where ch_music_num in (select ch_music_num from "
					+ "(select ch_music_num from chart where ch_updatetime =  "
					+ "DATE_FORMAT(now(),'%Y-%m-%d %"+hour+"') group by ch_num "
					+ "order by sum(ch_playcnt*4+ch_downcnt*6) desc limit 3) as test) "
					+ "AND ch_updatetime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %"+hour+"'),	"
					+ "INTERVAL 23 HOUR) and DATE_FORMAT(NOW(),'%Y-%m-%d %"+hour+"') and mu_num=ch_music_num order by "
					+ "ch_music_num asc ,ch_updatetime asc";
			// pstmt 객체생성
			pstmt = con.prepareStatement(sql);

			// pstmt 객체 실행

			rs = pstmt.executeQuery();
			while (rs.next()) {
					cb = new ChartBean1();
					cb.setCh_num(rs.getInt("ch_num"));
					cb.setCh_music_num(rs.getInt("ch_music_num"));
					cb.setCh_playcnt(rs.getInt("ch_playcnt"));
					cb.setCh_downcnt(rs.getInt("ch_downcnt"));
					cb.setMusic_name(rs.getString("music_name"));
					Calendar cal = Calendar.getInstance();
					cal.setTimeInMillis(rs.getTimestamp("ch_updatetime").getTime());
					cal.add(Calendar.SECOND, -32400);

					Timestamp later = new Timestamp(cal.getTime().getTime());

					cb.setCh_updatetime(later);
					arr.add(cb);
				}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return arr;
	}

	public ArrayList<ChartBean> selectChart(int startRow, int pageSize) {
		ArrayList<ChartBean> chartList = new ArrayList<>();
		ChartBean ch = null;
		try {
			con = getCon();
			sql = "select * from album a inner join music b "
					+ "on b.album_num = a.al_num order by a.al_release desc  limit ?,?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);
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

	public int getChartCount() {
		int count = 0;
		try {
			con = getCon();
			sql = "select count(*) from  album a inner join music b where b.album_num = a.al_num;";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return count;
	}

	public int userPlaryList(String user, int mu_num) {
		int check = -1;
		try {
			con = getCon();
			sql = "select count(pls_music_num) from playlist where pls_user_email= ? AND pls_music_num= ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user);
			pstmt.setInt(2, mu_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getInt(1) == 0) {
					check = 0;
					sql = "insert into playlist(pls_user_email, pls_music_num) values(?,?)";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, user);
					pstmt.setInt(2, mu_num);
					pstmt.executeUpdate();
				} else {
					check = 1;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return check;
	}

	public ChartBean selectMusizDetail(int mu_num) {
		ChartBean cb = null;
		try {
			con = getCon();
			sql = "select * from album a inner join music b where  b.album_num = a.al_num AND b.album_num = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mu_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cb = new ChartBean();
				cb.setAl_num(rs.getInt("al_num"));
				cb.setAl_name(rs.getString("al_name"));
				cb.setAl_release(rs.getDate("al_release"));
				cb.setAl_art_img(rs.getString("al_art_img"));
				cb.setMu_num(rs.getInt("mu_num"));
				cb.setMusic_name(rs.getString("music_name"));
				cb.setLyrics(rs.getString("lyrics"));
				cb.setMusicfile(rs.getString("musicfile"));
				cb.setMusic_genre(rs.getString("music_genre"));
				cb.setMusic_time(rs.getString("music_time"));
				cb.setAlbum_num(rs.getInt("album_num"));
				cb.setTrack_num(rs.getInt("track_num"));
				cb.setMusic_video(rs.getString("music_video"));
				cb.setSinger_num(rs.getInt("singer_num"));
				cb.setAl_agency(rs.getString("al_agency"));
				cb.setAl_content(rs.getString("al_content"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return cb;
	}

	public ArrayList<ChartBean> DetailMusizName(String name) {
		ChartBean cb = null;
		ArrayList<ChartBean> MusizList = new ArrayList<>();
		try {
			con = getCon();
			sql = "select * from album a inner join music b on b.album_num = a.al_num where a.al_name = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				cb = new ChartBean();
				cb.setAl_num(rs.getInt("al_num"));
				cb.setAl_name(rs.getString("al_name"));
				cb.setAl_release(rs.getDate("al_release"));
				cb.setAl_art_img(rs.getString("al_art_img"));
				cb.setAl_agency(rs.getString("al_agency"));
				cb.setAl_content(rs.getString("al_content"));
				cb.setMu_num(rs.getInt("mu_num"));
				cb.setMusic_name(rs.getString("music_name"));
				cb.setLyrics(rs.getString("lyrics"));
				cb.setMusicfile(rs.getString("musicfile"));
				cb.setMusic_genre(rs.getString("music_genre"));
				cb.setMusic_time(rs.getString("music_time"));
				cb.setSinger_num(rs.getInt("singer_num"));
				cb.setAlbum_num(rs.getInt("album_num"));
				cb.setTrack_num(rs.getInt("track_num"));
				cb.setMusic_video(rs.getString("music_video"));
				MusizList.add(cb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return MusizList;
	}

	public ArrayList<ChartBean> GoodList(ArrayList<ChartBean> chart) {
		// ArrayList<Integer> GoodNum = new ArrayList<>();
		ArrayList<ChartBean> Chart = new ArrayList<ChartBean>();
		try {
			con = getCon();
			sql = "select count(*) from good where go_text_num = ?";
			// int GoodNum = 0;
			for (int i = 0; i < chart.size(); i++) {
				ChartBean cb = chart.get(i);
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, cb.getMu_num());
				rs = pstmt.executeQuery();
				if (rs.next()) {
					cb.setMu_good(rs.getInt(1));
				}
				Chart.add(cb);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return Chart;
	}

	public ArrayList<ChartBean> selectalbumList(int startRow, int pageSize) {
		ArrayList<ChartBean> chartList = new ArrayList<>();
		ChartBean ch = null;
		try {
			con = getCon();
			sql = "select * from album a inner join music b "
					+ "on b.album_num = a.al_num GROUP BY a.al_num order by a.al_release desc  limit ?,?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);
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