package com.lemon.admin.starpost.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AStarPostDAO {
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
	public void infoWrite(AStarPostBean aspbean) {
		int num = 0;
		
		try {
			con = getCon();
			
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
						+ "num, activity_type, singer_name, si_group_name, debut_year"
						+ "debut_song, si_agency, si_picture, si_genre, si_birth"
					+ ")";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num); // 가수 번호
			pstmt.setString(2, aspbean.getActivity_type()); // 솔로/그룹 유형
			pstmt.setString(3, aspbean.getSinger_name()); // 가수 활동 이름(예명)
			pstmt.setString(4, aspbean.getSi_group_name()); // 소속 그룹 이름
			pstmt.setDate(5, aspbean.getDebut_year()); // 데뷔 날짜
			pstmt.setString(6, aspbean.getDebut_song()); // 데뷔 노래
			pstmt.setString(7, aspbean.getSi_agency()); // 소속사 이름
			pstmt.setString(8, aspbean.getSi_picture()); // 프로필 사진
			pstmt.setString(9, aspbean.getSi_genre()); // 노래 장르
			pstmt.setDate(10, aspbean.getSi_birth()); // 생일
			
			pstmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}