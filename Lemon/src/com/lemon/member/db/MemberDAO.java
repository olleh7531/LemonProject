package com.lemon.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
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
	
	public void insertMember(MemberBean mb) {
		int num = 1;
		
		try {
			con = getCon();
			sql = "select max(num) from member1";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				num = rs.getInt("max(num)") + 1;
			}
			
			sql = "insert into member (email_id, pass, name, nickname, gender, birth, level, img, num, reg_date, reg_ip, is_deny, chk)"
					+ "values(?,?,?,?,?,?,?,?,?,now(),?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getEmail_id());
			pstmt.setString(2, mb.getPass());
			pstmt.setString(3, mb.getName());
			pstmt.setString(4, mb.getNickname());
			pstmt.setString(5, mb.getGender());
			pstmt.setString(6, mb.getBirth());
			pstmt.setInt(7, 0);
			pstmt.setString(8, mb.getImg());
			pstmt.setInt(9, num);
			pstmt.setString(10, mb.getReg_ip());
			pstmt.setInt(11, 0);
			pstmt.setInt(12, 0);
			
			pstmt.executeUpdate();
			
			System.out.println("insert 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	
	// idCheck(id,pass)
	public int idCheck(String email_id, String pass){
		int check=-1;
		
		try {
			// 디비 연결(+드라이버로드)
			con = getCon();

			sql ="select pass from member where email_id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email_id);
			// email_id 실행 & 결과저장
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				// 아이디 있음
				if(pass.equals(rs.getString("pass"))){
					check = 1; //비밀번호 맞음
				}else{
					// 비밀번호 틀림
					check = 0;
				}
			}else{
				//아이디 없음
				check =-1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			CloseDB();
		}
		
		return check;
	}
	// idCheck(id,pass)
	
	// deleteMember(email_id, pass)
	public void deleteMember(String email_id) {
		try {
			con = getCon();
			
			sql = "delete from member where email_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email_id);
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	// deleteMember(email_id, pass)

}
