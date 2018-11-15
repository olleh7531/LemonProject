package com.lemon.artistchanel.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

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
	public void infoWrite(ArtistChanelInfoBean acibean) {
		int num = 0;
		
		try {
			con = getCon();
			System.out.println(con);
			// num 계산 -> 아티스트 정보 등록
			sql = "select max(si_num) from singer";
			
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
						+ "si_num, activity_type, singer_name, real_name,"
						+ "debut_year, debut_song, si_agency, si_picture,"
						+ "si_genre, si_birth, si_gender, group_singer_num"
					+ ")"
					+ "values (?, ?, ?, ?,"
						+ "?, ?, ?, ?,"
						+ "?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			
			// 가수 번호
			pstmt.setInt(1, num);
			System.out.println(num);
			
			// 솔로/그룹 유형
			pstmt.setString(2, acibean.getActivity_type());
			System.out.println(acibean.getActivity_type());
			
			// 가수 활동 이름(예명)/본명
			pstmt.setString(3, acibean.getSinger_name());
			System.out.println(acibean.getSinger_name());

			// 본명
			pstmt.setString(4, acibean.getReal_name());
			System.out.println(acibean.getReal_name());
			
			// 데뷔 날짜
			pstmt.setDate(5, acibean.getDebut_year());
			System.out.println(acibean.getDebut_year());
			
			// 데뷔 노래
			pstmt.setString(6, acibean.getDebut_song());
			System.out.println(acibean.getDebut_song());
			
			// 소속사 이름
			pstmt.setString(7, acibean.getSi_agency());
			System.out.println(acibean.getSi_agency());
			
			// 프로필 사진
			pstmt.setString(8, acibean.getSi_picture());
			System.out.println(acibean.getSi_picture());
			
			// 노래 장르
			pstmt.setString(9, acibean.getSi_genre());
			System.out.println(acibean.getSi_genre());
			
			// 생일
			pstmt.setDate(10, acibean.getSi_birth());
			System.out.println(acibean.getSi_birth());
			
			// 성별
			pstmt.setString(11, acibean.getSi_gender());
			System.out.println(acibean.getSi_gender());
			
			// 그룹 번호
			pstmt.setString(12, acibean.getGroup_singer_num());
			System.out.println(acibean.getGroup_singer_num());
			
			System.out.println("아티스트 정보 글쓰기");

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
			sql = "select max(si_num) from singer";
			
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
			
			sql = "select * from singer where si_num = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				acibean = new ArtistChanelInfoBean();
				
				// 아티스트 정보 글 번호
				acibean.setSi_num(rs.getInt("si_num"));
				
				// 솔로/그룹 유형
				acibean.setActivity_type(rs.getString("activity_type"));
				
				// 가수 활동 이름(예명)
				acibean.setSinger_name(rs.getString("singer_name"));
				
				// 본명
				acibean.setReal_name(rs.getString("real_name"));
				
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
				
				// 성별
				acibean.setSi_gender(rs.getString("si_gender"));
				
				System.out.println("+dddd+"+rs.getString("group_singer_num"));
				if(!rs.getString("group_singer_num").equals(",,")){
				// 그룹 번호
				acibean.setGroup_singer_num(rs.getString("group_singer_num"));
				}else{
					acibean.setGroup_singer_num(",0,");
				}
				
				// 그룹 이름 가져오기
				String g_singer_name = "";
				String group_num = rs.getString("group_singer_num").substring(1, rs.getString("group_singer_num").length() - 1);
				StringTokenizer g_number= new StringTokenizer(group_num,",");
				
				while(g_number.hasMoreTokens()) {
					group_num = g_number.nextToken();
					
					sql = "select singer_name from singer where si_num = ?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, Integer.parseInt(group_num));
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						g_singer_name+=rs.getString("singer_name")+",";
					}
				}
				
				// 그룹 멤버 이름
				acibean.setGroup_singer_name(g_singer_name);
				
				System.out.println("아티스트 번호에 해당하는 아티스트 정보 가져오기");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return acibean;
	}
	
	// 그룹 -> 그룹 멤버 한 명씩 가져오기
	public List getGroupMember(String g_singer_num){
		List group = new ArrayList();
		
		try {
			con = getCon();
			System.out.println("디비 연결 성공");

			String group_num = g_singer_num.substring(1, g_singer_num.length() - 1);
			StringTokenizer g_number= new StringTokenizer(group_num,",");
			
			while(g_number.hasMoreTokens()) {
				group_num = g_number.nextToken();
				
				sql = "select * from singer where si_num = ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(group_num));
				rs = pstmt.executeQuery();

				while(rs.next()) {
					ArtistChanelInfoBean acibean = new ArtistChanelInfoBean();
					
					acibean.setSi_num(rs.getInt("si_num"));
					acibean.setSi_picture(rs.getString("si_picture"));
					acibean.setSinger_name(rs.getString("singer_name"));
					acibean.setSi_gender(rs.getString("si_gender"));
					acibean.setActivity_type(rs.getString("activity_type"));
					acibean.setSi_genre(rs.getString("si_genre"));
					
					group.add(acibean);
				}
			}
			System.out.println("그룹 -> 그룹 멤버 불러오기 ");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return group;
	}
	
	// 솔로 -> 그룹에 솔로 번호 가지고 있는 그룹 불러오기
	public List<ArtistChanelInfoBean> getArtistChanelSoloGroupName(int num) {
		List singer_name = new ArrayList();
		
		try {
			con = getCon();
			
			sql = "select si_num, singer_name from singer where group_singer_num like '%," + num + ",%'";
			
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while(rs.next()) {
				ArtistChanelInfoBean acibean = new ArtistChanelInfoBean();
				
				// 가수 번호
				acibean.setSi_num(rs.getInt("si_num"));
				
				// 가수 활동 이름(예명)
				acibean.setSinger_name(rs.getString("singer_name"));
				
				singer_name.add(acibean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return singer_name;
	}
}