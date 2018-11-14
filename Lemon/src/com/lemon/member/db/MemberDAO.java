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
		try {
			con = getCon();
			sql = "insert into member(email_id, pass, name, nickname, gender, "
					+ "birth, level, img, register_datetime, register_ip, " + "is_deny, chk, email_cert, receive_email)"
					+ "values(?,?,?,?,?," + "?,?,?,now(),?" + ",?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, mb.getEmail_id());
			pstmt.setString(2, mb.getPass());
			pstmt.setString(3, mb.getName());
			pstmt.setString(4, mb.getNickname());
			pstmt.setString(5, mb.getGender());

			pstmt.setString(6, mb.getBirth());
			pstmt.setInt(7, 0); // level (admin=1, other=0)
			pstmt.setString(8, mb.getImg());
			// now()로 reg_date 입력
			pstmt.setString(9, mb.getReg_ip());

			pstmt.setInt(10, 0); // is_deny=0
			pstmt.setInt(11, mb.getChk()); // chk (google/naver=1, other=0)
			pstmt.setInt(12, mb.getEmail_cert()); // email_crt=0;
			pstmt.setInt(13, mb.getReceive_email());

			pstmt.executeUpdate();

			System.out.println("insert 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}

	// idCheck(email_id)
	public int idCheck(String email_id) {
		int check = 0;

		try {
			// 디비 연결(+드라이버로드)
			con = getCon();
			// sql 작성 & pstmt 객체 생성
			sql = "select * from member where email_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email_id);
			// sql 실행 & 결과저장
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 이미 해당 아이디가 가입되어 있으면
				check = 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return check;
	}
	// idCheck(email_id)

	// idCheck(email_id,pass)
	public int idCheck(String email_id, String pass) {
		int check = -1;

		try {
			// 디비 연결(+드라이버로드)
			con = getCon();
			// sql 작성 & pstmt 객체 생성
			sql = "select pass from member where email_id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email_id);
			// sql 실행 & 결과저장
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 아이디 있음
				if (pass.equals(rs.getString("pass"))) {
					check = 1; // 비밀번호 맞음
				} else {
					// 비밀번호 틀림
					check = 0;
				}
			} else {
				// 아이디 없음
				check = -1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return check;
	}
	// idCheck(email_id,pass)

	public int chkCheck(MemberBean mb) {
		int check = -1;

		try {
			con = getCon();
			sql = "select chk from member where email_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getEmail_id());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				check = rs.getInt("chk");
			} else {
				System.out.println("else로 들어옴");
				check = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		System.out.println("DAO 클래스 내의 chkCheck : " + check);
		return check;
	}

	public int chkCheck(String email_id) {
		int check = -1;

		try {
			con = getCon();
			sql = "select chk from member where email_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				check = rs.getInt("chk");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return check;
	}

	// updateMemPass()
	public int updateMemPass(String email_id, String crtPass, String newPass, String chkPass) {
		int check = -1;

		try {
			con = getCon();

			sql = "select email_id, pass from member where email_id=? and pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email_id);
			pstmt.setString(2, crtPass);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (crtPass.equals(rs.getString("pass"))) {
					if (newPass.equals(chkPass)) {
						sql = "update member set pass=? where email_id=?";

						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, newPass);
						pstmt.setString(2, email_id);

						pstmt.executeUpdate();
						check = 1;
					} else {
						check = 0;
					}
				} else {
					check = -1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return check;
	}
	// updateMemPass()

	// deleteMember(email_id,pass)
	public int deleteMember(String email_id, String pass) {
		int check = -1;

		try {
			con = getCon();

			sql = "select pass from member where email_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (pass.equals(rs.getString("pass"))) {
					sql = "delete from member where email_id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, email_id);

					pstmt.executeUpdate();
					check = 1;

				} else {
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
	// deleteMember(email_id,pass)

	// getMember(email_id)
	public MemberBean getMember(String email_id) {
		MemberBean mb = null;

		try {
			con = getCon();

			sql = "select * from member where email_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 내정보
				mb = new MemberBean();
				mb.setEmail_id(rs.getString("email_id"));
				mb.setName(rs.getString("name"));
				mb.setNickname(rs.getString("nickname"));
				mb.setGender(rs.getString("gender"));
				mb.setBirth(rs.getString("birth"));
				mb.setImg(rs.getString("img"));
				mb.setChk(rs.getInt("chk"));

				// 추가정보
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
	public int updateMember(MemberBean mb) {
		int check = -1; // 일반 회원 체크용
		int chk = mb.getChk(); // 구글, 네이버 로그인 회원 체크용
		System.out.println("chk : " + chk);
		if (chk == 0) {
			try {
				con = getCon();

				sql = "select pass from member where email_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mb.getEmail_id());

				rs = pstmt.executeQuery();
				if (rs.next()) {
					// 아이디 있음
					if (mb.getPass().equals(rs.getString("pass"))) {
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
						check = 1;

					} else {
						// 비밀번호 틀린경우
						check = 0;
					}
				} else {
					// 아이디 없음
					check = -1;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				CloseDB();
			}
		} else {
			try {
				con = getCon();

				sql = "update member set name=?,nickname=?,gender=?,birth=?,img=?,mobile=?,zip_code=?,address1=?,address2=? where email_id =?";

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

				pstmt.setString(10, mb.getEmail_id());
				pstmt.executeUpdate();
				check = 1;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				CloseDB();
			}
		}

		return check;
	}
	// updateMember(mb)

	// checkNick(nickname)
	public int checkNick(String nickname) {
		int check = 0;

		try {
			con = getCon();

			sql = "select * from member where nickname=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nickname);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				check = 1; // 아이디 있음
			} else {
				check = 0; // 아이디 없음
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return check;
	}
	// checkNick(nickname)

	// getNick(String email_id)
	public String getNick(String email_id) {
		String nickname = null;
		try {
			con = getCon();

			sql = "select nickname from member where email_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email_id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				nickname = rs.getString("nickname");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return nickname;
	}

	// getNick(String email_id)

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

	// findID(name, mobile)
	public String findId(String name, String mobile) {
		String str = null;

		try {
			con = getCon();

			sql = "select email_id from member where name=? and mobile=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, mobile);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				str = rs.getString("email_id");
			} else {
				str = "없음";
			}
			System.out.println("아이디 찾기 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return str;
	}
	// findID(name, mobile)

	// findPW(id, mobile)
	public String findPw(String email_id, String name, String mobile) {
		String str = null;

		try {
			con = getCon();

			sql = "select pass from member where email_id=? and name=? and mobile=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email_id);
			pstmt.setString(2, name);
			pstmt.setString(3, mobile);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				str = rs.getString("pass");
			} else {
				str = "없음";
			}
			System.out.println("비밀번호 찾기 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return str;
	}
	// findPW(id, mobile)

	public int check_id(String email_id) {
		int check = 0;

		try {
			con = getCon();
			sql = "select email_id from member where email_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				check = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return check;
	}

	public void insertNMember(MemberBean mb) {
		try {
			con = getCon();
			sql = "insert into member(email_id, name, nickname, gender, "
					+ "birth, level, img, register_datetime, register_ip, " + "is_deny, chk, email_cert, receive_email)"
					+ "values(?,?,?,?," + "?,?,?,now(),?" + ",?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, mb.getEmail_id());
			pstmt.setString(2, mb.getName());
			pstmt.setString(3, mb.getNickname());
			pstmt.setString(4, mb.getGender());

			pstmt.setString(5, mb.getBirth());
			pstmt.setInt(6, 0); // level (admin=1, other=0)
			pstmt.setString(7, mb.getImg());
			// now()로 reg_date 입력
			pstmt.setString(8, mb.getReg_ip());

			pstmt.setInt(9, 0); // is_deny=0
			pstmt.setInt(10, mb.getChk()); // chk (google/naver=1, other=0)
			pstmt.setInt(11, mb.getEmail_cert()); // email_crt=0;
			pstmt.setInt(12, mb.getReceive_email());

			pstmt.executeUpdate();

			System.out.println("naver insert 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}

	public MemberBean nickname_img(String cmt_email) {
		MemberBean mb = null;
		try {
			con = getCon();
			sql = "select nickname, img from member where email_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cmt_email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mb = new MemberBean();
				mb.setNickname(rs.getString("nickname"));
				mb.setImg(rs.getString("img"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return mb;
	}

	public MemberBean MemberInfo(String nickname) {
		MemberBean mb = null;
		try {
			con = getCon();
			sql = "select * from member where nickname = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nickname);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				mb = new MemberBean();
				mb.setEmail_id(rs.getString("email_id"));
				mb.setName(rs.getString("name"));
				mb.setGender(rs.getString("gender"));
				mb.setBirth(rs.getString("birth"));
				mb.setImg(rs.getString("img"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return mb;
	}
	
	public int getLevel(String email_id) {
		int level = -1;
		
		try {
			con = getCon();
			sql = "select level from member where email_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email_id);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				level = rs.getInt("level");
			} else {
				level = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return level;
	}
	
	
}
