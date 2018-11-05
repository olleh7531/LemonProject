package com.lemon.artistchanel.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ArtistChanelPhotoDAO {
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
	public void photoWrite(ArtistChanelPhotoBean acpbean) {
		int num = 0;
		
		try {
			con = getCon();
			
			// num 계산 -> 아티스트 정보 등록
			sql = "select max(ar_num) from artist_photo";
			
			System.out.println("ar_num : " + 1);
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			}
			else {
				num = 1;
			}
			
			// sql - insert
			sql = "insert into artist_photo("
					+ "ar_num, ar_subject, ar_content, ar_registerdate,"
					+ "ar_readcount, ar_singer_num, ar_photo"
				+ ") "
				+ "values (?, ?, ?, now(), "
					+ "?, ?, ?)";
		
			pstmt = con.prepareStatement(sql);
			
			// 가수 번호
			pstmt.setInt(1, num);
			System.out.println(num);
			System.out.println("ar_num : " + 2);
			
			// 제목
			pstmt.setString(2, acpbean.getAr_subject());
			System.out.println(acpbean.getAr_subject());
			
			// 내용
			pstmt.setString(3, acpbean.getAr_content());
			System.out.println(acpbean.getAr_content());

			// 조회수
			pstmt.setInt(4, 0);
			System.out.println(acpbean.getAr_readcount());
			
			// 가수
			pstmt.setInt(5, acpbean.getAr_singer_num());
			System.out.println(acpbean.getAr_singer_num());
			
			// 사진
			pstmt.setString(6, acpbean.getAr_photo());
			System.out.println(acpbean.getAr_photo());
			
			System.out.println("아티스트 포토 글쓰기");
			
			pstmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			CloseDB();
		}
	}
	
	// 가수 번호 체크
	public String singerCheckNum(int singerNum) {
		String singer_name="";
		try {
			con = getCon();
			
			sql = "select singer_name from singer where si_num = ?";
			System.out.println("ar_num : " + 3);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, singerNum);
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()){
				singer_name=rs.getString("singer_name");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return singer_name;
	}
}