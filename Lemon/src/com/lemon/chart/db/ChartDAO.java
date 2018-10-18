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
	
	public List getMuReadCount(){
		List<ChartBean> arr = new ArrayList<ChartBean>();
		ChartBean cb = new ChartBean();
		try {
			con = getCon();

			// sql 쿼리
			sql = "select music_sub (no,track_no,music_name,singer_name,lyrics,album_num,musicfile)"
					+ "values(null,?,?,?,?,?,?)";
			// pstmt 객체생성
			pstmt = con.prepareStatement(sql);
			

			// pstmt 객체 실행
			pstmt.executeQuery();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		
		return arr;
	}
	
	
	
	
	
	
	
	
	
}
