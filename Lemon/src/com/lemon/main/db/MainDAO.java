package com.lemon.main.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MainDAO {
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
	
	
	
	public List<SearchChartBean> realTimeRising(){
		SearchChartBean scb = null;
		List<SearchChartBean> arr = new ArrayList<SearchChartBean>();
		int chk1=0;
		int chk2=0;
		try {
			con = getCon();
			
			// sql 쿼리
			sql = "select a.sc_keyword,b.sc_rank,a.sc_rank from search_chart a,(select sc_keyword,sc_rank from search_chart where sc_date between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL 10 MINUTE) AND DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i'), INTERVAL 0 MINUTE) AND sc_date != DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1 SECOND) order by sc_rank asc limit 10) b where a.sc_keyword=b.sc_keyword and a.sc_date between DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 20 MINUTE) AND DATE_SUB(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 10 MINUTE) AND a.sc_date != DATE_ADD(DATE_FORMAT(NOW(),'%Y-%m-%d'), INTERVAL 1 SECOND) group by a.sc_keyword order by b.sc_rank";
			// pstmt 객체생성
			pstmt = con.prepareStatement(sql);
			// pstmt 객체 실행
			// b가 10분전 a가 20분전 자료
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
	
	
}
