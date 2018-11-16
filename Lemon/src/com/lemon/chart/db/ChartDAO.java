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
					+ "(select ch_music_num from chart where ch_updatetime =  " + "DATE_FORMAT(now(),'%Y-%m-%d %" + hour
					+ "') group by ch_num " + "order by sum(ch_playcnt*4+ch_downcnt*6) desc limit 3) as test) "
					+ "AND ch_updatetime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %" + hour + "'),	"
					+ "INTERVAL 23 HOUR) and DATE_FORMAT(NOW(),'%Y-%m-%d %" + hour
					+ "') and mu_num=ch_music_num order by " + "ch_music_num asc ,ch_updatetime asc";
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
				ch.setAl_singer_name(rs.getString("al_singer_name"));
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
				cb.setAl_singer_name(rs.getString("al_singer_name"));
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
				cb.setAl_singer_name(rs.getString("al_singer_name"));
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
				ch.setAl_singer_name(rs.getString("al_singer_name"));
				chartList.add(ch);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return chartList;
	}

	public String DownLoad(int mu_num) {
		String fileName = null;
		try {
			con = getCon();
			sql = "select musicfile from music where mu_num = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mu_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				fileName = rs.getString("musicfile");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return fileName;
	}

	public String[] DownLoads(int mu_num[]) {
		for(int i=0 ; i<mu_num.length ; i++) {
		}

		String fileName[] = new String[mu_num.length];
		
		try {
			con = getCon();
			for(int i=0 ; i<mu_num.length ; i++) {
				sql = "select musicfile from music where mu_num = ?;";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, mu_num[i]);
				
				rs = pstmt.executeQuery();
				if (rs.next()) {
					fileName[i] = rs.getString("musicfile");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return fileName;
	}
	
	public void insertPlaylog(String email_id, String file, String ip) {
		try {
			con = getCon();
			sql = "insert into playlog(pl_num,pl_user_email,pl_music_num,pl_playtime,pl_user_ip) values(null,?,(select mu_num from music where musicfile=?),now(),?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email_id);
			pstmt.setString(2, file);
			pstmt.setString(3, ip);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}

	public int insertDownloadlog(String user, String musicfile,String ip) {
		int check = -1;
		try {
			con = getCon();
			sql = "select * from download_log where do_user_email= ? AND do_music_num = (select mu_num from music where musicfile=?); ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user);
			pstmt.setString(2, musicfile);
			rs = pstmt.executeQuery();
			if (rs.next()) {
					check = 0;
			}else{
				sql = "insert into download_log(do_num,do_level,do_user_email,do_user_ip,do_music_num,do_downtime) "
						+ "values(null,0,?,?,(select mu_num from music where musicfile=?),now())";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, user);
				pstmt.setString(2, ip);
				pstmt.setString(3, musicfile);
				pstmt.executeUpdate();
				check = 1;
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return check;
	}
	
	
	public List<SearchChartBean> getSearchChart(String search){
		System.out.println("search : "+search);
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
//				scb.setSc_num(rs.getInt("sc_num"));
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
	
	
	
	public List<SearchChartBean> popularSearches(){
		SearchChartBean scb = null;
		List<SearchChartBean> arr = new ArrayList<SearchChartBean>();
		int chk1=0;
		int chk2=0;
		try {
			con = getCon();

			// sql 쿼리
			sql = "select a.sc_keyword,b.sc_rank,a.sc_rank from search_chart a, (select sc_keyword,sc_rank from search_chart where sc_date = DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1 DAY), INTERVAL 1 SECOND) order by sc_rank asc limit 10) b where a.sc_keyword=b.sc_keyword and a.sc_date = DATE_ADD(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 2 DAY), INTERVAL 1 SECOND) order by b.sc_rank";
			// pstmt 객체생성
			pstmt = con.prepareStatement(sql);
			// pstmt 객체 실행
			// b가 1일전 a가 2일전 자료
			rs = pstmt.executeQuery();
			while (rs.next()) {
				scb = new SearchChartBean();
				scb.setSc_keyword(rs.getString("a.sc_keyword"));

				chk1=rs.getInt("a.sc_rank");
				chk2=rs.getInt("b.sc_rank");
				scb.setSc_rank(chk1-chk2);
				arr.add(scb);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return arr;
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
					+ " a.sc_date != DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1	SECOND)) c on c.key2=d.keyword";
			// pstmt 객체생성
			pstmt = con.prepareStatement(sql);
			// pstmt 객체 실행
			// lately가 10분전 past가 20분전 자료
			rs = pstmt.executeQuery();
			while (rs.next()) {
				scb = new SearchChartBean();
				scb.setSc_keyword(rs.getString("sc_keyword"));
				
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
	
	
	// ppt용 수동 랭킹업데이트 메서드
	public void rankingupdate(){
		try {
			con = getCon();
			
			for(int i=0;i<48;i++){
				System.out.println(i);
			// sql 쿼리
			sql = "	update chart a,( SELECT b.*,@ROWNUM := @ROWNUM + 1 AS ch_ranking FROM (select ch_num,ch_music_num,ch_playcnt,ch_downcnt,ch_updatetime from chart where ch_updatetime =  DATE_SUB(DATE_FORMAT(now(),'%Y-%m-%d %H'), INTERVAL "+i+" HOUR) group by ch_num order by sum(ch_playcnt*4+ch_downcnt*6) desc) b, (SELECT @ROWNUM := 0) R ) b set a.ch_ranking = b.ch_ranking where a.ch_num=b.ch_num";
			// pstmt 객체생성
			pstmt = con.prepareStatement(sql);
			// pstmt 객체 실행
			// lately가 10분전 past가 20분전 자료
			pstmt.executeUpdate();
			}
			for(int i=0;i<48;i++){
				System.out.println(i);
				// sql 쿼리
				sql = "	update chart a,( SELECT b.*,@ROWNUM := @ROWNUM + 1 AS ch_ranking FROM (select ch_num,ch_music_num,ch_playcnt,ch_downcnt,ch_updatetime from chart where ch_updatetime =  DATE_ADD(DATE_FORMAT(now(),'%Y-%m-%d %H'), INTERVAL "+i+" HOUR) group by ch_num order by sum(ch_playcnt*4+ch_downcnt*6) desc) b, (SELECT @ROWNUM := 0) R ) b set a.ch_ranking = b.ch_ranking where a.ch_num=b.ch_num";
				// pstmt 객체생성
				pstmt = con.prepareStatement(sql);
				// pstmt 객체 실행
				// lately가 10분전 past가 20분전 자료
				pstmt.executeUpdate();
			}
			for(int i=0;i<100;i++){
				sql="update search_chart a,( SELECT b.*,@ROWNUM := @ROWNUM + 1 AS sc_rank FROM (select sc_num,sc_keyword,sc_date from search_chart where sc_date =  DATE_ADD(DATE_FORMAT(now(),'%Y-%m-%d %H'), INTERVAL "+i+"*10 MINUTE) group by sc_num order by sc_count desc) b, (SELECT @ROWNUM := 0) R ) b set a.sc_rank = b.sc_rank where a.sc_num=b.sc_num";
				pstmt = con.prepareStatement(sql);
				pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
	}
	
	
	
	public List<com.lemon.main.db.ChartBean> realTimeMusic(int hour,int startRow, int pageSize){
		com.lemon.main.db.ChartBean cb = null;
		List<com.lemon.main.db.ChartBean> arr = new ArrayList<com.lemon.main.db.ChartBean>();
		int chk1=0;
		int chk2=0;
		int hour2=hour+1;
		try {
			con = getCon();
			
			// sql 쿼리
			sql = "select ch_updatetime,ch_music_num,lately,past,music_name,al_singer_name,al_art_img,al_num,al_name,musicfile from(select ch_updatetime,ch_music_num,ch_ranking lately,music_name,al_singer_name,al_art_img,al_num,al_name,musicfile"
					+ " from chart,music,album where ch_updatetime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %"+hour2+"'), INTERVAL 1 HOUR) AND"
					+ " DATE_SUB(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %"+hour2+"'), INTERVAL 0 HOUR), INTERVAL 1 SECOND) AND ch_updatetime != DATE_FORMAT(NOW(),'%Y-%m-%d %00:%02')"
					+ " and mu_num=ch_music_num and al_num=album_num order by lately) d left outer join (select a.ch_music_num chm2,a.ch_ranking past from chart a,"
					+ " (select ch_music_num,ch_ranking from chart where ch_updatetime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %"+hour2+"'), INTERVAL 1 HOUR)"
					+ " AND DATE_SUB(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %"+hour2+"'), INTERVAL 0 HOUR), INTERVAL 1 SECOND) AND ch_updatetime != DATE_FORMAT(NOW(),'%Y-%m-%d %00:%02')) b"
					+ " where a.ch_music_num=b.ch_music_num and a.ch_updatetime between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %"+hour2+"'), INTERVAL 2 HOUR)"
					+ " AND DATE_SUB(DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %"+hour2+"'), INTERVAL 1 HOUR), INTERVAL 1 SECOND) AND a.ch_updatetime != DATE_FORMAT(NOW(),'%Y-%m-%d %00:%02')) c"
					+ " on c.chm2=d.ch_music_num order by lately limit ?,?";
			// pstmt 객체생성
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);
			// pstmt 객체 실행
			// lately가 1시간전 past가 2시간전 자료
			rs = pstmt.executeQuery();
			while (rs.next()) {
				cb = new com.lemon.main.db.ChartBean();
				cb.setCh_music_num(rs.getInt("ch_music_num"));
				cb.setSinger_name(rs.getString("al_singer_name"));
				cb.setMusic_name(rs.getString("music_name"));
				cb.setAl_art_img(rs.getString("al_art_img"));
				cb.setAl_num(rs.getInt("al_num"));
				cb.setAl_name(rs.getString("al_name"));
				cb.setMusicfile(rs.getString("musicfile"));
				cb.setCh_playcnt(rs.getInt("lately"));
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
	
	
	public List<com.lemon.main.db.ChartBean> GoodList2(List<com.lemon.main.db.ChartBean> chart) {
		// ArrayList<Integer> GoodNum = new ArrayList<>();
		ArrayList<com.lemon.main.db.ChartBean> Chart = new ArrayList<com.lemon.main.db.ChartBean>();
		try {
			con = getCon();
			sql = "select count(*) from good where go_text_num = ?";
			// int GoodNum = 0;
			for (int i = 0; i < chart.size(); i++) {
				com.lemon.main.db.ChartBean cb = chart.get(i);
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, cb.getCh_music_num());
				rs = pstmt.executeQuery();
				if (rs.next()) {
					cb.setMu_good(rs.getInt(1));
				}
				Chart.add(cb);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return Chart;
	}
	
	
	
	
	
	
	
	
	
}