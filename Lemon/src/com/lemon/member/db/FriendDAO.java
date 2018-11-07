package com.lemon.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class FriendDAO {
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

	/* 친구 요청 메서드 */
	public int addFriend(FriendBean fb){
		int check = 0;
		
		try {
			con = getCon();
			
			sql = "select * from friends where receiver_nick=? and sender_nick=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, fb.getReceiver_nick());
			pstmt.setString(2, fb.getSender_nick());
			
			rs = pstmt.executeQuery();
			if(!rs.next()){
				sql = "select * from friends where receiver_nick=? and sender_nick=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, fb.getSender_nick());
				pstmt.setString(2, fb.getReceiver_nick());
				
				rs = pstmt.executeQuery();
	            if(!rs.next()){
	               sql="insert into friends(receiver_nick, sender_nick) values(?,?)";
	               pstmt = con.prepareStatement(sql);
	               pstmt.setString(1, fb.getReceiver_nick());
	               pstmt.setString(2, fb.getSender_nick());
	               
	               pstmt.executeUpdate();
	               System.out.println("친구 요청 성공!");
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
	
	// 친구 요청온 것 보기
	public ArrayList<String> requestFriend(String nickname){
		ArrayList<String> check = new ArrayList<String>();
		
		try {
			con = getCon();
			
			sql = "select * from friends where receiver_nick=? and fr_check=0";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nickname);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				check.add(rs.getString("sender_nick"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return check;
	}
	

}