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
			sql = "select max(no_num) from notice";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}
			
			// db 글 저장(insert)
			sql = "insert into notice(no_num, no_category, no_subject, no_content, no_readcount, no_reg_date) " 
			+ "values(?,?,?,?,?,now())";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, nb.getNo_category());
			pstmt.setString(3, nb.getNo_subject());
			pstmt.setString(4, nb.getNo_content());
			pstmt.setInt(5, 0);
			
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

			sql = "select count(*) from notice";
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
	
	public int getNoticeCount(String category) {
		int count = 0;
		// DB 연결
		try {
			con = getCon();
			
			if(category.equals("분류")) {
				category = "%";
			}
			
			sql = "select count(*) from notice where no_category like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
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
			sql = "select * from notice order by no_num desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				NoticeBean nb = new NoticeBean();
				nb.setNo_num(rs.getInt("no_num"));
				nb.setNo_category(rs.getString("no_category"));
				nb.setNo_subject(rs.getString("no_subject"));
				nb.setNo_content(rs.getString("no_content"));
				nb.setNo_reg_date(rs.getString("no_reg_date"));
				nb.setNo_readcount(rs.getInt("no_readcount"));
				
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
	
	public List getNoticeList(int startRow, int pageSize, String category) {
		List noticeList = new ArrayList();
		try {
			con = getCon();
			
			if(category.equals("분류")) {
				category = "%";
			}
			
			sql = "select * from notice where no_category like ? order by no_num desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setInt(2, startRow - 1);
			pstmt.setInt(3, pageSize);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				NoticeBean nb = new NoticeBean();
				nb.setNo_num(rs.getInt("no_num"));
				nb.setNo_category(rs.getString("no_category"));
				nb.setNo_subject(rs.getString("no_subject"));
				nb.setNo_content(rs.getString("no_content"));
				nb.setNo_reg_date(rs.getString("no_reg_date"));
				nb.setNo_readcount(rs.getInt("no_readcount"));
				
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
			sql = "update notice set no_readcount=no_readcount+1 where no_num=?";
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
			sql = "select * from notice where no_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				nb = new NoticeBean();
				
				nb.setNo_num(rs.getInt("no_num"));
				nb.setNo_category(rs.getString("no_category"));
				nb.setNo_subject(rs.getString("no_subject"));
				nb.setNo_content(rs.getString("no_content"));
				nb.setNo_reg_date(rs.getString("no_reg_date"));
				nb.setNo_readcount(rs.getInt("no_readcount"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return nb;
	}

	public void updateNotice(NoticeBean nb) {
		try {
			con = getCon();
			sql = "update notice set no_subject=?, no_category=? ,no_content=? where no_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nb.getNo_subject());
			pstmt.setString(2, nb.getNo_category());
			pstmt.setString(3, nb.getNo_content());
			pstmt.setInt(4, nb.getNo_num());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	
	public int deleteNotice(int num) {
		int check = 0;
		try {
			con = getCon();
			sql = "delete from notice where no_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			check = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return check;
	}
}