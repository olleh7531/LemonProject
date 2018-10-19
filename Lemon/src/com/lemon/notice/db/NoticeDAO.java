package com.lemon.notice.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class NoticeDAO {
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

	public void insertNotice(NoticeBean nb) {
		int num = 0;
		
		try {
			con = getCon();

			// 글 번호 no
			sql = "select max(num) from notice";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}
			
			// db 글 저장(insert)
			sql = "insert into notice(num, category, subject, content, readcount, reg_date, re_ref, re_lev, re_seq) " 
			+ "values(?,?,?,?,?,now(),?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, nb.getCategory());
			pstmt.setString(3, nb.getSubject());
			pstmt.setString(4, nb.getContent());
			pstmt.setInt(5, 0);
			pstmt.setInt(6, num);
			pstmt.setInt(7, 0);
			pstmt.setInt(8, 0);

			pstmt.executeUpdate();
			System.out.println("insert ok");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}

	public int getNoticeCount() {
		int count = 0;

		try {
			con = getCon();

			sql = "select count(*) from Notice";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return count;
	}

	public List getNoticeList(int startRow, int pageSize) {
		List noticeList = new ArrayList();

		try {
			con = getCon();
			sql = "select * from notice order by num desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				NoticeBean nb = new NoticeBean();
				nb.setNum(rs.getInt("num"));
				nb.setCategory(rs.getString("category"));
				nb.setSubject(rs.getString("subject"));
				nb.setContent(rs.getString("content"));
				nb.setReg_date(rs.getString("reg_date"));
				nb.setReadcount(rs.getInt("readcount"));

				// noticeList 한 칸에 저장

				noticeList.add(nb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return noticeList;
	}

	public void updateReadCount(int num) {
		try {
			con = getCon();
			sql = "update notice set readcount=readcount+1 where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}

	public NoticeBean getNotice(int num) {
		NoticeBean nb = null;
		try {
			con = getCon();
			sql = "select * from notice where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				nb = new NoticeBean();

				nb.setNum(rs.getInt("num"));
				nb.setCategory(rs.getString("category"));
				nb.setSubject(rs.getString("subject"));
				nb.setContent(rs.getString("content"));
				nb.setReg_date(rs.getString("reg_date"));
				nb.setReadcount(rs.getInt("readcount"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return nb;
	}

	public int updateNotice(NoticeBean nb) {
		int check = -1;

		try {
			con = getCon();
			sql = "select pass from notice where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, nb.getNum());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				sql = "update notice set subject=?, context=? where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, nb.getSubject());
				pstmt.setString(2, nb.getContent());
				pstmt.setInt(3, nb.getNum());

				pstmt.executeUpdate();
				check = 1;
			} else {
				check = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return check;
	}

	public int deleteNotice(int num, String pass) {
		int check = -1;
		System.out.println("1");
		try {
			con = getCon();
			sql = "select pass from notice where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			System.out.println("2");
			if (rs.next()) {
				if (pass.equals(rs.getString("pass"))) {
					sql = "delete from notice where no=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					check = 1;
					System.out.println("3");
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
}