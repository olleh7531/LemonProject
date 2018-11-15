package com.lemon.magazine.board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	// 디비연결 메서드 생성
	private Connection getCon() throws Exception {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/Lemon");
		con = ds.getConnection();
		return con;
	}

	// 디비 자원해제
	public void CloseDB() {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	// insertBoard(bb)
	public void insertBoard(BoardBean bb) {
		int num = 0;

		try {
			con = getCon();

			// 글번호 num
			sql = "select max(ma_num) from magazine";

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}
			System.out.println("글번호 : " + num);

			// db글 저장(insert)
			sql = "insert into magazine(ma_num, ma_category, ma_subject, ma_content,"
					+ " ma_readcount,ma_file ,ma_register_date)  values(?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getMa_category());
			pstmt.setString(3, bb.getMa_subject());
			pstmt.setString(4, bb.getMa_content());
			pstmt.setInt(5, 0); // readcount 항상 0으로 초기화
			pstmt.setString(6, bb.getMa_file());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

	}

	// insertBoard(bb)
	// getBoardCount()
	public int getBoardCount() {
		int count = 0;

		try {
			con = getCon();

			sql = "select count(*) from magazine";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1) + 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return count;
	}

	// getBoardCount()
	// getBoardList(startRow,pageSize)
	public List getBoardList(int startRow, int pageSize) {
		List boardList = new ArrayList();

		try {
			con = getCon();

			sql = "select * from magazine order by ma_num desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardBean bb = new BoardBean();

				bb.setMa_num(rs.getInt("ma_num"));
				bb.setMa_subject(rs.getString("ma_subject"));
				bb.setMa_category(rs.getString("ma_category"));
				bb.setMa_content(rs.getString("ma_content"));
				bb.setMa_file(rs.getString("ma_file"));
				bb.setMa_date(rs.getDate("ma_register_date"));
				bb.setMa_readcount(rs.getInt("ma_readcount"));

				// boardList 한칸에 저장
				boardList.add(bb);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return boardList;
	}

	// getBoardList(startRow,pageSize)

	// updateReadcount(num)

	public void updateReadcount(int num) {

		try {
			con = getCon();
			sql = "update magazine set ma_readcount=ma_readcount+1 where ma_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

	}

	// updateReadcount(num)

	// getBoard(num)

	public BoardBean getBoard(int num) {
		BoardBean bb = null;
		try {
			// 디비 연결
			con = getCon();

			// sql 작성 : num에 해당하는 게시판글 정보 전체 가져오기 sql
			sql = "select * from magazine where ma_num=?"; // pstmt 객체 생성 pstmt
															// =
			pstmt = con.prepareStatement(sql); // pstmt 객체 실행 & rs 저장
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery(); // rs정보 있을때 -> bb 객체 생성후 저장 -> 리턴 if
			if (rs.next()) {
				bb = new BoardBean();
				bb.setMa_num(rs.getInt("Ma_num"));
				bb.setMa_subject(rs.getString("Ma_subject"));
				bb.setMa_category(rs.getString("Ma_category"));
				bb.setMa_content(rs.getString("Ma_content"));
				bb.setMa_readcount(rs.getInt("Ma_readcount"));
				bb.setMa_date(rs.getDate("Ma_register_date"));
				bb.setMa_file(rs.getString("ma_file"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return bb;
	}

	// getBoard(num)

	// updateBoard(bb)
	public int updateBoard(BoardBean bb) {
		int check = -1;
		try {
			con = getCon();

			// sql ="select pass from magazine where num=?";
			sql = "select ma_num from magazine where ma_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getMa_num());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getInt("ma_num") == bb.getMa_num()) {
					sql = "update magazine set ma_category=?,ma_subject=?,ma_content=?, ma_file=? where ma_num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, bb.getMa_category());
					pstmt.setString(2, bb.getMa_subject());
					pstmt.setString(3, bb.getMa_content());
					pstmt.setString(4, bb.getMa_file());
					pstmt.setInt(5, bb.getMa_num());
					pstmt.executeUpdate();
					check = 0;
				} else {
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

	public ArrayList<BoardBean> selectboardList(int startRow, int pageSize) {
		ArrayList<BoardBean> boardList = new ArrayList<>();
		BoardBean bb = null;

		try {
			con = getCon();

			sql = "select * from magazine order by ma_num desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				bb = new BoardBean();

				bb.setMa_num(rs.getInt("ma_num"));
				bb.setMa_subject(rs.getString("ma_subject"));
				bb.setMa_category(rs.getString("ma_category"));
				bb.setMa_content(rs.getString("ma_content"));
				bb.setMa_date(rs.getDate("ma_register_date"));
				bb.setMa_readcount(rs.getInt("ma_readcount"));
				bb.setMa_file(rs.getString("ma_file"));

				// boardList 한칸에 저장
				boardList.add(bb);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return boardList;
	}

	// deleteBoard(num)
	public void deleteBoard(int num) {
		try {
			con = getCon();

			sql = "delete from magazine where ma_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}

	// deleteBoard(num)

	// updateBoard(bb)
	// deleteBoard(num)
	// public void deleteBoard(int num) {
	//
	// try {
	// con = getCon();
	//
	// sql = "delete from magazine where ma_num=?";
	// pstmt = con.prepareStatement(sql);
	// pstmt.setInt(1, num);
	//
	// pstmt.executeUpdate();
	//
	// } catch (Exception e) {
	// e.printStackTrace();
	// } finally {
	// CloseDB();
	// }
	// }
	// deleteBoard(num,pass)

}
