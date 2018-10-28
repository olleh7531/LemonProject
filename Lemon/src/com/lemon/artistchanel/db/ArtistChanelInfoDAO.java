package com.lemon.artistchanel.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ArtistChanelInfoDAO {
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
	
	// 정보 글쓰기
	public void infoWrite(ArtistChanelInfoBean aspbean) {
		int num = 0;
		
		try {
			con = getCon();
			System.out.println(con);
			// num 계산 -> 아티스트 정보 등록
			sql = "select max(num) from singer";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			}
			else {
				num = 1;
			}
			
			// sql - insert
			sql = "insert into singer("
						+ "num, activity_type, singer_name, si_group_name, debut_year,"
						+ "debut_song, si_agency, si_picture, si_genre, si_birth"
					+ ")"
					+ "values (?, ?, ?, ?, ?,"
						+ "?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num); // 가수 번호
			System.out.println(num);
			pstmt.setString(2, aspbean.getActivity_type()); // 솔로/그룹 유형
			System.out.println(aspbean.getActivity_type());
			pstmt.setString(3, aspbean.getSinger_name()); // 가수 활동 이름(예명)
			System.out.println(aspbean.getSinger_name());
			pstmt.setString(4, aspbean.getSi_group_name()); // 소속 그룹 이름
			System.out.println(aspbean.getSi_group_name());
			pstmt.setDate(5, aspbean.getDebut_year()); // 데뷔 날짜
			System.out.println(aspbean.getDebut_year());
			pstmt.setString(6, aspbean.getDebut_song()); // 데뷔 노래
			System.out.println(aspbean.getDebut_song());
			pstmt.setString(7, aspbean.getSi_agency()); // 소속사 이름
			System.out.println(aspbean.getSi_agency());
			pstmt.setString(8, aspbean.getSi_picture()); // 프로필 사진
			System.out.println(aspbean.getSi_picture());
			pstmt.setString(9, aspbean.getSi_genre()); // 노래 장르
			System.out.println(aspbean.getSi_genre());
			pstmt.setDate(10, aspbean.getSi_birth()); // 생일
			System.out.println(aspbean.getSi_birth());
			
			System.out.println("AArtist");
			pstmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			CloseDB();
		}
	}
	
	// 아티스트 번호 가져오기
	public int getArtistChanelInfoNum() {
		int count = 0;
		
		try {
			// 디비 연결
			con = getCon();
			
			// sql 작성 [count()]
			sql = "select max(num) from singer";
			
			// 객체 생성
			pstmt = con.prepareStatement(sql);
			
			// 객체 실행
			rs = pstmt.executeQuery();
			
			// 정보 있으면 저장
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			System.out.println("아티스트 채널 정보 번호 가져옴");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return count;
	}
	
	// 아티스트 번호에 해당하는 정보 가져오기
	public ArtistChanelInfoBean getArtistChanelInfo(int num) {
		ArtistChanelInfoBean acibean = null;
		
		try {
			con = getCon();
			
			sql = "select * from singer where num = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				acibean = new ArtistChanelInfoBean();
				
				// 솔로/그룹 유형
				acibean.setActivity_type(rs.getString("activity_type"));
				
				// 가수 활동 이름(예명)
				acibean.setSinger_name(rs.getString("singer_name"));
				
				// 소속 그룹 이름
				acibean.setSi_group_name(rs.getString("si_group_name"));
				
				// 데뷔 날짜
				acibean.setDebut_year(rs.getDate("debut_year"));
				
				// 데뷔 노래
				acibean.setDebut_song(rs.getString("debut_song"));
				
				// 소속사 이름
				acibean.setSi_agency(rs.getString("si_agency"));
				
				// 프로필 사진
				acibean.setSi_picture(rs.getString("si_picture"));
				
				// 노래 장르
				acibean.setSi_genre(rs.getString("si_genre"));
			
				// 생일
				acibean.setSi_birth(rs.getDate("si_birth"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return acibean;
	}
}