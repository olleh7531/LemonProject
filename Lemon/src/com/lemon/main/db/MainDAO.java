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
				scb.setSc_keyword(rs.getString("keyword"));
				
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
	
	
}
