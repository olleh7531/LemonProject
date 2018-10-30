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
			
			sql = "insert into member(email_id, pass, name, nickname, gender, birth, level, img, register_datetime, register_ip, is_deny, chk, email_cert, receive_email)"
					+ "values(?,?,?,?,?,"
					+ "?,?,?,now(),"
					+ "?,?,?,0,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getEmail_id());
			pstmt.setString(2, mb.getPass());
			pstmt.setString(3, mb.getName());
			pstmt.setString(4, mb.getNickname());
			pstmt.setString(5, mb.getGender());
			pstmt.setString(6, mb.getBirth());
			pstmt.setInt(7, 0);
			pstmt.setString(8, mb.getImg());
			pstmt.setString(9, mb.getReg_ip());
			pstmt.setInt(10, 0);
			pstmt.setInt(11, 0);
			pstmt.setInt(12, mb.getReceive_email());
			
			pstmt.executeUpdate();
			
			System.out.println("insert 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}

	// idCheck(email_id,pass)
	public int idCheck(String email_id,String pass){
		int check=-1;
		
		try {
			// 디비 연결(+드라이버로드)
			con = getCon();
			// sql 작성 & pstmt 객체 생성
			sql ="select pass from member where email_id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email_id);
			// sql 실행 & 결과저장
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
	// idCheck(email_id,pass)
	
	// updateMemPass()
	public int updateMemPass(String email_id, String crtPass, String newPass, String chkPass){
		int check =-1;

		try {
			con = getCon();
			
			sql = "select email_id, pass from member where email_id=? and pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email_id);
			pstmt.setString(2, crtPass);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(crtPass.equals(rs.getString("pass"))){
				    if(newPass.equals(chkPass)){
				    	sql="update member set pass=? where email_id=?"; 
				    	
				    	pstmt = con.prepareStatement(sql);
					    pstmt.setString(1, newPass);
					    pstmt.setString(2, email_id);
					    
					    pstmt.executeUpdate();
					    check =1;
				    }else{
				    	check =0;
				    } 					
				}else{
					check =-1;
				}				
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			CloseDB();
		}
		
		return check;
	}
	// updateMemPass()	
	
	// deleteMember(email_id,pass)
	public int deleteMember(String email_id, String pass){
		int check =-1;
		
		try {
			con = getCon();
			
			sql = "select pass from member where email_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(pass.equals(rs.getString("pass"))){
				     sql="delete from member where email_id=?";
				     pstmt = con.prepareStatement(sql);
				     pstmt.setString(1, email_id);
				     
				     pstmt.executeUpdate();
				     check =1;
					
				}else{
					check =0;
				}				
			}else{
				check =-1;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			CloseDB();
		}
		
		return check;
	}
	// deleteMember(email_id,pass)

	// getMember(email_id)
	public MemberBean getMember(String email_id) {
		MemberBean mb = null;
		
		try {
			con = getCon();
			
			sql ="select * from member where email_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				//내정보
				mb = new MemberBean();
				mb.setEmail_id(rs.getString("email_id"));
				mb.setName(rs.getString("name"));
				mb.setNickname(rs.getString("nickname"));
				mb.setGender(rs.getString("gender"));
				mb.setBirth(rs.getString("birth"));
				mb.setImg(rs.getString("img"));
				//추가정보
				mb.setMobile(rs.getString("mobile"));
				mb.setZip_code(rs.getString("zip_code"));
				mb.setAddress1(rs.getString("address1"));
				mb.setAddress2(rs.getString("address2"));
				mb.setReceive_email(rs.getInt("receive_email"));
				
				mb.setReg_date(rs.getDate("register_datetime"));
				mb.setEmail_cert(rs.getInt("email_cert"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return mb;
		
	}
	// getMember(email_id)

	// updateMember(mb)
	public int updateMember(MemberBean mb){
		int check =-1;

		try {
			con = getCon();
			
			sql ="select pass from member where email_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getEmail_id());
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				// 아이디 있음
				if(mb.getPass().equals(rs.getString("pass"))){
					// 비밀번호 맞는경우
					sql = "update member set name=?,nickname=?,gender=?,birth=?,img=?,mobile=?,zip_code=?,address1=?,address2=?,receive_email=? where email_id =?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, mb.getName());
					pstmt.setString(2, mb.getNickname());
					pstmt.setString(3, mb.getGender());
					pstmt.setString(4, mb.getBirth());
					pstmt.setString(5, mb.getImg());
					
					pstmt.setString(6, mb.getMobile());
					pstmt.setString(7, mb.getZip_code());
					pstmt.setString(8, mb.getAddress1());
					pstmt.setString(9, mb.getAddress2());
					pstmt.setInt(10, mb.getReceive_email());
					pstmt.setString(11, mb.getEmail_id());
										
					pstmt.executeUpdate();
					check =1;

				}else{
                    // 비밀번호 틀린경우
					check = 0;
				}
			}else{
				// 아이디 없음
				check = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			CloseDB();
		}		
		
		
		return check;
		
	}
	// updateMember(mb)

	// checkNick(nickname)
	public int checkNick(String nickname) {
		int check=0;
		
		try {
			con = getCon();
			
			sql ="select * from member where nickname=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nickname);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				check =1;
			}else{
				check =0;
			}
			System.out.println("아이디 중복 검사 완료 ");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			CloseDB();
		}
		
		return check;
	}
	// checkNick(nickname)
	
	// initMailAuth()
	public void initMailAuth(String code, String email_id) {
		try {
			con = getCon();

			sql = "update member set code=? where email_id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, code);
			pstmt.setString(2, email_id);
			
			pstmt.executeUpdate();
			
			System.out.println("update 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	// initMailAuth()

	// emailAuth(code)
	public void emailAuth(String code) {
		try {
			con = getCon();
			
			sql = "update member set email_cert=? where code=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 1);
			pstmt.setString(2, code);
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
	}
	// emailAuth(code)

}
