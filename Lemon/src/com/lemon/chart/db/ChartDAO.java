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

	public List getChart() {
		// 1시간단위 차트
		List<ChartBean1> arr = new ArrayList<ChartBean1>();
		ChartBean1 cb = null;
/*		최근 1시간 select 먼저 해서 높은그룹 3개를 뽑고
		(playcnt와downcnt 를 정렬한뒤 각각 limit로 3개를 가져온다
		 그 후 playcnt*4 + downcnt*6 을 하여 6개중 높은 3개의 nun을 구한다)
		-> where을 이용해 쿼리하나로 변경
		높은 3개의 그룹에 대하여 24시간을 select를 하고
		*4+*6을 한뒤 차트에서는 상수가 아닌 %의 그래프를 보여준다*/
		try {
			con = getCon();

			// sql 쿼리
			sql = "select ch_music_num from chart where ch_updatetime =  DATE_SUB"
					+"(DATE_FORMAT(now(),'%Y-%m-%d %H'),	INTERVAL 1 HOUR)  "
					+ "group by ch_num order by sum(ch_playcnt*4+ch_downcnt*6) desc limit 3";
			// pstmt 객체생성
			pstmt = con.prepareStatement(sql);

			// pstmt 객체 실행
			rs=pstmt.executeQuery();
			while(rs.next()){
				sql ="select * from chart where ch_num=? AND ch_updatetime between "
						+ "DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'),	INTERVAL 1 DAY)"
						+ "and DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H'), INTERVAL 1 HOUR)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rs.getInt("ch_music_num"));
				rs=pstmt.executeQuery();
				while(rs.next()){
					cb = new ChartBean1();
					cb.setCh_num(rs.getInt("ch_num"));
					cb.setCh_music_num(rs.getInt("ch_music_num"));
					cb.setCh_playcnt(rs.getInt("ch_playcnt"));
					cb.setCh_downcnt(rs.getInt("ch_downcnt"));
					cb.setCh_updatetime(rs.getDate("ch_updatetime"));
					arr.add(cb);
				}
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
			sql = "select * from album a inner join music b where "
					+ "b.album_num = a.al_num order by a.al_release desc  limit ?,?;";
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

}
