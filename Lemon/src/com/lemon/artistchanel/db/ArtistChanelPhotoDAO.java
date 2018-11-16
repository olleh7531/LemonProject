package com.lemon.artistchanel.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
	// 포토 글쓰기
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
			
			// 가수 번호
			pstmt.setInt(5, acpbean.getAr_singer_num());
			System.out.println(acpbean.getAr_singer_num());
			
			// 사진
			pstmt.setString(6, acpbean.getAr_photo());
			System.out.println(acpbean.getAr_photo());
			
			System.out.println("ArtistChanelPhotoDAO photoWrite(ArtistChanelPhotoBean acpbean) 포토 글 쓰기");
			
			pstmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			CloseDB();
		}
	}
	
	// 글 쓸 때 가수 번호 체크해서 해당 번호 가수 이름 가져오기
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
			
			System.out.println("ArtistChanelPhotoDAO singerCheckNum(int singerNum) 글 쓸 때 가수 번호 체크해서 해당 번호 가수 이름 가져오기");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return singer_name;
	}
	
	// 포토 해당 가수 번호 가져오기
	public int getArtistChanelPhotoNum() {
		int num = 0;
		
		try {
			// 디비 연결
			con = getCon();
			
			// sql 작성[count()]
			sql = "select max(ar_singer_num) from artist_photo";
			
			// 객체 생성
			pstmt = con.prepareStatement(sql);
			
			// 객체 실행
			rs = pstmt.executeQuery();
			
			// 정보 있으면 저장
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
			System.out.println("ArtistChanelPhotoDAO getArtistChanelPhotoNum() 포토 해당 가수 번호 가져오기");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return num;
	}
	
	// 포토 글 번호에 해당하는 정보 가져오기
	public ArtistChanelPhotoBean getSingerNum(int num) {
		ArtistChanelPhotoBean acpbean = null;
		
		try {
			con = getCon();
			
			sql = "select * from artist_photo where ar_num = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				acpbean = new ArtistChanelPhotoBean();
				
				// 번호
				acpbean.setAr_num(rs.getInt("ar_num"));
				
				// 제목
				acpbean.setAr_subject(rs.getString("ar_subject"));
				
				// 내용
				acpbean.setAr_content(rs.getString("ar_content"));
				
				// 등록한 날짜
				acpbean.setAr_registerdate(rs.getDate("ar_registerdate"));
				
				// 조회수
				acpbean.setAr_readcount(rs.getInt("ar_readcount"));
				
				// 가수 번호
				acpbean.setAr_singer_num(rs.getInt("ar_singer_num"));
				
				// 사진
				acpbean.setAr_photo(rs.getString("ar_photo"));
			}
			
			System.out.println("ArtistChanelPhotoDAO getSingerNum(int num) 포토 글 번호에 해당하는 정보 가져오기");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return acpbean;
	}
	
	// 해당 가수 포토 한 장씩 가져오기
	public List getPhotoSinger(int singer_num) {
		List photo = new ArrayList();
		
		try {
			con = getCon();
			
			sql = "select ar_num, ar_subject, ar_photo from artist_photo where ar_singer_num = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, singer_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {			
				ArtistChanelPhotoBean acpbean = new ArtistChanelPhotoBean();
				
				acpbean.setAr_num(rs.getInt("ar_num"));
				acpbean.setAr_photo(rs.getString("ar_photo"));
				acpbean.setAr_subject(rs.getString("ar_subject"));
				
				photo.add(acpbean);
			}
			
			System.out.println("ArtistChanelPhotoDAO getPhotoSinger(int singer_num) 해당 가수 포토 한 장씩 가져오기");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return photo;
	}
	
	// 페이지 처리
	// 포토 글 개수 가져오기
	public int getPhotoCount() {
		int count = 0;
		
		try {
			con = getCon();
			
			sql = "select count(*) from artist_photo";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			System.out.println("ArtistChanelPhotoDAO getPhotoCount() 포토 글 개수 가져오기");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return count;
	}
	
	// 포토 글 ( 최신 순 ) 리스트 가져오기
	public List getPhotoList(int startRow, int pageSize) {
		List photoList = new ArrayList();
		
		try {
			con = getCon();
			
			// 최신글 처음에
			sql = "select * from artist_photo order by ar_num desc limit ?, ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ArtistChanelPhotoBean acpbean = new ArtistChanelPhotoBean();
				
				acpbean.setAr_content(rs.getString("ar_content"));
				acpbean.setAr_num(rs.getInt("ar_num"));
				acpbean.setAr_photo(rs.getString("ar_photo"));
				acpbean.setAr_readcount(rs.getInt("ar_readcount"));
				acpbean.setAr_registerdate(rs.getDate("ar_registerdate"));
				acpbean.setAr_singer_num(rs.getInt("ar_singer_num"));
				acpbean.setAr_subject(rs.getString("ar_subject"));
				
				photoList.add(acpbean);
			}
			
			System.out.println("ArtistChanelPhotoDAO getPhotoList(int startRow, int pageSize) 포토 글 ( 최신 순 ) 리스트 가져오기");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return photoList;
	}
	
	// 조회수 증가
	public void photoUpdateReadcount(int num) {
		try {
			con = getCon();
			
			// 조회수(ar_readcount) 1씩 증가
			// 글 번호에 해당하는 글 조회수 1씩 증가
			sql = "update artist_photo set ar_readcount = ar_readcount + 1 where ar_num = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			// pstmt 객체 실행
			pstmt.executeQuery();
			
			System.out.println("ArtistChanelPhotoDAO photoUpdateReadcount(int num) 조회수 증가");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	
	// 글 번호에 해당하는 게시글 번호(내용) 가져오기
	public ArtistChanelPhotoBean getPhotoContentNum(int num) {
		ArtistChanelPhotoBean acpbean = null;
		try {
			con = getCon();
			// 글 번호에 해당하는 글 정보 모두 가져오기
			sql = "select * from artist_photo where ar_num = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,  num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				acpbean = new ArtistChanelPhotoBean();
				acpbean.setAr_content(rs.getString("ar_content"));
				acpbean.setAr_num(rs.getInt("ar_num"));
				acpbean.setAr_photo(rs.getString("ar_photo"));
				acpbean.setAr_readcount(rs.getInt("ar_readcount"));
				acpbean.setAr_registerdate(rs.getDate("ar_registerdate"));
				acpbean.setAr_singer_num(rs.getInt("ar_singer_num"));
				acpbean.setAr_subject(rs.getString("ar_subject"));
			}
			
			System.out.println("ArtistChanelPhotoDAO getPhotoContentNum(int num) 글 번호에 해당하는 게시글 가져오기");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return acpbean;
	}
	
	// 글 번호에 해당하는 게시글 번호(내용) 가져오기 - 슬라이더
	public List<ArtistChanelPhotoBean> getPhotoSlider() {
		List<ArtistChanelPhotoBean> photoList = new ArrayList<ArtistChanelPhotoBean>();
		
		try {
			con = getCon();
			
			// 최신글 처음에
			sql = "select * from artist_photo order by ar_num desc";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ArtistChanelPhotoBean acpbean = new ArtistChanelPhotoBean();
				
				acpbean.setAr_content(rs.getString("ar_content"));
				acpbean.setAr_num(rs.getInt("ar_num"));
				acpbean.setAr_photo(rs.getString("ar_photo"));
				acpbean.setAr_readcount(rs.getInt("ar_readcount"));
				acpbean.setAr_registerdate(rs.getDate("ar_registerdate"));
				acpbean.setAr_singer_num(rs.getInt("ar_singer_num"));
				acpbean.setAr_subject(rs.getString("ar_subject"));
				
				photoList.add(acpbean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return photoList;
	}
}