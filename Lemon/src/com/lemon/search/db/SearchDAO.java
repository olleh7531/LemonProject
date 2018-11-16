package com.lemon.search.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.StringTokenizer;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.lemon.chart.db.SearchChartBean;

public class SearchDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	Connection con2 = null;
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
		if (con2 != null) {
			try {
				con2.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public int getSearchResultCount(String search) {
		int count = 0;

		try {
			con = getCon();

			sql = "select count(*)" + " from music, album" + " where lyrics like '%" + search
					+ "%' and al_num=album_num";
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

	public SearchBean ArtistProfileSearch(String search) {
		SearchBean sb = null;

		System.out.println(search);

		try {
			con = getCon();

			sql = "select * from singer where singer_name like '%" + search + "%' limit 1";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			rs = pstmt.executeQuery();
			if (rs.next()) {
				sb = new SearchBean();

				sb.setSi_num(rs.getInt("si_num"));
				sb.setSi_picture(rs.getString("si_picture"));
				sb.setSinger_name(rs.getString("singer_name"));
				sb.setSi_gender(rs.getString("si_gender"));
				sb.setActivity_type(rs.getString("activity_type"));
				sb.setSi_genre(rs.getString("si_genre"));
				sb.setSi_birth(rs.getDate("si_birth"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return sb;
	}

	public List<SearchBean> ArtistSearch(String search) {
		List<SearchBean> list = new ArrayList<SearchBean>();
		SearchBean sb = null;

		System.out.println(search);

		
		try {
			con = getCon();

			sql = "select si_num from singer where singer_name like '%" + search + "%' limit 1";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			int si_num = 0;
			
			if (rs.next()) {
				si_num = rs.getInt("si_num");
			}

			sql = "select * from singer where group_singer_num like '%,"+si_num+",%'";

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
	
			System.out.println("si_num : "+si_num);
			
			while (rs.next()) {
				String group_singer_num = rs.getString("group_singer_num");

				String group_num = rs.getString("group_singer_num").substring(1, rs.getString("group_singer_num").length() - 1);
				StringTokenizer g_number = new StringTokenizer(group_num, ",");
				
				while (g_number.hasMoreTokens()) {
					group_num = g_number.nextToken();

					sql2 = "select singer_name, si_gender, activity_type, si_genre, si_picture"
							+ " from singer where si_num = ? AND si_num NOT IN (" + si_num + ")";

					pstmt2 = con.prepareStatement(sql2);
					pstmt2.setInt(1, Integer.parseInt(group_num));
					rs2 = pstmt2.executeQuery();

					while (rs2.next()) {
						sb = new SearchBean();
						
						sb.setSi_num(rs.getInt("si_num"));
						sb.setSi_picture(rs.getString("si_picture"));
						sb.setSinger_name(rs.getString("singer_name"));
						sb.setSi_gender(rs.getString("si_gender"));
						sb.setActivity_type(rs.getString("activity_type"));
						sb.setSi_genre(rs.getString("si_genre"));

						list.add(sb);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
			CloseDB2();
		}

		return list;
	}

	public List<SearchBean> SongArtistSearch(String search) {
		List<SearchBean> list = new ArrayList<SearchBean>();
		SearchBean sb = null;

		try {
			con = getCon();

			sql = "SELECT m.music_name, a.al_singer_name, a.al_name, a.al_release, m.mu_num, m.album_num"
					+ " FROM music m,album a" + " WHERE m.album_num=a.al_num AND a.al_singer_name like'%" + search
					+ "%'" + " ORDER BY a.al_singer_name asc, a.al_release desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				sb = new SearchBean();

				sb.setMusic_name(rs.getString("music_name"));
				sb.setSinger_name(rs.getString("al_singer_name"));
				sb.setAl_name(rs.getString("al_name"));
				sb.setAl_release(rs.getDate("al_release"));
				sb.setMu_num(rs.getInt("mu_num"));
				sb.setAlbum_num(rs.getInt("album_num"));
				list.add(sb);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return list;
	}

	public List<SearchBean> SongMusicNameSearch(String search) {
		List<SearchBean> list = new ArrayList<SearchBean>();
		SearchBean sb = null;

		try {
			con = getCon();

			sql = "SELECT m.music_name, a.al_singer_name, a.al_name, a.al_release , m.mu_num, m.album_num " + " FROM music m,album a"
					+ " WHERE m.album_num=a.al_num and m.music_name like'%" + search + "%'"
					+ " ORDER BY m.music_name asc, a.al_release desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				sb = new SearchBean();

				sb.setMusic_name(rs.getString("music_name"));
				sb.setSinger_name(rs.getString("al_singer_name"));
				sb.setAl_name(rs.getString("al_name"));
				sb.setAl_release(rs.getDate("al_release"));
				sb.setMu_num(rs.getInt("mu_num"));
				sb.setAlbum_num(rs.getInt("album_num"));
				list.add(sb);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return list;
	}

	public List<SearchBean> SongAlbumNameSearch(String search) {
		List<SearchBean> list = new ArrayList<SearchBean>();
		SearchBean sb = null;

		try {
			con = getCon();

			sql = "SELECT m.music_name, a.al_singer_name, a.al_name, a.al_release , m.mu_num, m.album_num " + " FROM music m,album a"
					+ " WHERE m.album_num=a.al_num and a.al_name like'%" + search + "%'"
					+ " ORDER BY a.al_name asc, a.al_release desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				sb = new SearchBean();

				sb.setMusic_name(rs.getString("music_name"));
				sb.setSinger_name(rs.getString("al_singer_name"));
				sb.setAl_name(rs.getString("al_name"));
				sb.setAl_release(rs.getDate("al_release"));
				sb.setMu_num(rs.getInt("mu_num"));
				sb.setAlbum_num(rs.getInt("album_num"));
				list.add(sb);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return list;
	}

	public List<SearchBean> AlbumSearch(String search) {
		List<SearchBean> list = new ArrayList<SearchBean>();
		SearchBean sb = null;

		try {
			con = getCon();

			sql = "SELECT DISTINCT a.al_num, a.al_art_img, a.al_name, a.al_release, a.al_singer_name" 
					+ " FROM music m, album a"
					+ " WHERE m.album_num=a.al_num AND (a.al_name like'%"+search+"%' OR m.lyrics like '%"+search+"%' OR a.al_singer_name like '%"+search+"%')"
					+ " ORDER BY a.al_release desc, a.al_name asc limit 6";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				sb = new SearchBean();
				
				sb.setAl_num(rs.getInt("al_num"));
				sb.setAl_art_img(rs.getString("al_art_img"));
				sb.setAl_name(rs.getString("al_name"));
				sb.setAl_release(rs.getDate("al_release"));
				sb.setSinger_name(rs.getString("al_singer_name"));

				list.add(sb);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return list;
	}

	public List<SearchBean> LyricSearch(String search) {
		List<SearchBean> list = new ArrayList<SearchBean>();
		SearchBean sb = null;

		try {
			con = getCon();

			sql = "select mu_num,lyrics,music_name,al_name,al_singer_name" + " from music, album"
					+ " where lyrics like '%" + search + "%' and al_num=album_num"
					+ " order by (LENGTH(lyrics) - LENGTH((REPLACE(lyrics, '" + search + "', '')))) / LENGTH('" + search
					+ "') desc limit 0,6";

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				sb = new SearchBean();
				sb.setMu_num(rs.getInt("mu_num"));
				sb.setLyrics(rs.getString("lyrics"));
				sb.setMusic_name(rs.getString("music_name"));
				sb.setAl_name(rs.getString("al_name"));
				sb.setSinger_name(rs.getString("al_singer_name"));

				list.add(sb);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return list;
	}

	public void insertSearchLog(String email_id, String keyword, String ip) {
		try {
			con = getCon();
			System.out.println(email_id);

			sql = "INSERT INTO searchlog(se_num,se_keyword,se_date,se_ip,se_email,se_gender,se_generation) VALUES(null,?,now(),?,?,(SELECT gender FROM member WHERE email_id=?),(select IF(TRUNCATE(YEAR(now())-YEAR(birth) ,-1)>50, 50, IF(TRUNCATE(YEAR(now())-YEAR(birth) ,-1)<10,10,TRUNCATE(YEAR(now())-YEAR(birth) ,-1))) from member where email_id=?))";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setString(2, ip);
			pstmt.setString(3, email_id);
			pstmt.setString(4, email_id);
			pstmt.setString(5, email_id);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}

	public int checkSearchLog(String email_id, String keyword) {
		int check = 0;

		try {
			con = getCon();
			sql = "select se_num from searchlog where se_email=? and se_keyword=? AND se_date BETWEEN DATE_FORMAT(NOW(),'%Y-%m-%d %H') and DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i:%S')";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email_id);
			pstmt.setString(2, keyword);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				check = 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return check;
	}

	/* 가사 */
	// 검색 결과 카운트
	public int getLyricResultCount(String search) {
		int count = 0;

		try {
			con = getCon();

			sql = "select count(*)" + " from music, album" + " where lyrics like '%" + search
					+ "%' and al_num=album_num";
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

	// 가사 검색
	public List<SearchBean> LyricSearch(String search, int startRow, int pageSize, String sort) {
		// 1시간단위 차트
		List<SearchBean> list = new ArrayList<SearchBean>();
		SearchBean sb = null;

		System.out.println("가사 검색 : " + search);
		try {
			con = getCon();

			// sql 쿼리
			if (sort.equals("정확도순")) {
				sql = "select mu_num,lyrics,music_name,al_name,al_singer_name" + " from music, album" + " where lyrics like '%"
						+ search + "%' and al_num=album_num" + " order by (LENGTH(lyrics) - LENGTH((REPLACE(lyrics, '"
						+ search + "', '')))) / LENGTH('" + search + "') desc limit ?,?";
			} else if (sort.equals("최신순")) {
				sql = "select mu_num,lyrics,music_name,al_name,al_singer_name" + " from music, album" + " where lyrics like '%"
						+ search + "%' and al_num=album_num"
						+ " order by (select al_release from album where al_num=album_num) desc limit ?,?";
			} else if (sort.equals("가나다순")) {
				sql = "select mu_num,lyrics,music_name,al_name,al_singer_name" + " from music, album" + " where lyrics like '%"
						+ search + "%' and al_num=album_num" + " order by music_name asc limit ?,?";
			}

			// pstmt 객체생성
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);
			// pstmt 객체 실행

			rs = pstmt.executeQuery();
			while (rs.next()) {
				sb = new SearchBean();
				sb.setMu_num(rs.getInt("mu_num"));
				sb.setLyrics(rs.getString("lyrics"));
				sb.setMusic_name(rs.getString("music_name"));
				sb.setAl_name(rs.getString("al_name"));
				sb.setSinger_name(rs.getString("al_singer_name"));

				list.add(sb);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return list;
	}
	/* 가사 */

	/* 앨범 */
	// 검색 결과 카운트
	public int getAlbumResultCount(String search) {
		int count = 0;

		try {
			con = getCon();

			sql = "SELECT count(*)"
					+ " FROM album WHERE al_name IN(SELECT DISTINCT a.al_name"
					+ " FROM music m, album a"
					+ " WHERE m.album_num=a.al_num AND (a.al_name like '%"+search+"%' OR m.lyrics like '%"+search+"%' OR a.al_singer_name like '%"+search+"%'));";

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

	// 앨범 검색
	public List<SearchBean> AlbumSearch(String search, int startRow, int pageSize, String sort) {
		List<SearchBean> list = new ArrayList<SearchBean>();
		SearchBean sb = null;

		try {
			con = getCon();

			if (sort.equals("최신순")) {
				sql = "SELECT DISTINCT a.al_num, a.al_art_img, a.al_name, a.al_release, a.al_singer_name"
						+ " FROM music m, album a" 
						+ " WHERE m.album_num=a.al_num AND (a.al_name like '%"+search+"%' OR m.lyrics like '%"+search+"%' OR a.al_singer_name like '%"+search+"%')"
						+ " ORDER BY a.al_release desc, a.al_name asc limit ?,?";
			} else if (sort.equals("가나다순")) {
				sql = "SELECT DISTINCT a.al_num, a.al_art_img, a.al_name, a.al_release, a.al_singer_name"
						+ " FROM music m, album a" 
						+ " WHERE m.album_num=a.al_num AND (a.al_name like '%"+search+"%' OR m.lyrics like '%"+search+"%' OR a.al_singer_name like '%"+search+"%')"
						+ " ORDER BY a.al_name asc, a.al_release desc  limit ?,?";
			}

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				sb = new SearchBean();
				
				sb.setAl_num(rs.getInt("al_num"));
				sb.setAl_art_img(rs.getString("al_art_img"));
				sb.setAl_name(rs.getString("al_name"));
				sb.setAl_release(rs.getDate("al_release"));
				sb.setSinger_name(rs.getString("al_singer_name"));

				list.add(sb);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return list;
	}
	/* 앨범 */

	public List<SearchChartBean> getSearchChart(String search) {
		SearchChartBean scb = null;
		List<SearchChartBean> arr = new ArrayList<SearchChartBean>();
		try {
			con = getCon();

			// sql 쿼리
			sql = "select * from search_chart where sc_date BETWEEN DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 10 DAY) "
					+ "AND DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1 DAY) AND sc_keyword = ? order by sc_date asc";
			// pstmt 객체생성
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, search);
			// pstmt 객체 실행

			rs = pstmt.executeQuery();
			while (rs.next()) {
				scb = new SearchChartBean();
				scb.setSc_num(rs.getInt("sc_num"));
				scb.setSc_keyword(rs.getString("sc_keyword"));
				Calendar cal = Calendar.getInstance();
				cal.setTimeInMillis(rs.getTimestamp("sc_date").getTime());
				cal.add(Calendar.SECOND, -32400);

				Timestamp later = new Timestamp(cal.getTime().getTime());
				scb.setSc_date(later);
				scb.setSc_gender1(rs.getInt("sc_gender1"));
				scb.setSc_gender2(rs.getInt("sc_gender2"));
				scb.setSc_generation1(rs.getInt("sc_generation1"));
				scb.setSc_generation2(rs.getInt("sc_generation2"));
				scb.setSc_generation3(rs.getInt("sc_generation3"));
				scb.setSc_generation4(rs.getInt("sc_generation4"));
				scb.setSc_generation5(rs.getInt("sc_generation5"));
				scb.setSc_count(rs.getInt("sc_count"));
				arr.add(scb);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return arr;
	}

	public List<SearchChartBean> popularSearches() {
		SearchChartBean scb = null;
		List<SearchChartBean> arr = new ArrayList<SearchChartBean>();
		int chk1 = 0;
		int chk2 = 0;
		try {
			con = getCon();

			// sql 쿼리
			sql = "select a.sc_keyword,b.sc_rank,a.sc_rank,b.sc_date from search_chart a, (select sc_keyword,sc_rank,sc_date from search_chart where sc_date = DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1 DAY), INTERVAL 1 SECOND) order by sc_rank asc limit 10) b where a.sc_keyword=b.sc_keyword and a.sc_date = DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 2 DAY), INTERVAL 1 SECOND)order by b.sc_rank";
			// pstmt 객체생성
			pstmt = con.prepareStatement(sql);
			// pstmt 객체 실행
			// b가 1일전 a가 2일전 자료
			rs = pstmt.executeQuery();
			while (rs.next()) {
				scb = new SearchChartBean();
				scb.setSc_keyword(rs.getString("a.sc_keyword"));
				
				Calendar cal = Calendar.getInstance();
				cal.setTimeInMillis(rs.getTimestamp("b.sc_date").getTime());
				cal.add(Calendar.SECOND, -32400);
				
				Timestamp later = new Timestamp(cal.getTime().getTime());
				scb.setSc_date(later);

				chk1 = rs.getInt("a.sc_rank");
				chk2 = rs.getInt("b.sc_rank");
				scb.setSc_rank(chk1 - chk2);
				arr.add(scb);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return arr;
	}

}
