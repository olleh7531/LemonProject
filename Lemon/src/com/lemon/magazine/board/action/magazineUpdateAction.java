package com.lemon.magazine.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lemon.magazine.board.db.BoardBean;
import com.lemon.magazine.board.db.BoardDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class magazineUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("BoardUpdateAction_execute()까지 실행!");

		// 한글처리
		request.setCharacterEncoding("UTF-8");

		// pageNum 파라미터 저장
		String pageNum = request.getParameter("pageNum");
		System.out.println("pageNum : " + pageNum);

		String realpath = request.getRealPath("/magazine/image");
		System.out.println("realpath : " + realpath);

		int maxSize = 10 * 1024 * 1024;

		MultipartRequest multi = new MultipartRequest(request, realpath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());

		BoardBean bb = new BoardBean();
		// bb.setMa_num(Integer.parseInt(request.getParameter("ma_num")));
		bb.setMa_subject(multi.getParameter("ma_subject"));
		bb.setMa_category(multi.getParameter("ma_category"));
		bb.setMa_content(multi.getParameter("ma_content"));
		bb.setMa_num(Integer.parseInt(multi.getParameter("num")));
		// System.out.println(request.getParameter("ma_num"));

		System.out.println(multi.getParameter("ma_subject"));
		System.out.println(multi.getParameter("ma_category"));
		System.out.println(multi.getParameter("ma_content"));

		if (multi.getFilesystemName("file") == null) {
			bb.setMa_file(multi.getParameter("file_select"));
		} else {
			bb.setMa_file(multi.getFilesystemName("file"));
		}
		System.out.println("파일 : " + bb.getMa_file());
		BoardDAO bdao = new BoardDAO();

		int check = bdao.updateBoard(bb);
		System.out.println(check);

		if (check == 1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('게시판 글 없음');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		} else if (check == -1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('게시판 글 없음');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('수정 성공!');");
		out.println("location.href='./magazineList.maga?pageNum="+pageNum+"';");
		out.println("</script>");
		out.close();

		return null;
	}

}
