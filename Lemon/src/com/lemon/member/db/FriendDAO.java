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
		System.out.println("addFriend 들어옴");
		int check = 0;
		
		System.out.println("Receiver : " + fb.getReceiver_nick());
		System.out.println("Sender : " + fb.getSender_nick());
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
	
	// 친구 목록 보기
	public ArrayList<String> listFriend(String nickname){
		ArrayList<String> friendList = new ArrayList<String>();
		
		try {
			con = getCon();
			sql = "select receiver_nick, sender_nick from friends "
				+ "where (receiver_nick=? and fr_check=1) or"
				+ "(sender_nick=? and fr_check=1)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nickname);
			pstmt.setString(2, nickname);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(rs.getString("sender_nick").equals(nickname)) {
					friendList.add(rs.getString("receiver_nick"));
				} else {
					friendList.add(rs.getString("sender_nick"));
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return friendList;
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
	
	// 친구요청 거절하기
	public void refuseFriend(String m_nickname, String f_nickname) {
		System.out.println(m_nickname);
		System.out.println(f_nickname);
		try {
			con = getCon();
			sql = "select * from friends where receiver_nick=? and sender_nick=? and fr_check=0";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_nickname);
			pstmt.setString(2, f_nickname);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				sql = "delete from friends where receiver_nick=? and sender_nick=? and fr_check=0";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, m_nickname);
				pstmt.setString(2, f_nickname);
				pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	
	// 친구요청 수락하기
	public void acceptionFriend(String m_nickname, String f_nickname) {
		try {
			con = getCon();
			sql = "select * from friends where receiver_nick=? and sender_nick=? and fr_check=0";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_nickname);
			pstmt.setString(2, f_nickname);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				sql = "update friends set fr_check=1 where receiver_nick=? and sender_nick=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, m_nickname);
				pstmt.setString(2, f_nickname);
				pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}

	// 친구상태 or 요청한 상태인지 확인하기
	public int FriendCheck(String m_nickname, String f_nickname) {
		int check= -1;
		
		try {
			con = getCon();
			
			// 친구인 상태
			sql = "select * from friends "
				+ "where (receiver_nick=? and sender_nick=? and fr_check=1) or"
					  + "(sender_nick=? and receiver_nick=? and fr_check=1)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_nickname);
			pstmt.setString(2, f_nickname);
			pstmt.setString(3, m_nickname);
			pstmt.setString(4, f_nickname);
			
			rs = pstmt.executeQuery();
			check = 1;
			
			if(!rs.next()) {
				// 친구를 요청한 상태
				sql = "select * from friends " + 
					  "where (receiver_nick=? and sender_nick=? and fr_check=0) or" + 
					  		"(sender_nick=? and receiver_nick=? and fr_check=0)";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, m_nickname);
				pstmt.setString(2, f_nickname);
				pstmt.setString(3, m_nickname);
				pstmt.setString(4, f_nickname);
				
				rs = pstmt.executeQuery();
				check = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return check;
	}
	
	// 친구 삭제하기
	public void deleteFriend(String m_nickname, String f_nickname) {
		System.out.println("친구 삭제하기");
		
		try {
			con = getCon();
			sql = "select * from friends "
					+ "where (receiver_nick=? and sender_nick=? and fr_check=1)"
					+ "or (sender_nick=? and receiver_nick=? and fr_check=1)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m_nickname);
			pstmt.setString(2, f_nickname);
			pstmt.setString(3, m_nickname);
			pstmt.setString(4, f_nickname);
			
			System.out.println("친구 삭제 1");
			rs = pstmt.executeQuery();			
			if(rs.next()) {
				sql = "delete from friends "
						+ "where (receiver_nick=? and sender_nick=? and fr_check=1)"
						+ "or (sender_nick=? and receiver_nick=? and fr_check=1)";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, m_nickname);
				pstmt.setString(2, f_nickname);
				pstmt.setString(3, m_nickname);
				pstmt.setString(4, f_nickname);
				
				System.out.println("친구 삭제 완료");
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	
	
	
	
	
	
	
	
	
}