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
			
			sql = "insert into member1 (email_id, pass, name, nickname, gender, birth, level, img, num, reg_date, reg_ip, is_deny, chk)"
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
	
	public int idCheck(String id, String pass) {
		int check = -1;
		
		try {
			con = getCon();
			sql = "select pass from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("pass").equals(pass)) {
					check = 1;
				}
				else {
					check = 0;
				}
			} else {
				check = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}	
		return check;		
	}
	
	public MemberBean getMember(String id) {
		MemberBean mb = null;
		
		try {
			con = getCon();
			sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				/*mb = new MemberBean();
				mb.setId(rs.getString("id"));
				mb.setPass(rs.getString("pass"));
				mb.setName(rs.getString("name"));
				mb.setAge(rs.getInt("age"));
				mb.setGender(rs.getString("gender"));
				mb.setEmail(rs.getString("email"));
				mb.setReg_date(rs.getTimestamp("reg_date"));*/
			}						
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}		
		return mb;
	}
	
	public int updateMember(MemberBean mb) {
		int check = -1;
		
		try {
			con = getCon();
			sql = "select pass from member where id=?";
			pstmt = con.prepareStatement(sql);
			// pstmt.setString(1, mb.getId());
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 아이디 있음
				if(mb.getPass().equals(rs.getString("pass"))) {
					// 비밀번호 맞음 
					sql = "update member set name=?, age=?, gender=?, email=? where id=?";
					/*pstmt = con.prepareStatement(sql);
					pstmt.setString(1, mb.getName());
					pstmt.setInt(2, mb.getAge());
					pstmt.setString(3, mb.getGender());
					pstmt.setString(4, mb.getEmail());
					pstmt.setString(5, mb.getId());
					*/
					pstmt.executeUpdate();
					check = 1;
				} else {
					// 비밀번호 틀림
					check = 0;
				}
			} else { // 아이디 없음
				check = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return check;
	}
	
	public int deleteMember(String id, String pass) {
		int check = -1;
		
		try {
			con = getCon();
			sql = "select pass from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) { // 아이디 있음
				if(pass.equals(rs.getString("pass"))) {
					// 비밀번호 맞음 
					sql = "delete from member where id=? and pass=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					pstmt.setString(2, pass);
					
					pstmt.executeUpdate();
					check = 1;
				} else {
					// 비밀번호 틀림
					check = 0;
				}
			} else { // 아이디 없음
				check = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return check;
	}
	
	public List getMemberList(){
		List memberList = new ArrayList();
		
		try {
			con=getCon();
			
			sql ="select * from member";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				MemberBean mb = new MemberBean();
				
				/*mb.setAge(rs.getInt("age"));
				mb.setEmail(rs.getString("email"));
				mb.setGender(rs.getString("gender"));
				mb.setId(rs.getString("id"));
				mb.setName(rs.getString("name"));
				mb.setPass(rs.getString("pass"));
				mb.setReg_date(rs.getTimestamp("reg_date"));*/

				memberList.add(mb);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			CloseDB();
		}
		
		return memberList;
	}
}
